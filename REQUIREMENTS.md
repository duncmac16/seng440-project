### SENG 440 Project
## Embedded Systems
# Overview

This project is to implement and optimize mu-law for audio compression.

# Requirements and Specifications

- Software must be able to take in a sample of size 16-bits (14 of those bits are usable) and convert it into a a code word of size 8-bits
    - Function must be able to get the sign of the sample and store the this in the codeword
    - Function must get the magnitude of the sample
    - Function must use the magnitude of the sample and take a piecewise logarithm of it 
    - Function must get the 4 most significant bits after the leading 1 bit and store it 
    - Function must combine the sign, the logarithm and the 4 most significant bits into a code word
