catalan<-read.csv("catalan_dx1_distributions.csv",header=TRUE)
english<-read.csv("english_dx1_distributions.csv",header=TRUE)
english_cmu<-read.csv("English_CMU_Brown_dictionary_dx1_distributions.csv",header=TRUE)
finnish<-read.csv("finnish_dx1_distributions.csv",header=TRUE)
dutch<-read.csv("Dutch_dx1_distributions.csv",header=TRUE)
japanese<-read.csv("Japanese_dx1_distributions.csv",header=TRUE)
german<-read.csv("german_dx1_distributions.csv",header=TRUE)
italian<-read.csv("italian_dx1_distributions.csv",header=TRUE)
french<-read.csv("French_dx1_distributions.csv",header=TRUE)
latin<-read.csv("latin_dx1_distributions.csv",header=TRUE)

btx<-read.csv("voynich/voynich_B_T_X_dx1_distributions.csv",header=TRUE)
bfx<-read.csv("voynich/voynich_B_F_X_dx1_distributions.csv",header=TRUE)
bf2<-read.csv("voynich/voynich_B_F_2_dx1_distributions.csv",header=TRUE)
bc2<-read.csv("voynich/voynich_B_C_2_dx1_distributions.csv",header=TRUE)
al4<-read.csv("voynich/voynich_A_L_4_dx1_distributions.csv",header=TRUE)
af2<-read.csv("voynich/voynich_A_F_2_dx1_distributions.csv",header=TRUE)
af1<-read.csv("voynich/voynich_A_F_1_dx1_distributions.csv",header=TRUE)
ac1<-read.csv("voynich/voynich_A_C_1_dx1_distributions.csv",header=TRUE)

#############################
#initial language comparison#
#############################
# English
#--------------------#
pdf("plots.pdf",height=5,width=8)
qqplot(english$numUsages,english_cmu$numUsages,
       main="QQplot comparison of two english corpuses by number of words per root",
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
       main="QQplot comparison of two english corpuses by number of chunks per word",
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
#--------------------#
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
#--------------------#
qqplot(bfx$numUsages,italian$numUsages,
       main="QQplot comparison of bfx and italian by number of words per root",
       xlab="bfx",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(bfx$leafLens,italian$leafLens,
       main="QQplot comparison of bfx and italian by length of chunks",
       xlab="bfx",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bfx$usageLens,italian$usageLens,
       main="QQplot comparison of bfx and italian by number of chunks per word",
       xlab="bfx",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bfx$numUsages,french$numUsages,
       main="QQplot comparison of bfx and french by number of words per root",
       xlab="bfx",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(bfx$leafLens,french$leafLens,
       main="QQplot comparison of bfx and french by length of chunks",
       xlab="bfx",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bfx$usageLens,french$usageLens,
       main="QQplot comparison of bfx and french by number of chunks per word",
       xlab="bfx",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)
#BF2
#--------------------#
qqplot(bf2$numUsages,italian$numUsages,
       main="QQplot comparison of bf2 and italian by number of words per root",
       xlab="bf2",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(bf2$leafLens,italian$leafLens,
       main="QQplot comparison of bf2 and italian by length of chunks",
       xlab="bf2",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bf2$usageLens,italian$usageLens,
       main="QQplot comparison of bf2 and italian by number of chunks per word",
       xlab="bf2",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bf2$numUsages,french$numUsages,
       main="QQplot comparison of bf2 and french by number of words per root",
       xlab="bf2",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(bf2$leafLens,french$leafLens,
       main="QQplot comparison of bf2 and french by length of chunks",
       xlab="bf2",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bf2$usageLens,french$usageLens,
       main="QQplot comparison of bf2 and french by number of chunks per word",
       xlab="bf2",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

#BC2
#--------------------#
qqplot(bc2$numUsages,italian$numUsages,
       main="QQplot comparison of bc2 and italian by number of words per root",
       xlab="bc2",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(bc2$leafLens,italian$leafLens,
       main="QQplot comparison of bc2 and italian by length of chunks",
       xlab="bc2",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bc2$usageLens,italian$usageLens,
       main="QQplot comparison of bc2 and italian by number of chunks per word",
       xlab="bc2",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bc2$numUsages,french$numUsages,
       main="QQplot comparison of bc2 and french by number of words per root",
       xlab="bc2",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(bc2$leafLens,french$leafLens,
       main="QQplot comparison of bc2 and french by length of chunks",
       xlab="bc2",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(bc2$usageLens,french$usageLens,
       main="QQplot comparison of bc2 and french by number of chunks per word",
       xlab="bc2",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

#AL4
#--------------------#
qqplot(al4$numUsages,italian$numUsages,
       main="QQplot comparison of al4 and italian by number of words per root",
       xlab="al4",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(al4$leafLens,italian$leafLens,
       main="QQplot comparison of al4 and italian by length of chunks",
       xlab="al4",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(al4$usageLens,italian$usageLens,
       main="QQplot comparison of al4 and italian by number of chunks per word",
       xlab="al4",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(al4$numUsages,french$numUsages,
       main="QQplot comparison of al4 and french by number of words per root",
       xlab="al4",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(al4$leafLens,french$leafLens,
       main="QQplot comparison of al4 and french by length of chunks",
       xlab="al4",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(al4$usageLens,french$usageLens,
       main="QQplot comparison of al4 and french by number of chunks per word",
       xlab="al4",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

#AF2
#--------------------#
qqplot(af2$numUsages,italian$numUsages,
       main="QQplot comparison of af2 and italian by number of words per root",
       xlab="af2",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(af2$leafLens,italian$leafLens,
       main="QQplot comparison of af2 and italian by length of chunks",
       xlab="af2",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(af2$usageLens,italian$usageLens,
       main="QQplot comparison of af2 and italian by number of chunks per word",
       xlab="af2",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(af2$numUsages,french$numUsages,
       main="QQplot comparison of af2 and french by number of words per root",
       xlab="af2",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(af2$leafLens,french$leafLens,
       main="QQplot comparison of af2 and french by length of chunks",
       xlab="af2",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(af2$usageLens,french$usageLens,
       main="QQplot comparison of af2 and french by number of chunks per word",
       xlab="af2",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

#AF1
#--------------------#
qqplot(af1$numUsages,italian$numUsages,
       main="QQplot comparison of af1 and italian by number of words per root",
       xlab="af1",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(af1$leafLens,italian$leafLens,
       main="QQplot comparison of af1 and italian by length of chunks",
       xlab="af1",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(af1$usageLens,italian$usageLens,
       main="QQplot comparison of af1 and italian by number of chunks per word",
       xlab="af1",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(af1$numUsages,french$numUsages,
       main="QQplot comparison of af1 and french by number of words per root",
       xlab="af1",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(af1$leafLens,french$leafLens,
       main="QQplot comparison of af1 and french by length of chunks",
       xlab="af1",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(af1$usageLens,french$usageLens,
       main="QQplot comparison of af1 and french by number of chunks per word",
       xlab="af1",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1) 

#AC1
#--------------------#
qqplot(ac1$numUsages,italian$numUsages,
       main="QQplot comparison of ac1 and italian by number of words per root",
       xlab="ac1",
       ylab="italian")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(ac1$leafLens,italian$leafLens,
       main="QQplot comparison of ac1 and italian by length of chunks",
       xlab="ac1",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(ac1$usageLens,italian$usageLens,
       main="QQplot comparison of ac1 and italian by number of chunks per word",
       xlab="ac1",
       ylab="italian")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(ac1$numUsages,french$numUsages,
       main="QQplot comparison of ac1 and french by number of words per root",
       xlab="ac1",
       ylab="french")
mtext("successor freiquencies taken from left to right")
abline(0,1)

qqplot(ac1$leafLens,french$leafLens,
       main="QQplot comparison of ac1 and french by length of chunks",
       xlab="ac1",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)

qqplot(ac1$usageLens,french$usageLens,
       main="QQplot comparison of ac1 and french by number of chunks per word",
       xlab="ac1",
       ylab="french")
mtext("successor english taken from left to right")
abline(0,1)
dev.off()
