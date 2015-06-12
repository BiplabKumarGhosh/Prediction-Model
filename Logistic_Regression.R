#################################################################
### Fitting Logistic Regression
### DataSet :: combined_dataset.csv Obs:59946 Var:28
#################################################################

### Load Data
log_dataset<- read.csv("/Users/Biplab/Desktop/combined_dataset_log.csv")
head(log_dataset)
summary(log_dataset)
attach(log_dataset)

### Split data into training data set and testing data set
training = (YR < 2001)
testing = !training

training_dataset = log_dataset[training, ]
testing_dataset = log_dataset[testing, ]

loss_test = CAT_LOSS[testing]

### Fit Logistic Regression using training data set
log_reg_model = glm(CAT_LOSS~ INJ+FAT+LEN+WID, data=training_dataset, family=binomial)
summary(log_reg_model)

### Use the fitted model on test data set
log_reg_model_predict = predict(log_reg_model,testing_dataset,type="response")
summary(log_reg_model_predict)

model_pre = rep("0", 17768)
model_pre[log_reg_model_predict > 0] ="1"

### Confusion matrix
table(model_pre,loss_test)