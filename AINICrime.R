getwd()
setwd("C:/Users/HP/Documents/CA2/NI Crime")
list.files()
list.dirs()
rm(AINICrime)
list_files <- list.files(recursive = TRUE)
AINICrime <- data.frame()

for (list_files in list_files) {
  new_datasets <- read.csv(list_files, header = TRUE)
  AINICrime <- rbind(AINICrime,new_datasets)
  rm(new_datasets)
}
rm(AINICrime)
rm(new_datasets)
nrow(AINICrime)
head(AINICrime,10)

write.csv(AINICrime,"AINICrime.csv")

# Modify and Remove the uncessaray attributes 
AINICrime
AINICrime$Crime.ID <- NULL
AINICrime$Reported.by <- NULL
AINICrime$Falls.within <- NULL
AINICrime$LSOA.code <- NULL
AINICrime$LSOA.name <- NULL
AINICrime$Last.outcome.category <- NULL
AINICrime$Context <- NULL

# Recode the values of crime Type

AINICrime$Crime.type <- as.character(AINICrime$Crime.type)
class(AINICrime$Crime.type)

AINICrime$Crime.type[AINICrime$Crime.type == "Anti-social behaviour"] <- "ASBO"
AINICrime$Crime.type[AINICrime$Crime.type == "Bicycle theft"] <- "BITH"
AINICrime$Crime.type[AINICrime$Crime.type == "Burglary"] <- "BURG"
AINICrime$Crime.type[AINICrime$Crime.type == "Criminal damage and arson"] <- "CDAR"
AINICrime$Crime.type[AINICrime$Crime.type == "Drugs"] <- "DRUG"
AINICrime$Crime.type[AINICrime$Crime.type == "Other theft"] <- "OTTH"
AINICrime$Crime.type[AINICrime$Crime.type == "Public order"] <- "PUBO"
AINICrime$Crime.type[AINICrime$Crime.type == "Robbery"] <- "ROBY"
AINICrime$Crime.type[AINICrime$Crime.type == "Shoplifting"] <- "SHOP"
AINICrime$Crime.type[AINICrime$Crime.type == "Theft from the person"] <- "THPR"
AINICrime$Crime.type[AINICrime$Crime.type == "Vehicle crime"] <- "VECR"
AINICrime$Crime.type[AINICrime$Crime.type == "Violence and sexual offences"] <- "VISO"
AINICrime$Crime.type[AINICrime$Crime.type == "Other crime"] <- "OTCR"
AINICrime$Crime.type[AINICrime$Crime.type == "Possession of weapons"] <- "POW"

AINICrime$Crime.type <- as.factor(AINICrime$Crime.type)

# Using Plot function 

attach(AINICrime) # Attach the data as global environment 
plot(AINICrime$Crime.type, ylim = c(0,200000), col = "red", main = "Total Crime",xlab = "crime type", ylab = "Crime frequency")

# Modifying Location Column 
AINICrime$Location <- gsub("On or near", "", AINICrime$Location)


# Create rando sample data 
AINICrime$Location[AINICrime$Location == " "] <- NA

AINICrime <- na.omit(AINICrime)
set.seed(100)
random_crime_sample <- AINICrime[sample(nrow(AINICrime),5000),]

CleanNIPostcodeData1 <- read.csv("CleanNIPostcodeData.csv", header = TRUE)

find_a_town <- function(Location)    # function to get the town names 
{
  set.seed(100)
  CleanNIPostcodeData1$Town[match(toupper(Location),CleanNIPostcodeData1$Town)]
  
  print(random_crime_sample$Location) # Ramdom crime data with town data added.
}
random_crime_sample$Town <- find_a_town(random_crime_sample$Location)
random_crime_sample$Town
str(random_crime_sample)
random_crime_sample <- find_a_town()

head(random_crime_sample)
