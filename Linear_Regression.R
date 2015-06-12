#################################################################
### Fitting Linear Regression
### DataSet :: FINAL_DATASET.csv Obs:37526 Var:29
################################################################

### Load Data
lin_dataset<- read.csv("/Users/Biplab/Desktop/FINAL_DATASET.csv")
head(lin_dataset)
summary(lin_dataset)
attach(lin_dataset)

### Fit Logistic Regression using training data set
lin_reg_model = lm(LOG.LOSS.~ F_SCALE_CAT+INJSQ+FATSQ+LEN+WID+
                     ST_CAT_S1+ST_CAT_S2+ST_CAT_S3+MO_CAT_O)

### summary of the model
summary(lin_reg_model)
