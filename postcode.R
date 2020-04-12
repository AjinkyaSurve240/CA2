data1 <- read.csv("NIPostcodes.csv",header = FALSE,stringsAsFactors = FALSE, na.strings = "")
str(data1)
nrow(data1)
head(data1,10)

#2nd

Modify_names <- c("Organisation Name","sub-building Name","Building Name","Number",
                    "Primary- Thorfare","Alt-Thorfare","Secondary Thorfare","Locality",
                    "Townland","Town","country","postcode","x-coordinates","y-coordinates","Primary Key (identifier)")

colnames(data1) <- Modify_names

# 3rd Missing Values #
data1[data1 == ""] <-NA

library(VIM)

missing_values <-aggr(data1, prop = FALSE, numbers = TRUE)
summary(missing_values)

# 4th
colSums(is.na(data1))

# 5th Reorder the column name 

data1 <-data1[, c(15,1,2,3,4,5,6,7,8,9,10,11,12,13,14)]
data1

# 6th Creating Dataset where Limavady

Limavady_data <- subset(data1, data1$Town == "LIMAVADY", select = c(Town, Locality, Townland))
nrow(Limavady_data)
write.csv(Limavady_data, 'Limavady.csv',row.names = FALSE)

# 7th Creating a new dataset and storing 
write.csv(data1,'CleanNIPostcodeData.csv',row.names = FALSE)



