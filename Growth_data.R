download.file("https://raw.githubusercontent.com/saburrow/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",
              destfile = "growth_data")
Growth_data<- read.csv("growth_data", sep = "\t", stringsAsFactors = TRUE, row.names = 1)
head(Growth_data)
