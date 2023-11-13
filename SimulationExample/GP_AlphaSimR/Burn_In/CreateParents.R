# Generate initial haplotypes
FOUNDERPOP = runMacs(nInd=nParents*2, 
                     nChr=10, 
                     segSites=nQtl+nSnp3,
                     inbred=TRUE, 
                     species="MAIZE",
                     split=nGenSplit)
SP = SimParam$new(FOUNDERPOP)
SP$restrSegSites(nQtl,nSnp3)
SP$addSnpChip(nSnp1)
SP$addSnpChip(nSnp2)
SP$addSnpChip(nSnp3)
SP$addTraitADG(nQtl,initMeanG,initVarG,
               initVarEnv,initVarGE,ddMean,ddVar)

# Split heterotic pools to form initial parents
FemaleParents = newPop(FOUNDERPOP[1:nParents])
MaleParents = newPop(FOUNDERPOP[(nParents+1):(nParents*2)])

#Set hybrid parents for later yield trials
MaleElite = selectInd(MaleParents,nElite,use="gv")
FemaleElite = selectInd(FemaleParents,nElite,use="gv")

#Reverse order to keep best parent in longer
MaleElite = MaleElite[nElite:1]
FemaleElite = FemaleElite[nElite:1]

MEP = cbind(MaleElite@id,rep(1,length(MaleElite@id)),rep(NA,length(MaleElite@id)),MaleElite@gv,rep(NA,length(MaleElite@id)))
FEP = cbind(FemaleElite@id,rep(1,length(FemaleElite@id)),rep(NA,length(FemaleElite@id)),FemaleElite@gv,rep(NA,length(FemaleElite@id)))

#Set initial testers for YT1 and YT2
#Requires nTesters to be smaller than nElite
MaleTester1 = MaleElite[1:nTester1]
FemaleTester1 = FemaleElite[1:nTester1]
MaleTester2 = MaleElite[1:nTester2]
FemaleTester2 = FemaleElite[1:nTester2]


