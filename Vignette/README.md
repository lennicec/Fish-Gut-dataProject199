## TEST SET

#### Download the following data and the scripts, then load it into Hoffman2: SAMPLE1.tsv SAMPLE2.tsv SAMPLEincomplete.tsv
#### Use the following commands to test the scripts:
```{r}
sh damfish_script_filler.sh SAMPLE1 SAMPLEincomplete SAMPLEscript_filler
```
#### The output files for damfish_script_filler.sh should look like SAMPLEscript_filler.tsv, SAMPLEscript_filler_otu_table.tsv, and SAMPLE_taxonomy.tsv

```{r}
sh damfish_script.sh SAMPLE1 SAMPLE2 SAMPLEscript
```
#### The output files for damfish_script.sh should look like SAMPLEscript.tsv, SAMPLEscript_otu_table.tsv. SAMPLE_taxonomy.tsv
