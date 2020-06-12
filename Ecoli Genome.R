
library("seqinr")
library("R.utils")
library("rBLAST")
library("ape")
library("ORFik")
library("Biostrings")

#1. Download the whole set of E.coli gene DNA sequences and use gunzip to decompress. Use the makeblast() function to create a blast database.
#How many sequences are present in the E.coli set?
download.file("ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz", destfile = "ECOLI")
R.utils::gunzip ("ECOLI", overwrite=TRUE)


makeblastdb("ECOLI" ,dbtype = "nucl") 


#2.Download the sample fasta sequence and read them in as above. For allocated sequence, determine the length (in bp) and the proportion of GC bases?
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa", destfile = "student41")
R.utils::gunzip("student41")
seq<-read.fasta("student41")
Student41seq<-seq[[41]]
str(Student41seq)

seq41.Ecoli<-(Student41seq)
str(seq41.Ecoli)
seqinr::getLength(seq41.Ecoli)

seqinr::GC(seq41.Ecoli)

#3. Use Blast to identify what E.coli gene your sequence matches. Show a table of the top 3 hits including percent identity. E-value and bit scores.
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R", destfile = "Mutblast.R")
source("Mutblast.R")
res<-myblastn_tab(seq41.Ecoli,db="ECOLI") 
res
View(res)

#4. Run the function and write an R code to check the number of mismatches between the original and mutated sequence?
mySeqmut<-mutator(Student41seq,nmut=100)
mySeqmut
res2<-myblastn_tab(mySeqmut,db=) 
View(res2)
