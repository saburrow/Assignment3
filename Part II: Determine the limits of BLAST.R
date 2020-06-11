library("seqinr")
library("R.utils")
library("rBLAST")
library("ape")
library("ORFik")
library("Biostrings")
#1. Download the whole set of E.coli gene DNA sequences and use gunzip to decompress. Use the makeblast() function to create a blast database.
#How many sequences are present in the E.coli set?
download.file("ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz", destfile = "Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz")

R.utils::gunzip("Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz", overwrite=TRUE)
makeblastdb("Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz",dbtype = "nucl","-parse_seqids")

#2.Download the sample fasta sequence and read them in as abova. For allocated sequence, determine the length (in bp) and the proportion of GC bases?
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa", destfile = "Student41")
Student41seq<-read.fasta("Student41")
str(Student41seq$`41`)
seqinr::getLength(Student41seq$`41`)
seqinr::GC(Student41seq$`41`)
#3. Use Blast to identify what E.coli gene your sequence matches. Show a table of the top 3 hits including percent identity. E-value and bit scores.
function (myseq, db)