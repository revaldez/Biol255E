#Week 2

#setting my work directory on this computer
setwd("C:Users/Rachael Valdez/Desktop/Files/Biol255E")


df = read.csv("../data/SVLCallisaurus.csv")
#install.packages('xlsx') #get access to read.xlsx function
library(xlsx)

ht = read.xlsx("data/Heating_trial_info.xlsx, SheetIndex = 1")

#backslash does not work, only use forward slash
#fail = read.csv("~\Desktop\Files\Biol255E")

#import tab-delimited data file

limp = read.table(file= 'data/LimpetRaspingRate.txt' , header = TRUE, 
                  sep = "\t")
boxplot(limp$Growth)

df = read.table("../data/SVLCallisaurus.csv" , header = TRUE , 
                sep = ",")

waves = read.fwf("data/CDIP_158_201702.txt")


test = readLines(con = "data/CDIP_158_201702.txt")

########plotting
dotchart(limp$Temperature)
dotchart(limp$Temperature, groups = limp$Species, 
         xlab = 'Temperature, C')

limp$Species == 'pelta' #distinguishing the true pelta or false pelta

limp$Temperature[limp$Species == 'pelta'] #Giving us temp. of the peltas

#making one plot
plot(x = limp$Temperature[limp$Species == 'pelta'],
     y = limp$RaspRate[limp$Species == 'pelta'] , 
     xlab = "Temperature,C", 
     ylab = "Rasp Rate, rasps/min", 
     main = "Rasping rate Vs Temp", 
     col = "purple",
     pch = 18, 
     xlim = range(limp$Temperature),
     ylim = range(limp$RaspRate))
points(x = limp$Temperature[limp$Species == 'scabra'],#use points to add on to plot
     y = limp$RaspRate[limp$Species == 'scabra'] , 
     main = "Rasping rate Vs Temp", 
     col = "purple",
     pch = 5)
legend("topleft", legend = c("pelta", "scabra"),
       pch = c(18, 5),
       title = 'species',
       col = ("purple")) #if 2 color put ("purple", "red")







