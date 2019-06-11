##**Vignette Sample Test Set:**
___
####Download the following data and the scripts, then load it into Hoffman2:

SAMPLEotu_table.tsv 

SAMPLEtaxonomy_filled.tsv 

SAMPLEtaxonomy.tsv

___

###Use the following commands to run the DAMFish scripts:
___

####**sh damfish_script_filler.sh SAMPLEotu_table SAMPLEtaxonomy SAMPLEscript_filler**

####The output files for damfish_script_filler.sh should look like: 

SAMPLEscript_filler.tsv 

SAMPLEscript_filler_otu_table.tsv

SAMPLEscript_filler_taxonomy.tsv

___

####**sh damfish_script.sh SAMPLEotu_table SAMPLEtaxonomy_filled SAMPLEscript**

####The output files for damfish_script.sh should look like: 

SAMPLEscript.tsv

SAMPLEscript_otu_table.tsv

SAMPLEscript_taxonomy.tsv

___

####**Rscript damfish_RscriptSAMPLE.R**

####The output file for damfish_RscriptSAMPLE.R should look like:

phyloseq_object.tsv

___

####**Rscript damfish_RplotsSAMPLE.R**

####The output file for damfish_RplotsSAMPLE.R should look like:

phyloseq_object.tsv

SAMPLE1.pdf

SAMPLE2.pdf

SAMPLE3.pdf.

___
####The output of the test set that you run can be checked for correctness in the [Expected_Output directory](https://github.com/j4100briggs/Fish-Gut-dataProject199/tree/master/Vignette/Expected_Output), where we placed the exact output files of each script.