# **DAM FISH**
## **D**ATA **A**NALYSIS OF BACTERIAL **M**ICROBIOME OF **FISH** (OR ANY OTHER SPECIES!)
***


#### This program will take an input of an OTU file and a taxonomy file with taxonomic sequencing data. It will then combine the two files into one larger file. This file will then be run in R to analyze the data visually.


#### This program will require Hoffman2 for organizing the data and R for analyzing the data.


#### To use the program, go through these steps first to make sure your data files are compatible:
#### 1. Make sure that both of your data files have the same number of rows and only include columns you want to be a part of your analysis.
#### 2. The first line in both files should be the header, with the column names. Make sure there is a "#" in front of the first column title, and that there are no spaces between words that belong to the same column. 
#### 3. Make sure that each sample has a unique feature ID and that the feature IDs are the same between both files.
#### 4. Delimiters in your data set can be semi-colons or tabs only.
#### FINALLY:
#### 5. Make sure all the files that you wish to use this code on have their line ending in UNIX. This can be accomplished in the following way:
####	- MAC:
######		- Using Text Wrangler, open both files and save with an ending in UNIX.
####	- WINDOWS:
######		- Using Atom, download the "Converting Line Endings to" package. Open both files, and then, under packages, click on the package and select Unix. Save the file.

### Which file do I use?
#### damfish_script_filler.sh: 
#####	- This script will take a taxonomic file that does not have a complete taxonomy breakdown for each Feature ID. Use this script if your taxonomic file has the taxon breakdown in one column, and also contains empty cells.
#####	- The script will fill empty cells in the taxonomic file with "unassigned", and will add columns with the titles Kingdom, Phylum, Class, Order, Family, Genus, Species.   
#####	- The script will continue through the rest of the damfish script, and will combine the OTU file and the taxonomic file into one, complete file.
#### damfish_script.sh:
#####	- This script will take a taxonomic file that already has the complete taxon for the Feature ID's, AND does not contain any empty cells.
#####	- The script will combine the OTU file with the taxonomy file into one, complete file.

### TO USE DAMFISH_SCRIPT_FILLER.SH:
###	sh damfish_script_filler.sh File1 File2 OutputFileName 
####		- File1 should be the name of your OTU file without a file ending such as .tsv
####		- File2 should be the name of your taxonomy file without a file ending such as .tsv
####		- OutputFileName should be the name you want the complete, merged file to be, without a file ending such as .tsv

### TO USE DAMFISH_SCRIPT.SH:
###	sh damfish_script.sh File1 File2 OutputFileName
####		- File1 should be the name of your OTU file without a file ending such as .tsv
####		- File2 should be the name of your taxonomy file without a file ending such as .tsv
####		- OutputFileName should be the name you want the complete, merged file to have, without a line ending such as .tsv

#### TO USE THE SAMPLE DATA:
#####	- Download the following data and the scripts, then load it into Hoffman2: SAMPLE1.tsv SAMPLE2.tsv SAMPLEincomplete.tsv
#####	- Use the following commands to test the scripts:
####		sh damfish_script_filler.sh SAMPLE1 SAMPLEincomplete OUTPUT_filler	
####		sh damfish_script.sh SAMPLE1 SAMPLE2 OUTPUT

