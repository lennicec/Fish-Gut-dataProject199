#!/bin/bash
# This script takes the taxonomic file from the user, where the taxon breakdown is combined into one column, and outputs a file where each part of the taxon is broken down into different columns.

# Extracts the column containing the taxon information into the file extracted_taxon_$1.tsv
awk '{ print $1 }' $1.tsv > first_column_$1.tsv
awk '{ print $2 }' $1.tsv > extracted_taxon_$1.tsv

# Replaces a semi-colon with a tab to create more columns to fill the taxon breakdown and saves it into the file taxon_breakdown_$1.tsv.
sed 's/;/\t/g' extracted_taxon_$1.tsv > taxon_breakdown_$1.tsv

# Creates a while loop that reads through the lines of the file.
while IRS= read -r line
do
 # Counts the number of columns in each line.
 columns=`echo $line | wc -w`
 # Creates a for loop that reads through the number of columns.
 for i in $columns
  do
  # Creates a variable called "add" that finds the number of columns that need to be$
  x=7
  add=$(( x - i ))
  # Creates an if loop that adds the correct number of columns needed for each line $
  if [ $add -eq 0 ]
  then
   echo "$line" >> filled_columns_$1.tsv
  elif [ $add -eq 1 ]
  then
   echo "$line   unassigned" >> filled_columns_$1.tsv
  elif [ $add -eq 2 ]
  then
   echo "$line    unassigned      unassigned" >> filled_columns_$1.tsv
  elif [ $add -eq 3 ]
  then
   echo "$line    unassigned      unassigned      unassigned" >> filled_columns_$1.tsv
  elif [ $add -eq 4 ]
  then
   echo "$line    unassigned      unassigned      unassigned      unassigned" >> filled_columns_$1.tsv
  elif [ $add -eq 5 ]
  then
   echo "$line    unassigned      unassigned      unassigned      unassigned      unassigned" >> filled_columns_$1.tsv
  elif [ $add -eq 6 ]
  then
   echo "$line    unassigned      unassigned      unassigned      unassigned      unassigned	unassigned" >> filled_columns_$1.tsv
  elif [ $add -eq 7 ]
  then
   echo "unassigned       unassigned      unassigned      unassigned      unassigned unassigned unassigned" >> filled_columns_$1.tsv
  else
   echo "This line is empty."
  fi
 done
done < taxon_breakdown_$1.tsv

# Takes the data from the filled_columns_$1.tsv.
tail -n+2 filled_columns_$1.tsv > filled_data_$1.tsv

# Creates a new header for the data and forms a new file called filled_header_$1.tsv.
echo "Kingdom	Phylum	Class	Order	Family	Genus	Species" > filled_header_$1.tsv

# Adds the header and the data into a new, final file called complete_$1.tsv
cat filled_header_$1.tsv filled_data_$1.tsv > taxon_$1.tsv

# Adds the taxon columns with the feature ID column into a file called complete_$1.tsv.
paste first_column_$1.tsv taxon_$1.tsv > complete_$1.tsv

# Removes all the files that are no longer needed.
rm first_column_$1.tsv
rm extracted_taxon_$1.tsv
rm taxon_breakdown_$1.tsv
rm filled_columns_$1.tsv
rm filled_data_$1.tsv
rm filled_header_$1.tsv
rm taxon_$1.tsv

