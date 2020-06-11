download.file("https://raw.githubusercontent.com/saburrow/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",
              destfile = "growth_data")
read.csv("growth_data", header = TRUE, stringsAsFactors = TRUE)
Growth_data<- read.csv("growth_data", header = TRUE, stringsAsFactors = FALSE)
head(Growth_data)
str(Growth_data)
#6. Import the csv file intro an R object. What are the column names?
colnames(Growth_data)
#7. Calculate the mean and standard deviation of tree cirumference at the start and end of the study at both sites?
as.data.frame(Growth_data)
head (TreeGrowth)
##Subset North East (NE)
northeast<-subset(Growth_data, Site== "northeast")
###North East Mean and Standard Deviation 2004 (start)
NE2004<-(northeast$Circumf_2004_cm)
mean(NE2004)
sd(NE2004)
###North East 2019 Mean and Standard Deviation(End)
NE2019<-(northeast$Circumf_2019_cm)
mean(NE2019)
sd(NE2019)

##Subset South West (SW)
southwest<-subset(Growth_data, Site== "southwest")
###South West 2004 (start)
SW2004<-(southwest$Circumf_2004_cm)
mean(SW2004)
sd(SW2004)
###South West 2019 (end)
SW2019<-(southwest$Circumf_2019_cm)
mean(SW2019)
sd(SW2019)

#8. Make a box plot of tree circumference at the start and end of the study at both sights
##Boxplot comparing North East (NE) and South West (SW) tree circumference
boxplot(NE2004,SW2004, NE2019, SW2019, main="The Measurement of Mean Tree Circumference at Various Sites",names=c("NE2004", "SW2004", "NE2019","SW2019"),
        col="white", xlab="Year of Measurement", ylab="Tree circumference (cm)")
#Mean growth over the past 10 years at each site
head(Growth_data)
northeast$Growth<-northeast$Circumf_2019_cm-northeast$Circumf_2009_cm
head(northeast)
southwest$Growth<-southwest$Circumf_2019_cm-southwest$Circumf_2009_cm
head(southwest)

#Use t.test to estimate the p-value that the 10 year growth is different at the two sites
t.test()
#Use Wilcox.test to estimate the p-value that the 10 year growth is different at the two sites