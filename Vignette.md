#1. Run the taxonomic filler script if any of your taxonomic data is incomplete
##	This command will fill in incomplete taxons with ‘Unassigned’
	
###$ sh damfish_script_filler.sh File1 File2 OutputFileName
	
###File1 should be your OTU file without a file ending such as .tsv, etc.
###	File2 should be your taxonomy file without an ending such as .tsv, etc.
###OutputFileName should be the name you want the complete, merged file to be, without a file ending such as .tsv

###An example of what the inputs and outputs should look like can be found in the Sample Data folder.

#2. Run the dam fish script with your OTU file and taxonomic file 
## This command will merge the two into one larger file for analysis

###$ sh damfish_script.sh File1 File2 OutputFileName

###File1 should be your OTU file without a file ending such as .tsv, etc.
###	File2 should be your taxonomy file without an ending such as .tsv, etc.
###OutputFileName should be the name you want the complete, merged file to be, without a file ending such as .tsv

###An example of what the inputs and outputs should look like can be found in the Sample Data folder.
