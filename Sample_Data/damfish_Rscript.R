# Loads the necessary libraries.
print("Loading the libraries...")
library("ggplot2")
library("ape")
library("digest")
#source('http://bioconductor.org/biocLite.R')
#biocLite('phyloseq')
library("phyloseq")
#remotes::install_github("vmikk/metagMisc")
library("metagMisc")

# Inputs the OTU file into R.
print("Inputting OTU file...")
otu_table <- read.table(file = "SAMPLEotu_table.tsv", row.names = 1, header = 1, sep = "\t")
# colnames(otu_table)[1] <- "OTUID"
otu_table <- as.matrix(otu_table)

# Inputs the taxonomy file into R.
print("Inputting taxonomy file...")
taxonomy <- read.table(file ="SAMPLEtaxonomy_filled.tsv", row.names = 1, header = 1)
# colnames(taxonomy)[0] <- "OTUID"
taxonomy <- as.matrix(taxonomy)

# Inputs the metadata file into R.
print("Inputting metadata file...")
metadata <- read.table("metadataFIXED.tsv", row.names = 1, header = TRUE, fill = TRUE)

#Converts the matrixes into usable phyloseq variables.
print("Getting ready to create a phyloseq object...")
OTU <- otu_table(otu_table, taxa_are_rows=TRUE)
TAX <- tax_table(taxonomy)
META <- sample_data(metadata)

# Checks that the OTU names are consistent.
head(taxa_names(TAX))
head(taxa_names(OTU))

# Merges the three matrixes into a phyloseq object.
print("Creating a phyloseq object...")
physeq <- phyloseq(OTU, TAX, META)
physeq
print("Your phyloseq object is ready :)")