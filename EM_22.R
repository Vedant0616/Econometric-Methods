library(haven)
library(foreign)
# make a function to calulate the mode of a column

# data <- read_dta("D:/Final_econ/final/dataset/IAIR52FL_new25.dta")
# print(dim(data))
# data$V26 <- data$s824a
# attr(data$V26, "label") <- "Allowed to go"
# attr(data$V26, "format.stata") <- attr(data$s824a, "format.stata")
# attr(data$V26, "labels") <- attr(data$s824a, "labels")
# for(i in 1:nrow(data)){
#     # make a count a,b,c
#     counta <- 0
#     countb <- 0
#     countc <- 0
#     # if the value of s824a is 1, then increment counta
#     if(data[i,]$s824a == 1){
#         counta <- counta + 1
#     }
#     else if(data[i,]$s824a == 2){
#         countb <- countb + 1
#     }
#     else if(data[i,]$s824a == 3){
#         countc <- countc + 1
#     }
#     # if the value of s824b is 1, then increment countb
#     if(data[i,]$s824b == 1){
#         countb <- countb + 1
#     }
#     else if(data[i,]$s824b == 2){
#         counta <- counta + 1
#     }
#     else if(data[i,]$s824b == 3){
#         countc <- countc + 1
#     }
#     # if the value of s824c is 1, then increment countc
#     if(data[i,]$s824c == 1){
#         countc <- countc + 1
#     }
#     else if(data[i,]$s824c == 2){
#         countb <- countb + 1
#     }
#     else if(data[i,]$s824c == 3){
#         counta <- counta + 1
#     }
#     # if counta == countb == countc, then set the value of V26 to 1
#     if(counta == countb && countb == countc){
#         data[i,]$V26 <- 1
#     }
#     # if counta > countb and counta > countc, then set the value of V26 to 2
#     else if(counta > countb && counta > countc){
#         data[i,]$V26 <- 1
#     }
#     # if countb > counta and countb > countc, then set the value of V26 to 3
#     else if(countb > counta && countb > countc){
#         data[i,]$V26 <- 2
#     }
#     # if countc > counta and countc > countb, then set the value of V26 to 4
#     else if(countc > counta && countc > countb){
#         data[i,]$V26 <- 3
#     }
# }
# # get the dimensions of the data
# print(dim(data))
# # get the index of s824a, s824b, s824c
# index <- grep("s824a|s824b|s824c", names(data))
# # drop the columns with names s824a, s824b, s824c
# # data <- data[,-index]
# # write the data to a new file
# write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_s824aDrop.dta")
# print(dim(data))
data <- read_dta("D:/Final_econ/final/dataset/IAIR52FL_s824aDrop.dta")
print(dim(data))
# traverse all the columns and if there is NA in any of the columns, then set the value of that row to mode of that column
for(i in 1:ncol(data)){
    # get the mode of the column
    # if the name of the column is V26, then skip it
    if(names(data)[i] == "v025" ||names(data)[i] == "v106" ||names(data)[i] == "v130" ||names(data)[i] == "m2a_1" ||names(data)[i] == "m2b_1" ||names(data)[i] == "m2d_1" ||names(data)[i] == "m2e_1" ||names(data)[i] == "v701" ||names(data)[i] == "v705" ||names(data)[i] == "v717" ||names(data)[i] == "V24" ||names(data)[i] == "w124" ||names(data)[i] == "ssli" || names(data)[i] == "v113" ||names(data)[i] == "v116" || names(data)[i] == "m15_1" )
    {
        # make a map storing the frequency of each value in the column
        map <- table(data[,i])
        # get the mode of the column
        mode <- names(which.max(map))
        # print(mode)
        # fill the NA values with the mode of the column and typecast it to the datatype of the column
        data[is.na(data[,i]),i] <- as.numeric(as.character(mode))

    }
    else{
        # get the count of all non-NA values in the column
        count <- sum(!is.na(data[,i]))
        # get the sum of all non-NA values in the column
        sum <- sum(data[,i], na.rm = TRUE)
        # get the mean of all non-NA values in the column
        mean <- sum/count
        # fill the NA values with the mean of the column and typecast it to the datatype of the column
        data[is.na(data[,i]),i] <- as.numeric(as.character(mean))
        print(mean)


    }
}
# write the data to a new file
write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_s824aDrop_NA.dta")