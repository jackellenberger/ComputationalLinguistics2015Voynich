#!/usr/bin/python

import sys
import re
import math
import numpy as np
import operator
from pprint import pprint
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
import csv

#######################################
## UTILITIES ##
###############
_digits = re.compile('\d')
def contains_digits(d):
	return bool(_digits.search(d))
def addToDict(dic,elem):
	if elem not in dic:
		dic[elem] = 0
	dic[elem] += 1
#######################################
## ALGORITHM ##
###############
def algorithm(families,minStem,splitDict,isL2R):
	for root,residues in families.items():
		for tail in residues:
			sliceAt=[]
			for index in range(0,len(tail)+1):
				freq = sum([x.strip().startswith(tail[0:index]) for x in residues])
				nextfreq = sum([x.strip().startswith(tail[0:index+1]) for x in residues])
				if tail[0:index] != "" and freq > 1 and freq != nextfreq: 
					sliceAt.append(index)
			sliceAt.append(len(tail))
			t = 0
			if isL2R: 
				splitDict[root+tail].append(root)
				for loc in sliceAt:
					splitDict[root+tail].append(tail[t:loc])
					t=loc
			else: 
				splitDict[root+tail].append(root[::-1])
				for loc in sliceAt:
					splitDict[root+tail].append(tail[t:loc][::-1])
					t=loc

	return splitDict

def analyze(filename, wordSplitDict):
	rootWordDict = {}
	rootUsageDict = {}
	for word,split in wordSplitDict.items():
		if split[0] not in rootWordDict:
			rootWordDict[split[0]] = []
		rootWordDict[split[0]].append(word)
		if split[0] not in rootUsageDict:
			rootUsageDict[split[0]] = []
		rootUsageDict[split[0]].append(split[1:])

	numUsages = [] #for each root, the number of words with that root
	usageLens = [] #for each split word (usage of root), the number of split parts
	leafLens = []  #for each part (leaf), the number of letters in the part
	numLeaves = []
	leafCountDict = {}
	for root,usage in rootUsageDict.items():
		numUsages.append(len(usage))
		for leafList in usage:
			usageLens.append(len(leafList))
			for leaf in leafList:
				leafLens.append(len(leaf))
				addToDict(leafCountDict,leaf)

	pp = PdfPages(filename + '_histograms.pdf')
	
	plt.figure(1)
	leafLensLimit = min(np.mean(leafLens)+5*np.std(leafLens),max(leafLens))
	plt.hist(leafLens,bins=leafLensLimit,range=[0,leafLensLimit])
	plt.title("length of leaves in "+filename)
	#plt.show()
	pp.savefig()

	plt.figure(2)
	usageLensLimit = min(np.mean(usageLens)+5*np.std(usageLens),max(usageLens))
	plt.hist(usageLens,bins=usageLensLimit,range=[0,usageLensLimit])
	plt.title("number of phonemes per word in "+filename)
	#plt.show()
	pp.savefig()
	
	plt.figure(3)
	numUsagesLimit = min(np.mean(numUsages)+5*np.std(numUsages),max(numUsages))
	plt.hist(numUsages,bins=numUsagesLimit,range=[0,numUsagesLimit])
	plt.title("number of words per root in "+filename)
	#plt.show()
	pp.savefig()

	pp.close()
	csvOut = open(filename + "_distributions.csv","w")
	writer = csv.writer(csvOut)
	writer.writerow(["leafLens", "usageLens", "numUsages"])
	rows = map(None,leafLens,usageLens,numUsages)
	for row in rows:
		writer.writerow(row)
	csvOut.close()


#######################################
## MAIN ##
##########
def main():
	if len(sys.argv) < 3:
		print "too few arguments " + str(len(sys.argv))
		print "usage: ./sucfreq.py file.txt minimalStemLength"
		return
	filename = sys.argv[1]
	minStem = int(sys.argv[2])
	f = open(filename,"r")
	familiesL2R = {}
	familiesR2L = {}
	splitL2R = {}
	splitR2L = {}
	for line in f:
		words = line.split()
		for word in words:
			#initialization/parsing
			if contains_digits(word) or len(word) < minStem: continue
			#left to right
			splitL2R[word] = []
			if word[0:minStem] not in familiesL2R:
				familiesL2R[word[0:minStem]] = []
			familiesL2R[word[0:minStem]].append(word[minStem:len(word)])
			#right to left
			revWord = word[::-1]
			splitR2L[revWord] = []
			if revWord[0:minStem] not in familiesR2L:
				familiesR2L[revWord[0:minStem]] = []
			familiesR2L[revWord[0:minStem]].append(revWord[minStem:len(revWord)])
	#run algorithm

	splitL2R = algorithm(familiesL2R, minStem,splitL2R,True)
	splitR2L = algorithm(familiesR2L, minStem,splitR2L,False)

	outf = open(str(filename)+"_forward_"+str(minStem)+".txt","w")
	for items in sorted(splitL2R.values()):
		for i in items:
			outf.write(' %-8s'%i)
		outf.write("\n")
	outb = open(str(filename)+"_backward_"+str(minStem)+".txt","w")
	maxSplits = len(splitR2L[max(splitR2L, key=lambda k: len(splitR2L[k]))])
	for items in sorted(splitR2L.values()):
		for f in range(len(items),maxSplits):
			outb.write(' %-8s'%"")
		for i in reversed(items):
			outb.write(' %-8s'% i)
		outb.write("\n")

	outf.close()
	outb.close()

	analyze(filename,splitL2R)
	#analyze(splitR2L)


main()