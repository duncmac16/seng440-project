library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity ulaw is
  port (
    mode     : in  std_logic;
    inp      : in  std_logic_vector(15 downto 0);
    output1  : out std_logic_vector(15 downto 0)
  );
end ulaw;


architecture algorithm of ulaw is

  signal input1 : std_logic_vector(15 downto 0) := "0000000000000000";
  signal input2 : std_logic_vector(15 downto 0) := "0000000000000000";
  signal SysClk : std_logic := '0';
  signal done : std_logic := '1';

begin
  process (input1)
    variable sgn : std_logic_vector(7 downto 0) := b"00000000";
    variable chord : std_logic_vector(7 downto 0) := b"00000000";
    variable step : std_logic_vector(7 downto 0) := b"00000000";
    variable code : std_logic_vector(15 downto 0) := b"0000000000000000";
    variable sample : std_logic_vector(15 downto 0) := "0000000000000000";


  begin
    sample := input1;
    report "Entity: sample in  = " & integer'image(to_integer(unsigned(sample)));
    if (to_integer(signed(sample)) < 0) then
      sgn := b"10000000";
      sample := std_logic_vector(-signed(sample));
    end if;
    if (to_integer(signed(sample and "0001000000000000")) /= 0) then
      chord := "01110000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 8), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000100000000000")) /= 0) then
      chord := "01100000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 7), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000010000000000")) /= 0) then
      chord := "01010000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 6), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000001000000000")) /= 0) then
      chord := "01000000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 5), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000000100000000")) /= 0) then
      chord := "00110000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 4), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000000010000000")) /= 0) then
      chord := "00100000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 3), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000000001000000")) /= 0) then
      chord := "00010000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 2), 8)) and "00001111";
    else
      step := std_logic_vector(resize(shift_right(unsigned(sample), 1), 8)) and "00001111";
      chord := "00000000";
    end if;
    input2 <= std_logic_vector(resize(unsigned(sgn or chord or step), 16));

    -- output1 <= std_logic_vector(resize(unsigned(sgn or chord or step), 16));
    report "Entity: code out   = " & integer'image(to_integer(unsigned(input2)));
  end process;

  process (input2, input1)
    variable sgn : std_logic_vector(7 downto 0);
    variable step : std_logic_vector(7 downto 0);
    variable chord : std_logic_vector(7 downto 0);
    variable word : std_logic_vector(15 downto 0);
    variable code : std_logic_vector(7 downto 0);

  begin
    code := std_logic_vector(resize(unsigned(input2 and "0000000011111111"), 8));
    report "Entity: code in    = " & integer'image(to_integer(unsigned(code)));
    step := code and "00001111";
    step := step or "00010000";
    chord := code and "01110000";
    chord := std_logic_vector(shift_right(unsigned(chord), 4));
    -- report "Entity: step       = " & integer'image(to_integer(signed(step)));
    -- report "Entity: chord      = " & integer'image(to_integer(signed(chord)));
    if (signed(chord) /= 0) then
      word := std_logic_vector(shift_left(resize(unsigned(step), 16), to_integer(signed(chord)) + 1));
    end if;
    if (signed(code) < 0) then
      word := std_logic_vector(-signed(word));
    end if;
    output1 <= word;
    -- report "Entity: sample out = " & integer'image(to_integer(unsigned(input1)));
    report "Entity: sample out = " & integer'image(to_integer(unsigned(word)));
  end process;

  Clock : process
  begin
    SysClk <= '0';
    wait for 0.5 ns;
    SysClk <= '1';
    wait for 0.5 ns;
  end process Clock;

  Simulation : process
  begin
    wait for 65535 ns;
    assert FALSE Report "Simulation Finished" severity FAILURE;
  end process Simulation;

  Increment : process (SysClk, input1)
  begin
    if rising_edge(SysClk) then
      input1 <= std_logic_vector(1 + (signed(input1)));
      -- report "Entity: input = " & integer'image(to_integer(unsigned(input1)));
    end if;
  end process Increment;


end algorithm;
