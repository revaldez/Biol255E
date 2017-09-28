df = read.csv("./Data/california-state-university-2015.csv")

df_filtered = df[df$Job.Title == 'MASON',]

boxplot(df_filtered$Base.Pay,
        main = 'Base Pay at CSU\'s in 2015',
        xlab = 'Masons',
        ylab = 'Thousands')

