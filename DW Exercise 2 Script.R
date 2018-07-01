# 0: Loading the Data in RStudio
my_df <- read.csv("titanic_original.csv")

# 1: Replacing Missing Values
summary(my_df)
my_df$embarked[my_df$embarked == ""] <- my_df$embarked[my_df$embarked == "S"]

# 2: Replacing "Age" column NAs with Mean
# finding mean
mean(my_df$age, na.rm = T)
my_df$age[which(is.na(my_df$age))] <- mean(my_df$age, na.rm = T)

## 2 part 2: NAs could have also been replaced with a 0 or the median. Replacing with a 0
# would cause problems because it would drastically lower the average. Replacing with the 
# median would be more preferable than even the mean in this case because it is not affected
# by outliers.

# 3: Replacing empty slots of "boat" column with NAs
my_df$boat[my_df$boat == ""] <- my_df$boat[my_df$boat == NA]


# 4: Adding new column 
library(dplyr)
my_df <- mutate(my_df, has_cabin_number = ifelse(cabin == "",0,1))

#5: Saving as clean csv file
write.csv(my_df, "titanic_clean.csv")



