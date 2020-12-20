##Installing the Required Packages
install.packages("rio") ##For exporting the dataset obtained
install.packages("twitteR") ##Twitter API

#Requiring Libraries:
library(twitteR)
library(rio)

#Consumer key and Access Tokens: #NOT MINE THO
consumerKey <- 'Nt7ynRIbnJHZ4YggIshkoo208'
consumerSecret <- 'TV1oZol5VHKNJprHgKDjoSUUN08KAF7b3PzqlmyPkwRRybCSWd'
accessToken <- '706742912629903361-sLCNwv4WRlpJnLwhASItGqTeFMAeE5X' 
accessTokenSecret <- 'G6AheJ02ul8ZXJI1CcVWURQXBXDGGr1YCDlJpnHe3CuQa' 

#Taking access from Twitter:
setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)

#Searching twitter for the following hashtags up to n number.
trump <- searchTwitter("#maga",n = 1000,resultType = "recent")
joe <- searchTwitter("#joebiden",n = 1000,resultType = "recent")
length(trump)
length(joe)

#twListToDf() converts tweets data file into a Data Frame(List Format)
trumpdf <- twListToDF(trump)
joedf <- twListToDF(joe)

#Removing Insignificant fields from the DataFrame.
##The fields that are more signifant are text,screenName,replyToSN,isRetweet,retweetCount
trump <- trumpdf[,c(1,4,11,12,13)]
joe <- joedf[,c(1,4,11,12,13)]

#Viewing and Exporting the DF
View(votefortrumpdf) 
export(trump, "trump.csv")
export(joep, "joe.csv")

##Visualising the Data in Gephi##
