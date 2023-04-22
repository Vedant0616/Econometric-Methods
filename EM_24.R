library(haven)
library(foreign)
data <- read_dta("D:/Final_econ/final/dataset/IAIR52FL_new24.dta")
print(dim(data))
data$V25 <- data$v159
attr(data$V25, "label") <- "Frequency of new hearing news"
attr(data$V25, "format.stata") <- attr(data$v159, "format.stata")
attr(data$V25, "labels") <- attr(data$v159, "labels")
# write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_new25.dta")
# traverse all the rows and if in any one of the columns V158 or V157 or V159 , we have a value of greater than 0, then we have to set the value of V25 to 1 else 0
for(i in 1:nrow(data)){
  if(data[i,]$v158 > 0 || data[i,]$v157 > 0 || data[i,]$v159 > 0){
    data[i,]$V25 <- 1
  }else{
    data[i,]$V25 <- 0
  }
}
# get the index of v158, v157, v159
index <- grep("v158|v157|v159", names(data))
# drop the columns with names v158, v157, v159
# data <- data[,-index]

write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_new25.dta")