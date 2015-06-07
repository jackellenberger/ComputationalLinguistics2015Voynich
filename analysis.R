catalan<-read.csv("catalan.dx1_distributions.csv",header=TRUE)
english<-read.csv("english.dx1_distributions.csv",header=TRUE)
english_cmu<-read.csv("English_CMU_Brown_dictionary.dx1_distributions.csv",header=TRUE)
finnish<-read.csv("finnish.dx1_distributions.csv",header=TRUE)
dutch<-read.csv("Dutch.dx1_distributions.csv",header=TRUE)
japanese<-read.csv("Japanese.dx1_distributions.csv",header=TRUE)
german<-read.csv("german.dx1_distributions.csv",header=TRUE)
italian<-read.csv("italian.dx1_distributions.csv",header=TRUE)
french<-read.csv("French.dx1_distributions.csv",header=TRUE)
latin<-read.csv("latin.dx1_distributions.csv",header=TRUE)

btx<-read.csv("voynich/voynich_B_T_X.dx1_distributions.csv",header=TRUE)
bfx<-read.csv("voynich/voynich_B_F_X.dx1_distributions.csv",header=TRUE)
bf2<-read.csv("voynich/voynich_B_F_2.dx1_distributions.csv",header=TRUE)
bc2<-read.csv("voynich/voynich_B_C_2.dx1_distributions.csv",header=TRUE)
al4<-read.csv("voynich/voynich_A_L_4.dx1_distributions.csv",header=TRUE)
af2<-read.csv("voynich/voynich_A_F_2.dx1_distributions.csv",header=TRUE)
af1<-read.csv("voynich/voynich_A_F_1.dx1_distributions.csv",header=TRUE)
ac1<-read.csv("voynich/voynich_A_C_1.dx1_distributions.csv",header=TRUE)

#############################
#initial language comparison#
#############################
# English
#--------------------#
qqplot(english$numUsages,english_cmu$numUsages,
       main="QQplot comparison of two english corpuses by successor frequency splits",
       xlab="english.dx1",
       ylab="CMU english")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(english$leafLens,english_cmu$leafLens,
       main="QQplot comparison of two english corpuses by length of non-root chunks",
       xlab="english.dx1",
       ylab="CMU english")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(english$usageLens,english_cmu$usageLens,
       main="QQplot comparison of two english corpuses by number of instances of sucFreq > 1",
       xlab="english.dx1",
       ylab="CMU english")
mtext("successor freiquencies taken from left to right")
abline(0,1)


# Italian + Latin
#--------------------#
qqplot(italian$leafLens,latin$leafLens,
       main="QQplot comparison of latin and italian by length of chunks",
       xlab="Italian",
       ylab="Latin")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(italian$numUsages,latin$numUsages,
       main="QQplot comparison of latin and italian by number of words per root",
       xlab="Italian",
       ylab="Latin")
mtext("successor freiquencies taken from left to right")
abline(0,1)

# Dutch + Finnish
#--------------------#
qqplot(dutch$numUsages,finnish$numUsages,
       main="QQplot comparison of Dutch and Finnish by number of words per root",
       xlab="Dutch",
       ylab="Finnish")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(dutch$leafLens,finnish$leafLens,
       main="QQplot comparison of Dutch and Finnish by length of chunks",
       xlab="Dutch",
       ylab="Finnish")
mtext("successor freiquencies taken from left to right")
abline(0,1)

# Catalan + French
#--------------------#
qqplot(catalan$numUsages,french$numUsages,
       main="QQplot comparison of Catalan and French by number of words per root",
       xlab="Catalan",
       ylab="French")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(catalan$leafLens,french$leafLens,
       main="QQplot comparison of Catalan and French by length of chunks",
       xlab="Catalan",
       ylab="French")
mtext("successor freiquencies taken from left to right")
abline(0,1)

# Catalan + Italian
#--------------------#
qqplot(catalan$leafLens,italian$leafLens,
       main="QQplot comparison of Catalan and Italian by length of chunks",
       xlab="Catalan",
       ylab="Italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)


#########
#Voynich#
#########
#BTX
qqplot(btx$numUsages,english$numUsages,
       main="QQplot comparison of btx and english by number of words per root",
       xlab="btx",
       ylab="english")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(btx$leafLens,english$leafLens,
       main="QQplot comparison of btx and english by length of chunks",
       xlab="btx",
       ylab="english")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(btx$numUsages,french$numUsages,
       main="QQplot comparison of btx and french by number of words per root",
       xlab="btx",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(btx$leafLens,french$leafLens,
       main="QQplot comparison of btx and french by length of chunks",
       xlab="btx",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(btx$numUsages,latin$numUsages,
       main="QQplot comparison of btx and latin by number of words per root",
       xlab="btx",
       ylab="latin")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(btx$leafLens,latin$leafLens,
       main="QQplot comparison of btx and latin by length of chunks",
       xlab="btx",
       ylab="latin")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(btx$numUsages,german$numUsages,
       main="QQplot comparison of btx and german by number of words per root",
       xlab="btx",
       ylab="german")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(btx$leafLens,german$leafLens,
       main="QQplot comparison of btx and german by length of chunks",
       xlab="btx",
       ylab="german")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(btx$numUsages,italian$numUsages,
       main="QQplot comparison of btx and italian by number of words per root",
       xlab="btx",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(btx$leafLens,italian$leafLens,
       main="QQplot comparison of btx and italian by length of chunks",
       xlab="btx",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)
#BFX
#BF2
#BC2
##AL4
#AF2
#AF1 
#AC1

