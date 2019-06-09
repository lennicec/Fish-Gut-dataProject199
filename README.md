DAMFish
Data Analysis of Bacterial Microbiome of Fish
(OR ANY OTHER SPECIES)

Jordan Briggs (j4100briggs@yahoo.com), Sara Thornburgh (sarathornburgh@g.ucla.edu)

Introduction:
The purpose of the DAMFish program is to take an OTU file and a taxonomy file from [Qiime](http://qiime.org/) or [Qiime 2](https://qiime2.org/) and sort the data for making analysis of sequenced microbiome data easier and faster for researchers. The sequencing files are often incredibly large, making them incredibly difficult to organize and combine through visualizing apps such as Excel. The DAMFish program makes this process incredibly easy for researchers. The DAMFish program can not only sort a taxonomic file alphabetically created through Qiime or Qiime2, but can also help in expanding the taxon column into the full taxonomic rank of each bacteria species, and can even fill in unknown or undetermined ranks (these are empty cells or an incomplete taxonomic rank) with “unassigned”. The DAMFish program will also sort the OTU file alphabetically, and combine both the complete taxonomic rank file and the OTU file so that the sequencing ID’s match and all the available information for those bacteria species are easily viewable in the data file. The DAMFish program also has a separate [R](https://www.r-project.org/) program that can load the sorted OTU and taxonomy files, along with the metadata file the user provides, into a phyloseq object from the [Phyloseq](https://joey711.github.io/phyloseq/) package in R. This object is then ready to be analyzed by the user with whatever packages they wish to use in R.

Program Workflow:
1. The OTU file and the taxonomy file are inputted into the code using the command line.
If the taxonomy file does not have a complete taxonomic rank, the DAMFish program titled damfish_script_filler.sh will run the file through a while loop that adds "unassigned" into empty taxonomy breakdowns and split the single taxon column into a column each for Kingdom, Phylum, Class, Order, Family, Genus, and Species.
2. The header for each file is removed and saved into another file.
3. The data in the files are removed and saved into another file.
4. The data is sorted alphabetically for each file.
5. The header and sorted data for each file is added into a separate, final file called otu_table.tsv and taxonomy.tsv.
6. The sorted OTU file and taxonomy file are combined, with the columns of the taxonomy file before the OTU file, into the final file with the title that the user specified in the command line.
7. The R code inputs the sorted OTU file, taxonomy file, and metadata file that are found within the working directory.
8. The OTU file and taxonomy file are converted to matrices.
9. The three matrices are converted into one phyloseq object through the phyloseq object.
The two programs are complete and are available to view and to analyze!
NOTES: The combined OTU and taxonomy file is available for viewing to assist the program user when they are looking at their sequencing data.
The "phyloseq" object created using the phyloseq package enables a variety of options for visualizing and analyzing microbiome sequencing data.
 
Dependencies:
This program will require Hoffman2 and R/3.4.0
To use the program, go through these steps first to make sure your data files are compatible:
1. Make sure that the OTU and taxonomy files are compatible with one another (both have the same number of rows and the same Feature ID’s). 
2. The first line in both files should be the header that contains the column names. There should not be spaces between words within the same column. 
5. When running the DAMFish R program, install the following R packages in the Hoffman2 terminal using the following code:
module load R
R
install.packages("ggplot2")
install.packages("ape")
install.packages("digest")
source('http://bioconductor.org/biocLite.R')
biocLite('phyloseq')
install.packages("remotes")
remotes::install_github("vmikk/metagMisc")
6. Make sure all the files that you wish to use this code on have their line ending in UNIX. This can be accomplished in the following way:
- MAC:
- Using Text Wrangler, open both files and save with an ending in UNIX.
- WINDOWS:
- Using Atom, download the "Converting Line Endings to" package. Open both files, and then, under packages, click on the package and select Unix. Save the file.

Instructions

damfish_script_filler.sh:
Use if your taxonomic rank is not complete and all in one column!
sh damfish_script_filler.sh File1 File2 OutputFileName
- File1 should be the name of your OTU file without a file ending such as .tsv
- File2 should be the name of your taxonomy file without a file ending such as .tsv
- OutputFileName should be the name you want the complete, merged file to be, without a file ending such as .tsv
- This script will output three files: otu_table.tsv, taxonomy.tsv, and the combined file with the name of your choice.

damfish_script.sh:
sh damfish_script.sh File1 File2 OutputFileName
- File1 should be the name of your OTU file without a file ending such as .tsv
- File2 should be the name of your taxonomy file without a file ending such as .tsv
- OutputFileName should be the name you want the complete, merged file to have, without a line ending such as .tsv.
- This script will output three files: otu_table.tsv, taxonomy.tsv, and the combined file with the name of your choice.

damfish_Rscript.R:
- Make sure you are running the DAMFish R program in the same directory you ran the DAMFish Bash Program. This is because the DAMFish R program uses the files otu_table.tsv and taxonomy.tsv that were created through the DAMFish program, along with the metadata.tsv that the user provides..
Rscript damfish_Rscript.R
- The DAMFish R program will output the phyloseq object that contains the OTU file, taxonomy file, and the metadata file into a .tsv file called phyloseq_object.tsv for visualization. The phyloseq object will be found in the users’ workspace if the code is run through R itself.

NOTE: We included a script called damfish_RplotsSAMPLE.R in the [Vignette](https://github.com/j4100briggs/Fish-Gut-dataProject199/tree/master/Vignette) folder. This is an example of plots you can create using R with the phyloseq object created from the damfish_Rscript.R program. 
 
To use the sample data in the Vignette:
- Download the following data and the scripts, then load it into Hoffman2 (or clone this github repository): SAMPLEotu_table.tsv SAMPLEtaxonomy.tsv SAMPLEtaxonomy_filled.tsv
- Use the following commands to test the scripts:
sh damfish_script_filler.sh SAMPLEotu_table SAMPLEtaxonomy SAMPLEscript_filler
sh damfish_script.sh SAMPLEotu_table SAMPLEtaxonomy_filled SAMPLEscript
Rscript damfish_RscriptSAMPLE.R
Rscript damfish_RplotsSAMPLE.R

References:
Qiime - http://qiime.org/
Qiime2 - https://qiime2.org/
R - https://www.r-project.org/
Phyloseq - https://github.com/joey711/phyloseq/
metagMisc - https://rdrr.io/github/vmikk/metagMisc/
