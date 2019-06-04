# This script will take a phyloseq object and create plots using ggplot2.

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
metadata <- read.table("metadataSAM.tsv", row.names = 1, header = TRUE, fill = TRUE)

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
print("You're phyloseq object is ready :)")

# Takes the specific taxa we are looking for in the phyloseq object and compacts it into a new phyloseq object.
print("Grabbing taxa...")
physeq.species <- subset_taxa(physeq, Phylum == "D_1__Proteobacteria" | Phylum == "D_1__Bacteroidetes" | Phylum == "D_1__Firmicutes" | Phylum == "D_1__Verrucomicrobia" | Phylum == "D_1__Fusobacteria")

# Melts the phyloseq object to prepare for graphing.
print("Melting the phyloseq object...")
physeq.combined <- psmelt(physeq.species)

# Grabs a subset of the data where the abundance is greater than 5.
print("Almost ready to graph...")
physeq.complete <- subset(physeq.combined, Abundance > 5)

# Plots the abundance of the samples with the phylum filled in.
print("Graphing the abundance of the samples with the phylum filled in - available as SAMPLE1.pdf in working directory...")
pdf("SAMPLE1.pdf")
ggplot(physeq.complete, aes(x = Sample, y = Abundance, fill = Phylum)) + geom_bar(stat = "identity", width = 0.5) + labs(title = "Sample Abundance with Phylum") + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=0.5, size=7))
dev.off()

# Plots the abundance of the bacteria Phylum, with coloration for the Host fish species, grouped by site.
print("Graphing the abundance of the bacteria Phylum, with host species filled in and grouped by site - available as SAMPLE2.pdf in working directory...")
pdf("SAMPLE2.pdf")
ggplot(physeq.complete, aes(x = Phylum, y = Abundance, fill = Host)) + geom_bar(stat = "identity", width = 0.5)  + labs(title = "Phylum Abundance with Host Species Grouped by Site") + facet_grid(.~Site) + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=0.5, size=7), panel.spacing = unit(0, 'line'))
dev.off()

# Plots the abundance of the fish species, with coloration for the phylum, grouped by site.
print("Graphing the abundance of the host species, with phylum filled in and grouped by site - available as SAMPLE3.pdf in the working directory...")
pdf("SAMPLE3.pdf")
ggplot(physeq.complete, aes(x = Host, y = Abundance, fill = Phylum)) + geom_bar(stat = "identity", width = 0.5)  + facet_grid(.~Site) + labs(title = "Host Species Abundance with Phylum Grouped by Site") + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=0.5, size=7), panel.spacing = unit(0, 'line'))
dev.off()