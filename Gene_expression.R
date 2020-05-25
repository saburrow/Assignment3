download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",
              destfile = "gene_expression")
#1."Read in the file, making the gene accession numbers the row names. Show a table of values for the first six genes"
Gene_expression<-read.csv("gene_expression", sep = "\t", stringsAsFactors = FALSE, row.names = 1)
head(Gene_expression)
str(Gene_expression)
#2.Make a new column which is the mean of the other columns. Show a table of values for the first six genes
Gene_expression$Means<-rowMeans(Gene_expression)
Gene_expression
head(Gene_expression)
#3.List the 10 genes with the highest mean expression
Gene_expression[order(-Gene_expression$Means),]
MeanTop10 <-Gene_expression[order(-Gene_expression$Means),]
head(MeanTop10,10)
#4.Determine the number of genes with a mean of <10
which(Gene_expression$Means>10)
#5. Make a histogram plot of the mean values in png format
hist(Gene_expression$Means, breaks = 25 )

