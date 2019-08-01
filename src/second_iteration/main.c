#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "main.h"
#include <time.h>

int test = 0;
int time_test = 1;
int head_test = 0;
#define HEAD_SIZE 0x4D

int main(int argc, char const *argv[]) {
  File f;
  Compressed c;

  int i;
  if (time_test) {
    int i, j;
    clock_t cstart, cend;
    double total, average = 0;
    for (i = 0; i < 20; i++) {
      cstart = clock();
      for (j = 0; j < 10000000; j++) {
        compress_sample(0x01, 0xC0);
      }
      cend = clock();
      double temp = (double)(cend - cstart);
      printf("%f\n", temp);
      total += temp;
    }
    average = total/i;

    printf("Average time to compress: %f\n", average/CLOCKS_PER_SEC);
    average = 0;
    total = 0;
    for (i = 0; i < 20; i++) {
      cstart = clock();
      for (j = 0; j < 10000000; j++) {
        expand_word(0x7F);
      }
      cend = clock();
      printf("%lu\n", ((cend - cstart)));
      double temp = (double)(cend - cstart);
      total += temp;
    }
    average = total/i;
    printf("Average time to expand: %f\n", average/CLOCKS_PER_SEC);
    return 0;
  }
  short int sample = 0xEF00; // 1110 1111 0000 0000
  char sample1 = sample >> 8;
  char sample2 = sample & 0xFF;
  char code = compress_sample(sample1, sample2);
  // printf("Sample: %x\nCodeword: %x \nExpanded: %x\n\n", (unsigned short int)sample, code, (unsigned short int)expanded);

  short int expanded = expand_word(code);
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
    sample = sample >> 1;
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
  register short int word = 0;
  register char chord = (code >> 4) & 0x7;

  short int step = code & 0xF;
  word = step << (chord + 1);
  if (chord)
    word |= (1 << (chord + 5));
  if (code > 0)
    word *= -1;
  return word;
}

char compress_sample(char b1, char b2) {
  register short int sample = (b1 << 8) | (0xFF & b2);
  char codeword = 0;
  char sign = 0x80;
  char step = 0;
  short int mag = 0;
  char chord = 0;

  if (sample < 0) {
    sample *= -1;
    sign = 0;
  }

  if (sample & (0x1000)) {
    chord = 0x70;
    step = (sample >> 8) & 0xF;
  } else if (sample & (0x0800)) {
    chord = 0x60;
    step = (sample >> 7) & 0xF;
  } else if (sample & (0x0400)) {
    chord = 0x50;
    step = (sample >> 6) & 0xF;
  } else if (sample & (0x0200)) {
    chord = 0x40;
    step = (sample >> 5) & 0xF;
  } else if (sample & (0x0100)) {
    chord = 0x30;
    step = (sample >> 4) & 0xF;
  } else if (sample & (0x0080)) {
    chord = 0x20;
    step = (sample >> 3) & 0xF;
  } else if (sample & (0x0040)) {
    chord = 0x10;
    step = (sample >> 2) & 0xF;
  } else {
    step = (sample >> 1) & 0xF;
  }

  codeword = sign | chord | step;
  return codeword;
}
