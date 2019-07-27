library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity ulaw is
  port (
    sample    : in  std_logic_vector(15 downto 0);
    codeword  : out std_logic_vector(7 downto 0)
  );
end ulaw;


architecture algorithm of ulaw is

begin
  process
    variable sgn : std_logic_vector(7 downto 0) := b"00000000";
    variable chord : std_logic_vector(7 downto 0) := b"00000000";
    variable step : std_logic_vector(7 downto 0) := b"00000000";
    variable code : std_logic_vector(7 downto 0) := b"00000000";
  begin
    if (to_integer(signed(sample)) < 0) then
      sgn := b"10000000";
    end if;
    if (to_integer(signed(sample and "0000100000000000")) /= 0) then
      chord := "01110000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 8), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000010000000000")) /= 0) then
      chord := "01100000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 7), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000001000000000")) /= 0) then
      chord := "01010000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 6), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000000100000000")) /= 0) then
      chord := "01000000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 5), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000000010000000")) /= 0) then
      chord := "00110000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 4), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000000001000000")) /= 0) then
      chord := "00100000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 3), 8)) and "00001111";
    elsif (to_integer(signed(sample and "0000000000100000")) /= 0) then
      chord := "00010000";
      step := std_logic_vector(resize(shift_right(unsigned(sample), 2), 8)) and "00001111";
    else
      step := std_logic_vector(resize(shift_right(unsigned(sample), 1), 8)) and "00001111";
    end if;
    codeword <= sgn or chord or step;
    report "Entity: sample = " & integer'image(to_integer(unsigned(code)));
    wait;
  end process;

  -- process
  --   variable sgn : std_logic_vector(7 downto 0);
  --   variable step : std_logic_vector(7 downto 0);
  --   variable chord : std_logic_vector(7 downto 0);
  --   variable word : std_logic_vector(15 downto 0);
  --
  -- begin
  --   step := std_logic_vector(resize(unsigned(sample and "0000000000001111"), 8));
  --   chord := sample and "01110000";
  --   chord := std_logic_vector(shift_right(unsigned(sample), 4));
  --   if (signed(chord) /= 0) then
  --     word := std_logic_vector(shift_right(unsigned(sample), to_integer(signed(chord))));
  --   end if;
  -- end process;

end algorithm;
