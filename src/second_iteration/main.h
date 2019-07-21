#ifndef MAIN_H_
#define MAIN_H_

typedef struct file {
  char * header;
  long int size;
  char *file_data;
} File;

typedef struct comp {
  long int size;
  char *data;
  // head is bytes 0 - 44
  char *header;
} Compressed;

// Get the contents of a file in a expanded format
File ffile_opener(const char *file_name);
// Print the contents of a opened file
void print_file(File f);
// Get the header of a file, returns a 44 byte string
char *get_head(File f);
// Takes a 16 bit sample and compresses it to 8 bits
char compress_sample(char b1, char b2);
// Returns a one in the 7-bit position if positive and 0 if negative
char get_sign(short int sample);
// returns the absolute value of a sample
short int get_magnitude(short int sample);
// returns the position of the most-significant 1 bit
char get_chord(short int mag);
// gets the first 4 bits after the leading 1-bit
char get_step(short int mag, char step);
// Compresses the contents of a file and returns the non-compressed head
Compressed compress_file(File f);
// writes compressed codewords to a file
void cwrite_to(Compressed c, const char *file_name);
// Expands the contents of a compressed file
File expand(Compressed c);
// Opens a file with compressed codewords
Compressed cfile_opener(const char *file_name);
// Get the head of a compressed file, returns a 44 byte string
char *cget_head(Compressed c);
// Exands a 8 bit code word to a 16 bit word
short int expand_word(char code);
// Gets sign of compressed word
short int cget_sign(char code);
// Write expanded data to file
void fwrite_to(File f, const char *file_name);

#endif
