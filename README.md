# **DAMFISH**
---------------
## **D**ATA **A**NALYSIS OF BACTERIAL **M**ICROBIOME OF **FISH** (OR ANY OTHER SPECIES!)
## Jordan Briggs (j4100briggs@yahoo.com), Sara Thornburgh (sarathornburgh@g.ucla.edu)
***

### Introduction:
#### The purpose of the DAMFish program is to make analysis of microbiome census data easier and faster to researchers. It is often difficult to organize and combine massive datasets of taxonomic sequencing data and long OTU files. The DAMFish program combines the files using the Feature ID to keep them organized and processes them into R to be analyzed easily using the phyloseq package. The DAMFish program also outputs an alphabetically sorted OTU file and taxonomy file. The DAMFish program is also able to fill empty information in the taxonomy file with "unassigned" to make the merging of the OTU file and the taxonomy file easier to compile. 

### Program Workflow:
#### The DAMFish program will take an input of an OTU file that contains sequencing data, and a taxonomy file that contains the taxonomic information for the sequencing data. The DAMFish program will individually sort the two files alphabetically and output the files as otu_table.tsv and taxonomy.tsv. If the taxonomic file inputted has empty taxonomic data for some Feature ID's, there is another version of the DAMFish program that can fill the empty slots with "unassigned" before continuing. Once the two files are sorted, they are merged together into one .tsv file with the name specified by the user in the command line. The combined file is available for viewing to assist the program user when they are looking at their sequencing data outside a program. The sorted OTU file and taxonomy file can further be inputted into the DAMFish R program, where the files will be inputted and merged with a metadata file provided by the user to create a "phyloseq" object using the phyloseq package, which enables a variety of options for visualizing and analyzing microbiome sequencing data. Another version of the DAMFish R program can be used to output suggested plots, but based on the individuality of user's data and research questions, we suggest that you determine your own plots using the ggplot2 package in R.


### Dependencies:
#### This program will require Hoffman2 and R/3.4.0
#### To use the program, go through these steps first to make sure your data files are compatible:
#### 1. Make sure that both of your data files have the same number of rows, and only include columns you want to be a part of your analysis.
#### 2. The first line in both files should be the header, with the column names. Only include one row above the data that does not contain data itself. Make sure that there are no spaces in between the words of a column title, if the title has more than one word in the same column. 
#### 3. Make sure that each sample has a unique feature ID and that the feature IDs are the same between both files.
#### 4. Delimiters in your data set can be semi-colons or tabs only.
#### 5. Install the following R packages in in the Hoffman2 terminal using the following code:
```{r}
module load R
R
install.packages("ggplot2")
install.packages("ape")
intall.packages("digest")
source('http://bioconductor.org/biocLite.R')
biocLite('phyloseq')
```
#### 6. Make sure all the files that you wish to use this code on have their line ending in UNIX. This can be accomplished in the following way:
####	- MAC:
######		- Using Text Wrangler, open both files and save with an ending in UNIX.
####	- WINDOWS:
######		- Using Atom, download the "Converting Line Endings to" package. Open both files, and then, under packages, click on the package and select Unix. Save the file.

### Instructions
### Which file do I use?
#### damfish_script_filler.sh: 
#####	- This script will take a taxonomic file that does not have a complete taxonomy breakdown for each Feature ID. Use this script if your taxonomic file has the taxon breakdown in one column, and also contains empty cells.
#####	- The script will fill empty cells in the taxonomic file with "unassigned", and will add columns with the titles Kingdom, Phylum, Class, Order, Family, Genus, Species.   
#####	- The script will continue through the rest of the damfish script, and will combine the OTU file and the taxonomic file into one, complete file.
#####	- OUTPUT:
#####		Along with the R object 'phyloseq', this script will output the sorted, filled taxonomy file as $3_taxonomy_filled.tsv, where $3 is the OutputFileName you specify in the command line.
#####		This script will output the sorted OTU table as $3_otu_table.tsv.
#####		This script will output the combined OTU and taxonomy file as $3.tsv.

#### damfish_script.sh:
#####	- This script will take a taxonomic file that already has the complete taxon for the Feature ID's, AND does not contain any empty cells.
#####	- The script will combine the OTU file with the taxonomy file into one, complete file.
#####	- OUTPUT
#####		Along with the R object 'phyloseq', this script will output the sorted taxonomy file as $3_taxonomy.tsv, where #3 is the OutputFileName you specify in the command line.
#####           This script will output the sorted OTU table as $3_otu_table.tsv.
#####		This script will output the combined OTU and taxonomy file as $3.tsv.

### TO USE DAMFISH_SCRIPT_FILLER.SH:
###	sh damfish_script_filler.sh File1 File2 OutputFileName 
####		- File1 should be the name of your OTU file without a file ending such as .tsv
####		- File2 should be the name of your taxonomy file without a file ending such as .tsv
####		- OutputFileName should be the name you want the complete, merged file to be, without a file ending such as .tsv

### TO USE DAMFISH_SCRIPT.SH:
###	sh damfish_script.sh File1 File2 OutputFileName
####		- File1 should be the name of your OTU file without a file ending such as .tsv
####		- File2 should be the name of your taxonomy file without a file ending such as .tsv
####		- OutputFileName should be the name you want the complete, merged file to have, without a line ending such as .tsv. 


### TO USE THE SAMPLE DATA IN THE VIGNETTE:
#####	- Download the following data and the scripts, then load it into Hoffman2: SAMPLE1.tsv SAMPLE2.tsv SAMPLEincomplete.tsv
#####	- Use the following commands to test the scripts:
####		sh damfish_script_filler.sh SAMPLE1 SAMPLEincomplete SAMPLEscript_filler	
####		sh damfish_script.sh SAMPLE1 SAMPLE2 SAMPLEscript

### References:
#### Phyloseq - https://github.com/joey711/phyloseq


