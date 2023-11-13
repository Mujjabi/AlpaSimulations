
# Training Population Size ------------------------------------------------
startTrainPop = 17

trainPopYears = 4

# Number of Cycles - Population Improvement -------------------------------
nCycle = 3

# Crossing->DH ------------------------------------------------------------

#Parents per heterotic pool and crosses per cycle
nCrosses = nParents = 80

#DH lines produced per cross
nDH = 50

# Number of indiviuals select per family
famMaxDH = 50
famMaxYT1 = 10
famMaxYT2 = 5

# Selection on GCA --------------------------------------------------------

#Number of inbreds per heterotic pool per stage
nInbred1 = 4000
nInbred2 = 400
nInbred3 = 40

#Number of testers per heterotic pool per stage
#Values must be smaller than nElite
nTester1 = 1
nTester2 = 3

#Yield trial entries
nYT1 = nInbred1*nTester1 #Do not change
nYT2 = nInbred2*nTester2 #Do not change

# Selection on SCA --------------------------------------------------------

#Elite parents per heterotic pool
nElite = 5

#Elite YT size
nYT3 = nInbred3*nElite #Do not change
nYT4 = 40
nYT5 = 8


# Genetic and error terms -------------------------------------------------

#Number of QTL per chromosome
nQtl = 300

#Number of SNP per chromosome
nSnp1 = 500
nSnp2 = 1000
nSnp3 = 2000

#Heterotic pool split
nGenSplit = 100

#Initial inbred mean, bushels per acre
initMeanG = 70

#Initial inbred variance, bushels per acre
initVarG = 20
initVarEnv = 0
initVarGE = 1e-6

#Degree of dominance
ddMean = 0.92
ddVar = 0.2

#Yield trial error variance, bushels per acre
#Relates to error variance for an entry mean
varE = 270

#Yield trial effective replications for calculating error
#Roughly related to the number of locations relative to YT_1
repDH = 1
repYT1 = 6
repYT2 = 12
repYT3 = 24
repYT4 = 48
repYT5 = 600


#Fixed Effect Level Vector
fixEff = 0L
