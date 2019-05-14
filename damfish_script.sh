#!/bin/bash


#This script combines an OTU file with a taxonomic file to prep for statistical analysis
#To use, first make sure that there are no spaces in individual column titles, add a # in front of first column in header and to any rows not containing data, and make sure that the header is the only row in front of your data.


# copies column with sample ID, host, and site to new file called temp_metadata.tsv

cat metadata.tsv | awk '{ print $1 "\t" $13 "\t" $14 }' > temp_metadata.tsv

# removes the header from silva table, puts it into its own file called silva_table_header.tsv

grep '#' silva_table.tsv > silva_table_header.tsv

# removes the data from silva table, puts it into its own file called silva_table_data.tsv

tail -n+2 silva_table.tsv > silva_table_data.tsv

# sorts the silva_table_data.tsv alphabetically by the 1st column (ID names)

sort -k1 silva_table_data.tsv > silva_table_sorted_data.tsv

# puts the header back on to the sorted data table 

cat silva_table_header.tsv silva_table_sorted_data.tsv > silvatable_sorted.tsv

# repeats these same steps for the temp_metadata.tsv file

grep '#' temp_metadata.tsv > metadata_header.tsv
tail -n+2 temp_metadata.tsv > metadata_data.tsv
sort -k1 metadata_data.tsv > metadata_data_sorted.tsv
cat metadata_header.tsv metadata_data_sorted.tsv > metadata_sorted.tsv
