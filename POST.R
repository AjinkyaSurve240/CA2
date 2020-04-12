getwd()
setwd("C:/Users/HP/Documents/CA2")
# To import data in csv format 
data1 <- read.csv("NIPostcodes.csv",header = FALSE,stringsAsFactors = FALSE, na.strings = "")
# to show structure of the data
str(data1)
# To show the tola number of rows of data 
nrow(data1)
# to display first 10 rows 
head(data1,10)

#2nd Adding the suitable title for each attribute

Modify_names <- c("Organisation Name","sub-building Name","Building Name","Number",
                  "Primary- Thorfare","Alt-Thorfare","Secondary Thorfare","Locality",
                  "Townland","Town","country","postcode","x-coordinates","y-coordinates","Primary Key (identifier)")

colnames(data1) <- Modify_names

# 3rd Missing Values 
data1[data1 == ""] <-NA

library(VIM)

missing_values <-aggr(data1, prop = FALSE, numbers = TRUE)
summary(missing_values)

# 4th Display the total number of missing values of each column.
colSums(is.na(data1))
sum(is.na(data1))
# 5th Reorder the column name 
data1 <-data1[, c(15,1,2,3,4,5,6,7,8,9,10,11,12,13,14)]
data1

# 6th Creating Dataset of Limavady and when town is Limavady we consider the relevant infromation of other two column

Limavady_data <- subset(data1, data1$Town == "LIMAVADY", select = c(Town, Locality, Townland))
Limavady_data
nrow(Limavady_data)
write.csv(Limavady_data, 'Limavady.csv',row.names = FALSE)

# 7th Creating a new dataset and storing 
write.csv(data1,'CleanNIPostcodeData.csv',row.names = FALSE)
