#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "main.h"
#include <time.h>

int test = 1;
int head_test = 0;
#define HEAD_SIZE 0x4D

int main(int argc, char const *argv[]) {
  short int sample = 0xEF00; // 1110 1111 0000 0000
  char sample1 = sample >> 8;
  char sample2 = sample & 0xFF;
  char code = compress_sample(sample1, sample2);
  short int expanded = expand_word(code);
  printf("Sample: %x\nCodeword: %x \nExpanded: %x\n\n", (unsigned short int)sample, code, (unsigned short int)expanded);
  int i;
  for (i = 0; i < 8; i ++) {
    sample = sample >> 1;
    sample &= ~(1 << (16 - i));
    sample1 = sample >> 8;
    sample2 = sample & 0xFF;
    code = compress_sample(sample1, sample2);
    expanded = expand_word(code);
    printf("%d Shift\nSample: %x\nCodeword: %x \nExpanded: %x\n\n", i + 1, (unsigned short int)sample, (unsigned char)code, (unsigned short int)expanded);
  }
  sample = 0xE300; // 1110 1111 0000 0000
  sample1 = sample >> 8;
  sample2 = sample & 0xFF;
  code = compress_sample(sample1, sample2);
  expanded = expand_word(code);
  printf("Sample: %x\nCodeword: %x \nExpanded: %x\n\n", (unsigned short int)sample, code, (unsigned short int)expanded);
  for (i = 0; i < 8; i ++) {
    sample = sample >> 1; // 0011 1101 1110 000 ->
    sample &= ~(1 << (16 - i));
    sample1 = sample >> 8;
    sample2 = sample & 0xFF;
    code = compress_sample(sample1, sample2);
    expanded = expand_word(code);
    printf("%d Shift\nSample: %x\nCodeword: %x \nExpanded: %x\n\n", i + 1, (unsigned short int)sample, (unsigned char)code, (unsigned short int)expanded);
  }
  printf("%s\n", "0x0000 Test");
  sample = 0x0000;
  sample1 = sample >> 8;
  sample2 = sample & 0xFF;
  code = compress_sample(sample1, sample2);
  expanded = expand_word(code);
  printf("Sample: %x\nCodeword: %x \nExpanded: %x\n\n", (unsigned short int)sample, (unsigned char)code, (unsigned short int)expanded);
  return 0;
}

short int expand_word(char code) {
  short int word = 0;
  char chord = (code >> 4) & 0x7;

  short int step = code & 0xF;
  word = step << (chord + 1);
  // printf("%x %x\n", step, chord);
  if (chord)
    word |= (1 << (chord + 5));
  if (code > 0) {
    // printf("%s\n", "here");
    word *= -1;
  }
  return word;
}

char compress_sample(char b1, char b2) {
  char codeword;
  short int sample = (b1 << 8) | (0xFF & b2);
  char sign = get_sign(sample);
  short int mag = get_magnitude(sample);
  char chord = get_chord(mag);
  char step = get_step(mag, chord);
  chord = (chord << 4) & 0xFF;
  codeword = sign | chord | step;
  return codeword;
}

char get_step(short int mag, char chord) {
  char step;
  step = (mag >> (chord + 1)) & 0xF;
  return step;
}

char get_chord(short int mag) {
  char chord = 0;
  int i;
  for (i = 12; i > 4; i--) {
    if (mag & (1 << i)) {
      chord = i - 5;
      return chord;
    }
  }
  return chord;
}

short int get_magnitude(short int sample) {
  if (sample < 0) {
    sample *= -1;
  }
  return sample;
}

char get_sign(short int sample) {
  if (sample < 0) {
    return 0;
  } else {
    return 0x80;
  }
}
