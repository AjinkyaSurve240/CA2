crime1 <-read.csv("2015-01-northern-ireland-street.csv")
crime2 <- read.csv("2015-02-northern-ireland-street.csv")
crime3 <- read.csv("2015-03-northern-ireland-street.csv")
crime4 <- read.csv("2015-04-northern-ireland-street.csv")
crime5 <- read.csv("2015-05-northern-ireland-street.csv")
crime6 <- read.csv("2015-06-northern-ireland-street.csv")
crime7 <- read.csv("2015-07-northern-ireland-street.csv")
crime8 <- read.csv("2015-08-northern-ireland-street.csv")
crime9 <- read.csv("2015-09-northern-ireland-street.csv")
crime10 <- read.csv("2015-10-northern-ireland-street.csv")
crime11 <- read.csv("2015-11-northern-ireland-street.csv")
crime12 <- read.csv("2015-12-northern-ireland-street.csv")

crime_2015 <- rbind(crime1,crime2,crime3,crime4,crime5,crime6,crime7,crime8,crime9,crime10,crime11,crime12)

crime13 <- read.csv("2016-01-northern-ireland-street.csv")
crime14 <- read.csv("2016-02-northern-ireland-street.csv")
crime15 <- read.csv("2016-03-northern-ireland-street.csv")
crime16 <- read.csv("2016-04-northern-ireland-street.csv")
crime17 <- read.csv("2016-05-northern-ireland-street.csv")
crime18 <- read.csv("2016-06-northern-ireland-street.csv")
crime19 <- read.csv("2016-07-northern-ireland-street.csv")
crime20 <- read.csv("2016-08-northern-ireland-street.csv")
crime21 <- read.csv("2016-09-northern-ireland-street.csv")
crime22 <- read.csv("2016-10-northern-ireland-street.csv")
crime23 <- read.csv("2016-11-northern-ireland-street.csv")
crime24 <- read.csv("2016-12-northern-ireland-street.csv")

crime_2016 <- rbind(crime13,crime14,crime15,crime16,crime17,crime18,crime19,crime20,crime21,crime22,crime23,crime24)

crime25 <- read.csv("2017-01-northern-ireland-street.csv")
crime26 <- read.csv("2017-02-northern-ireland-street.csv")
crime27 <- read.csv("2017-03-northern-ireland-street.csv")
crime28 <- read.csv("2017-04-northern-ireland-street.csv")
crime29 <- read.csv("2017-05-northern-ireland-street.csv")
crime30 <- read.csv("2017-06-northern-ireland-street.csv")
crime31 <- read.csv("2017-07-northern-ireland-street.csv")
crime32 <- read.csv("2017-08-northern-ireland-street.csv")
crime33 <- read.csv("2017-09-northern-ireland-street.csv")
crime34 <- read.csv("2017-10-northern-ireland-street.csv")
crime35 <- read.csv("2017-11-northern-ireland-street.csv")
crime36 <- read.csv("2017-12-northern-ireland-street.csv")

crime_2017 <- rbind(crime25,crime26,crime27,crime28,crime29,crime30,crime31,crime32,crime33,crime34,crime35,crime36)

AIINICrimeData <- rbind(crime_2015,crime_2016,crime_2017)

write.csv(AIINICrimeData,"AIINICrimeData.csv")

# Remove the attributes 

AIINICrimeData$Crime.ID <- NULL
AIINICrimeData$Reported.by <- NULL
AIINICrimeData$Falls.within <- NULL
AIINICrimeData$LSOA.code <- NULL
AIINICrimeData$LSOA.name <- NULL
AIINICrimeData$Last.outcome.category <- NULL
AIINICrimeData$Context <- NULL

# Recode the values of crime Type
str(AIINICrimeData)
class(AIINICrimeData$Crime.type)

AIINICrimeData$Crime.type <- as.character(AIINICrimeData$Crime.type)
class(AIINICrimeData$Crime.type)


AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Anti-social behaviour"] <- "ASBO"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Bicycle theft"] <- "BITH"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Burglary"] <- "BURG"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Criminal damage and arson"] <- "CDAR"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Drugs"] <- "DRUG"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Other theft"] <- "OTTH"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Public order"] <- "PUBO"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Robbery"] <- "ROBY"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Shoplifting"] <- "SHOP"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Theft from the person"] <- "THPR"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Vehicle crime"] <- "VECR"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Violence and sexual offences"] <- "VISO"
AIINICrimeData$Crime.type[AIINICrimeData$Crime.type == "Other crime"] <- "OTCR"


# Using Plot function 

str(AIINICrimeData)
# Modifying Location Column 
AIINICrimeData$Location <- gsub("On or near", "", AIINICrimeData$Location)


# Create rando sample data 
#random_crime_sample <- AIINICrimeData[sample(1:nrow(AIINICrimeData), 5000),]
#random_crime_sample$Location <- sample(LETTERS, 5000)
set.seed(100)
rm(random_crime_sample)

set.seed(100)


install.packages("dplyr")
