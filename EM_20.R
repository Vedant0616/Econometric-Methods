library(haven)
library(foreign)
data <- read_dta("D:/Final_econ/econo death/dataset/IAIR52FL.dta")
print(dim(data))
# traverse all the columns
# print(head(data))
# make a new column to store the new values and make all its attributes same as the first column
data$V21 <- data$b6_01
attr(data$V21, "label") <- attr(data$b6_01, "label")
attr(data$V21, "format.stata") <- attr(data$b6_01, "format.stata")
attr(data$V21, "labels") <- attr(data$b6_01, "labels")

# change the description of the new column to "death_year"
attr(data$V21, "label") <- "death_year"

print(dim(data))
for (i in length(data):1) {
#   print(names(data)[i])
  discription <- attr(data[[i]], "label")
  # print the datatype of this column values

  print(discription)
#   if(grepl("", discription, ignore.case = TRUE)  ){
#     print(discription)
#     # print((data)[i])
#     # print the different values of this column
#     # print(unique(data[[i]]))
# }
}
count <- 0
# traverse all row and if all the values of all the columns from 1 to 20 are NA, then make the entry in 21st column as NA else if any of the values is less than 305, then make the entry in 21st column as 1 else make it as 0
for (i in 1:nrow(data)) {
  if (is.na(data[i,1]) && is.na(data[i,2]) && is.na(data[i,3]) && is.na(data[i,4]) && is.na(data[i,5]) && is.na(data[i,6]) && is.na(data[i,7]) && is.na(data[i,8]) && is.na(data[i,9]) && is.na(data[i,10]) && is.na(data[i,11]) && is.na(data[i,12]) && is.na(data[i,13]) && is.na(data[i,14]) && is.na(data[i,15]) && is.na(data[i,16]) && is.na(data[i,17]) && is.na(data[i,18]) && is.na(data[i,19]) && is.na(data[i,20])) {
    data[i,21] <- NA
    count <- count + 1
  }
  else{
    # traverse all the columns and find the first column which has Non NA value
    for (j in 1:20) {
      if (!is.na(data[i,j])) {
        if (data[i,j] <= 305) {
          data[i,21] <- 1
        }
      }
    }
    if(is.na(data[i,21])){
      data[i,21] <- 0
    }
  }
}
# print the new column
# print(head(data))
# write the new dataset to a new file
write_dta(data, "D:/Final_econ/econo death/dataset/IAIR52FL_new21.dta")

# print the frequency of the values in the new column
print(table(data$V21))
print(count)
