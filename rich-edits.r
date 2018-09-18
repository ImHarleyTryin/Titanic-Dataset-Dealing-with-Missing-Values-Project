#RM put project name and date at top of script 

#RM remember to read in data in script and to load packages in each script

library(tidyverse)

titanic_original <- read.csv("titanic_original.csv")


#replace missing values in "embarked" column with "S"
#RM use one function per line
titanic_original %>%
  group_by(embarked) %>%
  summarise()

titanic_original$embarked <-
  ifelse(is.na(titanic_original$embarked), "S", titanic_original$embarked)

#find and replace all missing values in the "age" column with the mean of all available values
titanic_original %>% summarise(mean_age = mean(age,na.rm = TRUE)) 

#RM - this works ok for this example but would be careful with this approach as replace_na can be run over the whole data frame
titanic_original$age <- titanic_original$age %>% 
  replace_na(29.9)

#RM - make sure you check the data. Did this work? 

#fill in the missing values of the "boat" column with "None"
titanic_original$boat<-
  titanic_original$boat %>% 
  replace_na("None")

#create a new binary column called "has_cabin_number" which gives "1" if passengers had a cabin number and "0" if the value is missing
titanic_original<- titanic_original%>% mutate(has_cabin_number=
    ifelse(is.na(cabin), 0, 1) #RM use numbers rather than characters
)
