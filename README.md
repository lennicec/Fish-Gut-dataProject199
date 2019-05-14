# **DAM FISH**
## **D**ATA **A**NALYSIS OF BACTERIAL **M**ICROBIOME OF **FISH** (OR ANY OTHER SPECIES!)
***


#### This program will take an input of an OTU file and a metadata file with taxonomic sequencing data. It will then combine the two files into one larger file. This file will then be run in R to analyze the data visually.


#### This program will require Hoffman2 for organizing the data and R for analyzing the data.


#### To use the program, go through these steps first to make sure your data files are compatible:
#### 1. Make sure that both of your data files have the same number of rows and only include columns you want to be a part of your analysis.
#### 2. Put a # in front of the headers for your data files and in front of any other rows you want to be excluded. 
#### 3. Make sure that each sample has a unique feature ID and that the feature IDs are the same between both files.
#### 4. Make sure that the header is only 1 row and that the header is the only row before the data.
#### 5. Delimeters in your data set can be colons or tabs.
#### FINALLY:
#### 6. Make sure all the files that you wish to use this code on have their line ending in UNIX. This can be accomplished in the following way:
####	- MAC:
######		- Using Text Wrangler, open both files and save with an ending in UNIX.
####	- WINDOWS:
######		- Using Atom, download the "Converting Line Endings to" package. Open both files, and then, under packages, click on the package and select Unix. Save the file.

### To use write the following, replacing File1 and File2 with your specific name for the files you wish to include.
####	- File1 should be the OTU sequencing data, and File2 should be the taxonomy file.
## sh damfish_script.sh File1 File2
