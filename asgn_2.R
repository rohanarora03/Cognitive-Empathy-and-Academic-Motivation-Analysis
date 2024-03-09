library(tidyverse)
library(ggplot2)
library(gridExtra)

health_data <- read_csv("C:/Users/rohan/OneDrive/Desktop/Winter 2023/MSCI 718 (Statistics for Data Analytics) - MC 4020/Assignments/Assignment 2 - Correlation/Data Carrard et al. 2022 MedTeach.csv")
glimpse(health_data)
summary(health_data)
summary(health_data$amsp)
summary(health_data$job)
summary(health_data$qcae_cog)
str(health_data)
health_data

# Filtering to fetch all the males out of this data
health_data_mod <- filter(health_data, sex==1)
health_data_mod
# checking if other than male values are present or not
health_data_mod[health_data_mod$sex=='3',]
# checking for any Null values in the dataset
sum(is.na(health_data))

# selecting my required variables out of the whole dataset
health_data_mod <- health_data_mod %>%
  select("amsp", "qcae_cog", "job");
health_data_mod

#Checking for Outliers in the data
#job
health_data_mod %>%
  ggplot(aes(x=seq(job), y=job))+geom_point()
# Academic Motivation score of the participant
health_data_mod %>%
  ggplot(aes(x=seq(amsp), y=amsp))+geom_point()
# cognitive empathy score
health_data_mod %>%
  ggplot(aes(x=seq(qcae_cog), y=qcae_cog))+geom_point()

# geom_boxplot - might have to clean data, make categories and then plot x-axis
# Need to check linearity of our selected variables for correlation tests

# Linear Relationship b/w AMSP and QCAE plotted over a scatter plot
health_data_mod %>%
  ggplot(aes(x=amsp, y=qcae_cog))+geom_point()+
  geom_smooth(method = "lm",se=FALSE,color="red",size=0.5)+
  labs(x="Academic Motivation Score(AMSP)",y="Cognitive Empathy Score(QCAE)", 
       title = "Linearity between Academic Motivation and Cognitive Empathy Scores")

# visualizing the correlation in the dataset using corrplot package
install.packages("corrplot")
library(corrplot)
cr <- cor(health_data)
corrplot(cr)


#### AMSP
# Checking for normality
# histogram
health_data_mod %>% 
  ggplot(aes(amsp))+geom_histogram()
# boxplot -> could see outliers detected for values >30. So, we can remove these from original data.
# By removing > 30 data. Outliers outside of +-1.5*IQR is removed.
health_data_mod %>% 
  ggplot(aes(amsp))+geom_boxplot()
#plotting curve on the histogram
health_data_mod %>% 
  ggplot(aes(x=amsp)) + theme(legend.position = "none") +
  geom_histogram(aes(y=..density..)) + 
  stat_function(fun=dnorm, args=list(mean=mean(health_data_mod$amsp, na.rm=TRUE), sd=sd(health_data_mod$amsp, na.rm=TRUE)))
# Q-Q plot
health_data_mod %>% 
  ggplot(aes(sample=amsp))+stat_qq()
health_data_mod %>% 
  ggplot(aes(sample=amsp))+stat_qq()+geom_qq_line(aes(color="red"))+theme(legend.position = "none")+labs(x="X-axis", y="Y-axis")
# skewness & kurtosis - absolute value > 1 so its not normal right now
library(pastecs)
#stat.desc(health_data_mod$amsp)
stat.desc(health_data_mod$amsp, basic=FALSE, norm=TRUE)
# shapiro wilk test - nonNormal scores obtained
shapiro.test(health_data_mod$amsp)

#### QCAE
# Checking for normality
# histogram
health_data_mod %>% 
  ggplot(aes(qcae_cog))+geom_histogram()
# boxplot -> could see outliers detected for values >30. So, we can remove these from original data.
# By removing > 30 data. Outliers outside of +-1.5*IQR is removed.
health_data_mod %>% 
  ggplot(aes(qcae_cog))+geom_boxplot()
#plotting curve on the histogram
health_data_mod %>% 
  ggplot(aes(x=qcae_cog)) + theme(legend.position = "none") +
  geom_histogram(aes(y=..density..)) + 
  stat_function(fun=dnorm, args=list(mean=mean(health_data_mod$qcae_cog, na.rm=TRUE), sd=sd(health_data_mod$qcae_cog, na.rm=TRUE)))
# Q-Q plot
health_data_mod %>% 
  ggplot(aes(sample=qcae_cog))+stat_qq()
health_data_mod %>% 
  ggplot(aes(sample=qcae_cog))+stat_qq()+geom_qq_line(aes(color="red"))+theme(legend.position = "none")+labs(x="X-axis", y="Y-axis")
# skewness & kurtosis - absolute value > 1 so its not normal right now
library(pastecs)
#stat.desc(health_data_mod$qcae_cog)
stat.desc(health_data_mod$qcae_cog, basic=FALSE, norm=TRUE)
# shapiro wilk test - nonNormal scores obtained
shapiro.test(health_data_mod$qcae_cog)


# Grid arrange of Q-Q plots for AMSP & QCAE
amsp_qq <- ggplot(health_data_mod, mapping = aes(sample=amsp))+stat_qq()+geom_qq_line(aes(color="red"))+theme(legend.position = "none")+labs(x="Academic Motivation Score", y="Y-axis")
qcae_qq <- ggplot(health_data_mod, mapping = aes(sample=qcae_cog))+stat_qq()+geom_qq_line(aes(color="red"))+theme(legend.position = "none")+labs(x="Cognitive Empathy Score", y="Y-axis")

grid.arrange(amsp_qq, qcae_qq, nrow=1, top="Q-Q plot for Academic Motivation Score and Cognitive Empathy Score")


#### JOB
# Checking for normality
# histogram
health_data_mod %>% 
  ggplot(aes(job))+geom_histogram()
# boxplot -> could see outliers detected for values >30. So, we can remove these from original data.
# By removing > 30 data. Outliers outside of +-1.5*IQR is removed.
health_data_mod %>% 
  ggplot(aes(job))+geom_boxplot()
#plotting curve on the histogram
health_data_mod %>% 
  ggplot(aes(x=job)) + theme(legend.position = "none") +
  geom_histogram(aes(y=..density..)) + 
  stat_function(fun=dnorm, args=list(mean=mean(health_data_mod$job, na.rm=TRUE), sd=sd(health_data_mod$job, na.rm=TRUE)))
# Q-Q plot
health_data_mod %>% 
  ggplot(aes(sample=job))+stat_qq()
health_data_mod %>% 
  ggplot(aes(sample=job))+stat_qq()+geom_qq_line(aes(color="red"))+theme(legend.position = "none")+labs(x="X-axis", y="Y-axis")
# skewness & kurtosis - absolute value > 1 so its not normal right now
library(pastecs)
#stat.desc(health_data_mod$job)
stat.desc(health_data_mod$job, basic=FALSE, norm=TRUE)
# shapiro wilk test - nonNormal scores obtained
shapiro.test(health_data_mod$job)


# correlation matrix of the whole dataset
cor(health_data_mod)

# testing correlation between AMSP and QCAE_COG
cor.test(health_data_mod$amsp, health_data_mod$qcae_cog, method = "pearson")

# partial correlation test
library(ggm)

pcor(c("amsp", "qcae_cog", "job"), var(health_data_mod))
# 0.4915507
var(health_data_mod)
health_data_mod[health_data_mod$job=='1',]

pc <- pcor(c("amsp", "qcae_cog", "job"), var(health_data_mod))

pcor.test(pc,1, 275)
# $tval -> 9.309148
# $df -> 272
# $pvalue -> 4.490546e-18


################# calculation among all genders data ################
health_data_2 <- health_data %>%
  select("amsp", "qcae_cog", "job");
health_data_2
pcor(c("amsp", "qcae_cog", "job"), var(health_data_2))
#0.3385423
var(health_data_2)

pc <- pcor(c("amsp", "qcae_cog", "job"), var(health_data_2))
#str(health_data_mod$job)

pcor.test(pc,1, 886)
