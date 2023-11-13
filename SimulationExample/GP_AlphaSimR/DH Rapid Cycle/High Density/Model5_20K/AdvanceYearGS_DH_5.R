cat("Advancing Year\n")

# Advance breeding program by 1 year Works backwards through pipeline
# to avoid copying data

# Year 7 Release hybrid

# Year 6 Select
MaleHybridYT5 = selectInd(MaleHybridYT4, nYT5, use = "pheno")
FemaleHybridYT5 = selectInd(FemaleHybridYT4, nYT5, use = "pheno")
# Set Pheno/EBV
MaleHybridYT5 = setPheno(MaleHybridYT5, varE = varE, reps = repYT5, p = P[year])
FemaleHybridYT5 = setPheno(FemaleHybridYT5, varE = varE, reps = repYT5, 
                           p = P[year])
# Idenitfy Inbred Parent of Hybrid
MaleInbredYT5 = MaleInbredYT4[MaleInbredYT4@id %in% MaleHybridYT5@father]
FemaleInbredYT5 = FemaleInbredYT4[FemaleInbredYT4@id %in% FemaleHybridYT5@mother]

# Year 5 Select
MaleHybridYT4 = selectInd(MaleHybridYT3, nYT4, use = "pheno")
FemaleHybridYT4 = selectInd(FemaleHybridYT3, nYT4, use = "pheno")
# Set Pheno/EBV
MaleHybridYT4 = setPheno(MaleHybridYT4, varE = varE, reps = repYT4, p = P[year])
FemaleHybridYT4 = setPheno(FemaleHybridYT4, varE = varE, reps = repYT4, 
                           p = P[year])
# Idenitfy Inbred Parent of Hybrid
MaleInbredYT4 = MaleInbredYT3[MaleInbredYT3@id %in% MaleHybridYT4@father]
FemaleInbredYT4 = FemaleInbredYT3[FemaleInbredYT3@id %in% FemaleHybridYT4@mother]

# Year 4
fixEff = fixEff + 1L

MaleInbredYT2 = setEBV(MaleInbredYT2, gsModel, value = "male", targetPop = FemaleInbredYT2)
FemaleInbredYT2 = setEBV(FemaleInbredYT2, gsModel, value = "female", targetPop = MaleInbredYT2)

MaleInbredYT3 = selectInd(selectWithinFam(MaleInbredYT2, famMaxYT2, use = "ebv"), 
                          nInbred3, use = "ebv")
FemaleInbredYT3 = selectInd(selectWithinFam(FemaleInbredYT2, famMaxYT2, 
                                            use = "ebv"), nInbred3, use = "ebv")

MaleHybridYT3 = hybridCross(FemaleElite, MaleInbredYT3)
FemaleHybridYT3 = hybridCross(FemaleInbredYT3, MaleElite)

MaleHybridYT3 = setPheno(MaleHybridYT3, varE = varE, reps = repYT3, p = P[year], 
                         fixEff = fixEff)
FemaleHybridYT3 = setPheno(FemaleHybridYT3, varE = varE, reps = repYT3, 
                           p = P[year], fixEff = fixEff)

MaleInbredYT3@pheno = as.matrix(calcGCA(MaleHybridYT3)$GCAm[,2])
MaleInbredYT3@fixEff = rep(fixEff, nInd(MaleInbredYT3))

FemaleInbredYT3@pheno = as.matrix(calcGCA(FemaleHybridYT3)$GCAf[,2])
FemaleInbredYT3@fixEff = rep(fixEff, nInd(FemaleInbredYT3))

# Year 3
fixEff = fixEff + 1L

MaleInbredYT1 = setEBV(MaleInbredYT1, gsModel, value = "male", targetPop = FemaleInbredYT1)
FemaleInbredYT1 = setEBV(FemaleInbredYT1, gsModel, value = "female", targetPop = MaleInbredYT1)

MaleInbredYT2 = selectInd(selectWithinFam(MaleInbredYT1, famMaxYT1, use = "ebv"), 
                          nInbred2, use = "ebv")
FemaleInbredYT2 = selectInd(selectWithinFam(FemaleInbredYT1, famMaxYT1, 
                                            use = "ebv"), nInbred2, use = "ebv")

MaleHybridYT2 = hybridCross(FemaleTester2, MaleInbredYT2)
FemaleHybridYT2 = hybridCross(FemaleInbredYT2, MaleTester2)

MaleHybridYT2 = setPheno(MaleHybridYT2, varE = varE, reps = repYT2, p = P[year], 
                         fixEff = fixEff)
FemaleHybridYT2 = setPheno(FemaleHybridYT2, varE = varE, reps = repYT2, 
                           p = P[year], fixEff = fixEff)

MaleInbredYT2@pheno = as.matrix(calcGCA(MaleHybridYT2)$GCAm[,2])
MaleInbredYT2@fixEff = rep(fixEff, nInd(MaleInbredYT2))

FemaleInbredYT2@pheno = as.matrix(calcGCA(FemaleHybridYT2)$GCAf[,2])
FemaleInbredYT2@fixEff = rep(fixEff, nInd(FemaleInbredYT2))

# Year 2
fixEff = fixEff + 1L

MaleInbredYT1 = MaleDH
FemaleInbredYT1 = FemaleDH

MaleHybridYT1 = hybridCross(FemaleTester1, MaleInbredYT1)
FemaleHybridYT1 = hybridCross(FemaleInbredYT1, MaleTester1)

MaleHybridYT1 = setPheno(MaleHybridYT1, varE = varE, reps = repYT1, p = P[year], 
                         fixEff = fixEff)
FemaleHybridYT1 = setPheno(FemaleHybridYT1, varE = varE, reps = repYT1, 
                           p = P[year], fixEff = fixEff)

MaleInbredYT1@pheno = as.matrix(calcGCA(MaleHybridYT1)$GCAm[,2])
MaleInbredYT1@fixEff = rep(fixEff, nInd(MaleInbredYT1))  # set manually fixed effects

FemaleInbredYT1@pheno = as.matrix(calcGCA(FemaleHybridYT1)$GCAf[,2])
FemaleInbredYT1@fixEff = rep(fixEff, nInd(FemaleInbredYT1))  # set manually fixed effects

# Year 1
maxAvoidPlan = function(nInd,nProgeny=2L){
  crossPlan = matrix(1:nInd,ncol=2,byrow=TRUE)
  tmp = c(seq(1,nInd,by=2),
          seq(2,nInd,by=2))
  crossPlan = cbind(rep(tmp[crossPlan[,1]], 
                        each=2*nProgeny),
                    rep(tmp[crossPlan[,2]], 
                        each=2*nProgeny))
  return(crossPlan)
}

MaleDH = setEBV(MaleDH, gsModel, value = "male", targetPop = FemaleDH)
FemaleDH = setEBV(FemaleDH, gsModel, value = "female", targetPop = MaleDH)

MaleParents = selectWithinFam(MaleDH, 2, use = "ebv")
FemaleParents = selectWithinFam(FemaleDH, 2, use = "ebv")

MaleF1 = makeCross(MaleParents, maxAvoidPlan(nParents * 2, 1)) # generating 1 F1 from each of 160 parents
FemaleF1 = makeCross(FemaleParents, maxAvoidPlan(nParents * 2, 1)) # generating 1 F1 from each of 160 parents

MaleDH = makeDH(MaleF1, nDH/2) # making 25 DHs from each parent (160)
FemaleDH = makeDH(FemaleF1, nDH/2) # making 25 DHs from each parent (160)
