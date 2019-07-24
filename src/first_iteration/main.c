#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "main.h"
#include <time.h>

int test = 1;
int head_test = 0;
#define HEAD_SIZE 0x4D

int main(int argc, char const *argv[]) {
  File f;
  Compressed c;
  // if (head_test) {
  //   f = ffile_opener(argv[1]);
  //   char *head = get_head(f);
  //   int i;
  //   for (i = 0; i < HEAD_SIZE; i ++) {
  //     printf("%c", head[i]);
  //   }
  //   printf("\n");
  //   return 0;
  // }
  if (test) {
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

  // if (!strncmp(argv[1], "-c", 2)) {
  //   f = ffile_opener(argv[2]);
  //   printf("%s\n", "Compressing file");
  //   double start = clock();
  //   c = compress_file(f);
  //   double end = clock();
  //   printf("%g\n", (double) (end - start));
  // } else if (!strncmp(argv[1], "-e", 2)) {
  //   c = cfile_opener(argv[2]);
  //   printf("%s\n", "Expanding file");
  //   f = expand(c);
  // }
  //
  // if (!strncmp(argv[1],"-c", 2) && argc > 4) {
  //   cwrite_to(c, argv[4]);
  // } else if (!strncmp(argv[1], "-e", 2) && argc > 4) {
  //   fwrite_to(f, argv[4]);
  // } else {
  //   printf("%s\n", "Usage: ./comp <mode> <file_name> -o <output_file_name>\nModes: -c -> compress,\n       -e -> expand");
  // }

  return 0;
}

// Compressed cfile_opener(const char *file_name) {
//   Compressed c;
//   FILE *fp = fopen(file_name, "rb");
//   if (fp == NULL) {
//     printf("File Not Found!\n");
//     c.size = -1;
//     c.data = NULL;
//     return c;
//   }
//   fseek(fp, 0L, SEEK_END);
//   long int res = ftell(fp);
//   fclose(fp);
//   // End of finding size of file
//   // Copy data of file into File struct
//   c.size = res;
//   c.data = calloc(res, sizeof(char));
//   fp = fopen(file_name, "rb");
//   int i = 0;
//   for (; i < res; i++) {
//     fscanf(fp, "%c", &c.data[i]);
//   }
//   return c;
// }

// void fwrite_to(File f, const char *file_name) {
//   FILE *fp = fopen(file_name, "wb");
//   int i;
//   for (i = 0; i < HEAD_SIZE; i++) {
//     fprintf(fp, "%c", f.header[i]);
//   }
//   for (i = HEAD_SIZE; i < f.size; i++) {
//     fprintf(fp, "%c", f.file_data[i]);
//   }
// }

// File expand(Compressed c) {
//   File f;
//   f.header = cget_head(c);
//   f.size = c.size * 2;
//   f.file_data = calloc(f.size, sizeof(char));
//   int i;
//   int j;
//   for (i = HEAD_SIZE, j = 0; i <= c.size; i++) {
//     short int word = expand_word(c.data[i]);
//     f.file_data[HEAD_SIZE + j++] = (word >> 8);
//     f.file_data[HEAD_SIZE + j++] = (word & 0xFF);
//   }
//   return f;
// }

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

// char *cget_head(Compressed c) {
//   char *head = calloc(HEAD_SIZE, sizeof(char));
//   memcpy(head, c.data, HEAD_SIZE);
//   // for(int i = 0; i < HEAD_SIZE; i++){
//   //   printf("%c", head[i]);
//   // }
//   return head;
// }

// void cwrite_to(Compressed c, const char *file_name) {
//   FILE *fp = fopen(file_name, "wb");
//   int i;
//   for (i = 0; i < HEAD_SIZE; i++) {
//     fprintf(fp, "%c", c.header[i]);
//   }
//   for (i = 0; i < c.size; i++) {
//     fprintf(fp, "%c", c.data[i]);
//   }
// }

// Compressed compress_file(File f) {
//   Compressed c;
//   c.header = get_head(f);
//   c.size = f.size/2;
//   c.data = calloc(c.size, sizeof(char));
//   int i = HEAD_SIZE;
//   int j = 0;
//   for (; i <= f.size; i += 2) {
//     c.data[j++] = compress_sample(f.file_data[i], f.file_data[i+1]);
//   }
//   return c;
// }

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

// File ffile_opener(const char *file_name) {
//   // Finding size of file
//   File file;
//   FILE *fp = fopen(file_name, "rb");
//   if (fp == NULL) {
//       printf("File Not Found!\n");
//       file.size = -1;
//       file.file_data = NULL;
//       return file;
//   }
//   fseek(fp, 0L, SEEK_END);
//   long int res = ftell(fp);
//   fclose(fp);
//   // End of finding size of file
//   // Copy data of file into File struct
//   file.size = res;
//   file.file_data = calloc(res, sizeof(char));
//   fp = fopen(file_name, "rb");
//   int i;
//   for (i = 0; i < res; i++) {
//     fscanf(fp, "%c", &file.file_data[i]);
//   }
//   // print_file(file);
//   return file;
// }

// char *get_head(File f) {
//   char *head = calloc(HEAD_SIZE, sizeof(char));
//   memcpy(head, f.file_data, HEAD_SIZE);
//   // for(int i = 0; i < HEAD_SIZE; i++){
//   //   printf("%c", head[i]);
//   // }
//   return head;
// }
