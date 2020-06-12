
library("seqinr")
library("R.utils")
library("rBLAST")
library("ape")
library("ORFik")
library("Biostrings")

#1. Download the whole set of E.coli gene DNA sequences and use gunzip to decompress. Use the makeblast() function to create a blast database.
#How many sequences are present in the E.coli set?
download.file("ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz", destfile = "Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa")
R.utils::gunzip ("Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa", overwrite=TRUE)

makeblastdb("https://raw.githubusercontent.com/saburrow/Assignment3/master/Escherichia_coliz",dbtype = "nucl")

#2.Download the sample fasta sequence and read them in as above. For allocated sequence, determine the length (in bp) and the proportion of GC bases?
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa", destfile = "student41")
R.utils::gunzip("student41")
Student41seq<-read.fasta("student41")

str(Student41seq)

seq41.Ecoli<-(Student41seq$`41`)
head(seq41.Ecoli)
seqinr::getLength(seq41.Ecoli)
seqinr::GC(Student41seq$`41`)

read.csv("Escherichia_coli2.gz")

#3. Use Blast to identify what E.coli gene your sequence matches. Show a table of the top 3 hits including percent identity. E-value and bit scores.

function(myseq= seq41.Ecoli, db="ECOLI")
 {
mytmpfile1 <- tempfile(seq41.Ecoli)
mytmpfile2 <- tempfile("Escherichia_coli2.gz")

write.fasta(myseq, names = attr(myseq, "sequence41"), file.out = mytmpfile1)

system2(command = "/usr/bin/blastn", args = paste("-db ", 
      db, " -query", mytmpfile1, "-outfmt 6 -evalue 0.05 -ungapped >", 
       mytmpfile2))
    res <- NULL
if(file.info(mytmpfile2)$size>0) {
      res <- read.csv(mytmpfile2, sep = "\t", header = FALSE)
        colnames(res) <- c("qseqid", "sseqid", "pident", "length", 
"mismatch", "gapopen", "qstart", "qend", "sstart", 
           "send", "evalue", "bitscore")
}
unlink(c(mytmpfile1, mytmpfile2))
   if (!is.null(res)) {
res <- res[order(-res$bitscore), ]
   }
res}

head



