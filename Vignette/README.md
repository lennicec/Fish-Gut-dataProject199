## TEST SET

#### Download the following data and the scripts, then load it into Hoffman2: 
####	SAMPLEotu_table.tsv SAMPLEtaxonomy_filled.tsv SAMPLEtaxonomy.tsv

#### Use the following command to use the DAMFish scripts:
```{r}
sh damfish_script_filler.sh SAMPLEotu_table SAMPLEtaxonomy SAMPLEscript_filler
```
#### The output files for damfish_script_filler.sh should look like SAMPLEscript_filler.tsv, SAMPLEscript_filler_otu_table.tsv, and SAMPLEscript_filler_taxonomy.tsv

```{r}
sh damfish_script.sh SAMPLEotu_table SAMPLEtaxonomy_filled SAMPLEscript
```
#### The output files for damfish_script.sh should look like SAMPLEscript.tsv, SAMPLEscript_otu_table.tsv. SAMPLEscript_taxonomy.tsv

```{r}
Rscript damfish_RscriptSAMPLE.R
```
#### The output file for damfish_RscriptSAMPLE.R should look like phyloseq_object.tsv.

```{r}
Rscript damfish_RplotsSAMPLE.R
```
#### The output file for damfish_RplotsSAMPLE.R should look like phyloseq_object.tsv, SAMPLE1.pdf, SAMPLE2.pdf, and SAMPLE3.pdf.

### The output of the test set that you run can be checked for correctness in the Expected_Output directory, where we placed the exact output files of each script.
