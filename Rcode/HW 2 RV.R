setwd("~/Desktop/Files/Biol255E/")
df = read.csv('data/california-state-university-2015.csv')

#ACCOUNTING TECHNICIAN I
#ACCOUNTING TECHNICIAN II
#ACCOUNTING TECHNICIAN III

ATI = df[df$Job.Title == 'ACCOUNTING TECHNICIAN I',]
ATII = df[df$Job.Title == 'ACCOUNTING TECHNICIAN II',]
ATIII = df[df$Job.Title == 'ACCOUNTING TECHNICIAN III',]

ATS = rbind(ATI, ATII, ATIII) #combines all Accounting Technicians data

ATS$Job.Title = factor(ATS$Job.Title)

boxplot(ATS$Base.Pay~ATS$Job.Title, 
        names = c("ATI", "ATII", "ATIII"),
        main = "Salary Distribution of Accounting Technician\'s",
        ylab = 'Thousands',
        xlab = 'Accounting Technician(AT)',
        col = c('lavender', 'violet', 'purple'))

print(aggregate(ATS$Base.Pay~ATS$Job.Title, 
                data = ATS, FUN = mean)) #calculates mean of each AT position