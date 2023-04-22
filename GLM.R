########library(haven)
########library(foreign)
########beta <- read.table("beta.txt", header = FALSE)
########ps <- read.table("ps.txt", header = FALSE)
########sem <- read.table("sem.txt", header = FALSE)
########
######### data <- read_dta("D:/Final_econ/final/dataset/IAIR52FL_s824aDrop_NA.dta")
######### print(dim(data))
######### data$prenatal <- data$m2a_1
######### attr(data$prenatal, "label") <- "Prenatal care"
######### attr(data$prenatal, "format.stata") <- attr(data$m2a_1, "format.stata")
######### attr(data$prenatal, "labels") <- attr(data$m2a_1, "labels")
######### # for all the rows take the value of m2a_1 and if it is 1, then set the value of prenatal to 1 else 0
######### for(i in 1:nrow(data)){
#########   if(data[i,]$m2a_1 == 1 || data[i,]$m2b_1 == 1 || data[i,]$m2d_1 == 1 || data[i,]$m2e_1 == 1){
#########     data[i,]$prenatal <- 1
#########   }else{
#########     data[i,]$prenatal <- 0
#########   }
######### }
######### # get the index of m2a_1, m2b_1, m2d_1
######### index <- grep("m2a_1|m2b_1|m2d_1|m2e_1", names(data))
######### # drop the columns with names m2a_1, m2b_1, m2d_1
######### # data <- data[,-index]
######### print(dim(data))
########
######### write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_s824aDrop_NA_prenatal.dta")
######### data <- read_dta("D:/Final_econ/final/dataset/IAIR52FL_s824aDrop_NA_prenatal.dta")
######### # get the datatype for  the column named prenatal
######### # print(class(data$m15_1))
######### # get all the attributs for the column named prenatal
######### print(attr(data$m15_1, "labels"))
######### print(attr(data$m15_1, "format.stata"))
######### print(attr(data$m15_1, "label"))
######### # if the values of the column m15_1 is 1, then set the value of m15_1 to 1 else 0
######### for(i in 1:nrow(data)){
#########   if(data[i,]$m15_1 == 10 || data[i,]$m15_1 == 11 ||data[i,]$m15_1 == 12 ||data[i,]$m15_1 == 13 ||data[i,]$m15_1 == 96 ){
#########     data[i,]$m15_1 <- 0
#########   }else{
#########     data[i,]$m15_1 <- 1
#########   }
######### }
######### # write the data to a new file
######### write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_s824aDrop_NA_prenatal_m15_1.dta")
########data <- read_dta("D:/Final_econ/final/dataset/IAIR52FL_s824aDrop_NA_prenatal_m15_1.dta")
######### get the column names whose class is haven labelled
########index <- grep("haven_labelled", sapply(data, class))
######### get the column names
########colnames <- names(data)
######### print(colnames[index])
######### set the reference category for the all the columns whose index is in the index variable to 0
######### write the data to a new file
######### write_dta(data, "D:/Final_econ/final/dataset/IAIR52FL_s824aDrop_NA_prenatal_m15_1_refcat.dta")
########
######### apply the glm function to the data for probit model by splitting the data into train and test
######### set the seed
######### set.seed(123)
######### # stratify train test split the data
######### train_data <- data[sample(1:nrow(data), 0.8*nrow(data)),]
######### test_data <- data[-sample(1:nrow(data), 0.8*nrow(data)),]
########
######### # get the index of the column named m15_1
######### index <- grep("m15_1|V24|prenatal", names(data))
######### # make the reference category for the column named v130 to be 1
########
######### # get the column names
######### colnames <- names(data)
######### # get the column names without the column named m15_1
######### colnames <- colnames[-index]
######### # get the formula for the probit model except the column named V24 and prenatal
######### formula <- as.formula(paste("prenatal ~", paste(colnames, collapse = "+")))
######### # formula <- prenatal ~ v025 + v106 + v113 + v116 + v130 + v212 + v447a + v701 + v705 + v717 + ssli + w124  + V25 + V26 
######### # formula <- as.formula(paste("m15_1 ~", paste(colnames, collapse = "+")))
######### print(formula)
######### # get the probit model
######### model <- glm(formula, data = train_data, family = binomial(link = "probit"))
######### # get the summary of the model and also the discription of the columns
######### print(summary(model) )
######### # run a for loop to get the discription of the columns
######### for (i in 1:length(data)) {
######### #   print(names(data)[i])
#########   discription <- attr(data[[i]], "label")
#########   # print the datatype of this column values
#########   print(discription)
#########  print(class(data[[i]]))
########
######### #   print the columns name
#########   print(names(data)[i])
######### }
########print(dim(data))
######### for all the columns whose datatype is haven labelled then set the reference category to 0
########
######### set.seed(123)
######### # stratify train test split the data
######### train_data <- data[sample(1:nrow(data), 0.8*nrow(data)),]
######### test_data <- data[-sample(1:nrow(data), 0.8*nrow(data)),]
########
######### get the index of the column named m15_1
########index <- grep("m15_1|V24|prenatal", names(data))
######### make the reference category for the column named v130 to be 1
########
######### get the column names
########colnames <- names(data)
######### get the column names without the column named m15_1
########colnames <- colnames[-index]
######### get the formula for the probit model except the column named V24 and prenatal
########formula <- as.formula(paste("prenatal ~", paste(colnames, collapse = "+")))
######### formula <- prenatal ~ v025 + v106 + v113 + v116 + v130 + v212 + v447a + v701 + v705 + v717 + ssli + w124  + V25 + V26 
######### formula <- as.formula(paste("m15_1 ~", paste(colnames, collapse = "+")))
######### print(formula)
######### get the probit model
########model <- glm(formula, data = train_data, family = binomial(link = "probit"))
######### get the summary of the model and also the discription of the columns
########print(summary(model) )
######### print the coefficients of the model
########print(coef(model))
######### print the discription of the column V25
######### print(attr(data$V25, "label"))
######### print(attr(data$V26, "label"))
########alpha <- coef(model)
######### get the datatype of alpha
########print(class(alpha))
######### iterate through alpha and print the datatype of each element
########for(i in 1:length(alpha)){
#########   print(class(alpha[i]))
########    print(alpha[[i]])
########}
######### get the size of the alpha
########print(length(alpha))
######### make a list of size 25
######### read the beta from the file beta.txt
########print(beta)
########
######### print the size of the beta
########print(length(beta))
########for(i in 1:length(alpha)){
#########   print(class(alpha[i]))
########    # print(alpha[[i]])
########    alpha[[i]] <- beta[[i]]
########}
########print(alpha)
########
########
########
######### get the column names
########colnames <- names(data)
#########remove the column v24
########colnames <- colnames[-grep("V24|m15_1", colnames)]
######### get the formula for the probit model where target variable is m15_1
########formula <- as.formula(paste("m15_1 ~", paste(colnames, collapse = "+")))
######### get the probit model
########model <- glm(formula, data = train_data, family = binomial(link = "probit"))
########
########model1C <- coef(model)
########
########
######### get the summary of the model and also the discription of the columns
######### print the coefficients of the model as well as their description
########print(sem)
########
########for (i in 1:length(model1C)) {
########  model1C[[i]] <- sem[[i]]
########}
########print(model1C)
######### get the column names
########colnames <- names(data)
#########remove the column v24
########colnames <- colnames[-grep("V24", colnames)]
######### get the formula for the probit model where target variable is V24
########formula <- as.formula(paste("V24 ~", paste(colnames, collapse = "+")))
######### get the probit model
########model <- glm(formula, data = train_data, family = binomial(link = "probit"))
########
########
########model2C <- coef(model)
########
######### get the summary of the model and also the discription of the columns
########print(summary(model) )
######### print the coefficients of the model as well as their description
########print(coef(model))
########
########for (i in 1:length(model2C)) {
########  model2C[[i]] <- ps[[i]]
########}
########print(model2C)
