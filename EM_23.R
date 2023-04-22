library(haven)
library(foreign)

data <- read_dta("D:/Final_econ/final/dataset/IAIR52FL.dta")
data2 <- read_dta("D:/Final_econ/econo death/dataset/IAIR52FL_new21.dta")
print(dim(data))
print(dim(data2))
# merge the last column of data2 to data and write it to a new file
data$V24 <- data2$V21
attr(data$V24, "label") <- attr(data2$V21, "label")
attr(data$V24, "format.stata") <- attr(data2$V21, "format.stata")
attr(data$V24, "labels") <- attr(data2$V21, "labels")
write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_new24.dta")


# take starting 100 rows of this data and all the colums and write them to a new file


# data <- data[,colSums(is.na(data)) < 0.9 * nrow(data)]
# # traverse in opposite direction
# for (i in length(data):1) {
# #   print(names(data)[i])
#   discription <- attr(data[[i]], "label")
# #   print(discription)
# # check if the rows of this column contains anem or haemoglobin 
# # for(j in 1:length(data[[i]])){
#     # if(grepl("anem", data[[i]][j], ignore.case = TRUE)  | grepl("haem", data[[i]][j], ignore.case = TRUE) | grepl("iron",data[[i]][j], ignore.case = TRUE)){
#     #     print("hy")
#     # }
# # }
# if(grepl("", discription, ignore.case = TRUE)  ){
#     print(discription)
#     # print((data)[i])
#     # print the different values of this column
#     # print(unique(data[[i]]))
# }
# #   if(grepl("money", discription, ignore.case = TRUE)){
# #     print(discription)
# #     # data <- data[,-i]
# #     # print the different values of this column
# #     print(unique(data[[i]]))
# #     # print((data)[i])
# #   }

# }
# take the starting 100 rows of this dataset and write them to a new dta file 


# print(dim(data))