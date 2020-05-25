download.file("https://raw.githubusercontent.com/saburrow/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",
              destfile = "growth_data")
read.csv("growth_data", header = TRUE, stringsAsFactors = TRUE)
Growth_data<- read.csv("growth_data", header = TRUE, stringsAsFactors = FALSE)
head(Growth_data)
str(Growth_data)
#6. Import the csv file intro an R object. What are the column names?
colnames(Growth_data)
#7. Calculate the mean and standard deviation of tree cirumference at the start and end of the study at both sites?
TreeGrowth<-as.data.frame(Growth_data)
northeast<-subset(ColumnTree, Site== "northeast")
View(northeast)
NE2004<-(northeast$Circumf_2004_cm)
mean(NE2004)

colMeans(northeast,"Circumf_2004_cm", na.rm =TRUE, dims = 3)
mean(northeast,"Circumf_2004_cm", dim)
southwest<-subset(Growth_data, Site== "southwest")
?rbind
 