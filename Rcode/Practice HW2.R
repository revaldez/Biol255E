setwd("~/Desktop/Files/Biol255E/")
df = read.csv('data/california-state-university-2015.csv')


#RESEARCH TECHNICIAN I
#RESEARCH TECHNICIAN II
#RESEARCH TECHNICIAN III

# RTI = df[df$Job.Title == 'RESEARCH TECHNICIAN I',]
# RTII = df[df$Job.Title == 'RESEARCH TECHNICIAN II',]
# RTIII = df[df$Job.Title == 'RESEARCH TECHNICIAN III',]

# RTS = data.frame(rbind(RTI, RTII, RTIII)) #combines all research technicians data
# #Everything above is right, now how to separate Research techs


titles = c("RESEARCH TECHNICIAN I", "RESEARCH TECHNICIAN II", "RESEARCH TECHNICIAN III")
RTS = df[df$Job.Title %in% titles,] # keeping those in the set

print(aggregate(RTS$Base.Pay~RTS$Job.Title, 
          data = RTS, FUN = mean)) #calculates mean of each job title

RTS$Job.Title = factor(RTS$Job.Title) #refactoring to eliminate empty levels.

boxplot(RTS$Base.Pay~RTS$Job.Title, 
        names = c("RTI", "RTII", "RTIII"),
        main = "Salary Distribution of Research Technician\'s",
        ylab = 'Thousands',
        xlab = 'Research Technician(RT)',
        col = c('lavender', 'violet', 'purple'))



#boxplot(RTS$Base.Pay, 
      #  main = "Research Technician Salary", 
      #  ylab = 'Thousands', 
       # xlab = 'Research Technician')
#boxplot(Job.Title ~ Base.Pay)
#boxplot(Job Title~Base Pay)

#boxplot(RTS~Base Pay)
#boxplot(RTS$Base.Pay ['Job Title == RESEARCH TECHNICIAN I'] )
#boxplot(Base Pay.mm~Job Title, data = RTS)

#boxplot(Job Title~Base Pay, data = RTS, subset = RTI)
#boxplot(Job Title~Base Pay)


#boxplot(RTS[Job Title == RESEARCH TECHNICIAN I])

#boxplot(Base Pay.mm~RESEARCH TECHNICIAN, data = RTS, 
       # xlab = 'RESEARCH TECHNICIAN',
       # ylab = 'Base Pay')


