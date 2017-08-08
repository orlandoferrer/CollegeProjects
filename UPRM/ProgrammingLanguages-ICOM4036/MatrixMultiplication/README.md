# Matrix Multiplication
## Class ICOM4036 - Programming Languages
### Circa 2005

Attempting a quick run using the most recent version of the SPIM MIPS Simulator for Mac (I used the most recent version of SPIM for Windows in 2005 to run the assembly portion of this project) yielded some errors— will require some investigation.

This was a very interesting project. We needed to implement a matrix multiplication in C++, then translate it to Easy1 assembly (this was an assembly language with a reduced set of instructions, for academic purposes— I believe it only had 8 instructions. Couldn't find the PDF with the instruction set to include it here), then implement it in MIPS assembly.

It was a group project, I worked on the MIPS portion of the code. Since this required the use of several registries, and many jump instructions— my approach was to do the code in a notebook, by hand, and keep track of the values in the registers. 

After several hours of coding by hand, moving code around, erasing, and keeping several layers of code in my mind, I was ready to type it and test it out. It was a very exciting experience as I saw the row of values change in the SPIM simulator. I'd love to say it ran perfectly in the first run, but this wasn't the case. I had missed a jump instruction to break out of a for loop (I had previously done the code in C++, so I could then tranlate it), so in the first run it only did the multiplication correctly for the first row, then it would go into unexpected behavior. It took me some time to realize what was going on, but in the end it was only a small fix— then it ran perfectly! 
