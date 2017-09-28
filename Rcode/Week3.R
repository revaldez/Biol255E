library(readxl)

setwd("~/Desktop/Files/Biol255E/")

df = read_excel(path = "Data/Reinhart-Rogoff.xlsx", na='n.a.' )

mean(df$`90 or above`, na.rm=TRUE)

mean(df$`90 or above` [1:15], na.rm=TRUE)

#########################
df = read.csv('Data/Messy_means2.csv')

dotchart(df$Value) #lists all values in file
#dotchart showed two outliers on both spectrums, we are going to remove outliers
#remove using the NA by getting max and min values
min(df$Value)#wrong method to use

#set the min value in dataset to NA
df[which.min(df$Value), 'Value', na.rm=TRUE] = NA
df[48, 'Value'] = NA
#set max value in dataset to NA
df[which.max(df$Value), 'Value', na.rm=TRUE] = NA #
df[22, 'Value'] = NA #same as line above, but if value is wrong (22) it will give wrong number

#New dotchart shows cluster of real data points
dotchart(df$Value)

df$Type == 'Mean'
df$Value[df$Type == 'Mean']
df[df$Type == 'Mean', "Value"] #same as line above, diff. way of writing
mymeans = df[df$Type == 'Mean', "Value"] #mymeans = mean of values
mean(mymeans)

######################

df = read_excel("Data/Heating_trial_info.xlsx")
str(df)

#some of these columns(3-8) should be factors
df[, 3:8] = lapply(df[,3:8], factor)

#use levels() to see all the levels of a categorical factor
levels(df$TCchannel)
levels(df$MusselTagID)
levels(df$`Gaping?`)

#use summary() to show counts of factor columns
summary(df)
summary(df$MusselTagID)
#summary() used on numeric columns show quartiles
summary(df$TrialNumber)

#use table() to show counts of categorical variables in a column
table(df$AliveDead)
table(df$TCLocation)

#use xtabs() to make a contingency table of ocunts of factors
xtabs( ~AliveDead + MusselTagID, data = df)
#for 3 columns, you get a 3D table
xtabs( ~AliveDead + MusselTagID + TCLocation, data = df)

###############################
#Read in one svlcallisaurus file
svl1 = read.csv('Data/SVLCallisaurus.csv')
str(svl1)
#read in other
svl2 = read_csv('Data/SVLCallisaurus2.csv')
str(svl2)

#both data frames, svl1 and svl2, share the same column titels and order
#columns, so they oculd be put togethether

svlA11 = rbind(svl1, svl2)

colnames(svl1) = c('Animal.ID', 'Sex', 'SVL.mm')
colnames(svl2) = c('Animal.ID', 'Sex', 'SVL.mm')
#if rbind doesn't work, column names may not work, changed them above
svlA11 = rbind(svl1, svl2)

#save joined files as new csv file
write.csv(x = svlA11, file = 'Data/SVLjoined.csv', row.names = FALSE)

##########################
boxplot(SVL.mm~Sex, data = svlA11, xlab = 'Sex',
        ylab = 'Snout-vent length, mm')


#############################HW relevant
df = read.csv('Data/california-state-university-2015.csv')

levels(df$Job.Title)#will print out all job titles

#RESEARCH TECHNICIAN I
#RESEARCH TECHNICIAN II
#RESEARCH TECHNICIAN III

RTI = df[df$Job.Title == 'RESEARCH TECHNICIAN I',]
RTII = df[df$Job.Title == 'RESEARCH TECHNICIAN II',]
RTIII = df[df$Job.Title == 'RESEARCH TECHNICIAN III',]

RTS = rbind(RTI, RTII, RTIII)


dfsub=droplevels(dfsub)#will remove all jobs except of RT I, II and II. Necessary for hw

boxplot(Base Pay.mm~RESEARCH TECHNICIAN, data = RTS, xlab = 'RESEARCH TECHNICIAN',
        ylab = 'Base Pay')

#change the order of the factors, refer back to svl1
svl1$Sex = factor(svl1$Sex, levels = c('M','F'))

boxplot(Snout.Vent.Length..mm.~Sex, data = svl1,
        names = c('Male, 'Female'))

aggregate(Snout.Vent.Length..mm.~Sex, data = svl1, FUN = mean)

jobs = levels(df$Job.Title)
jobs[grep(pattern = " CHAN", x = jobs)] #has space before chan


