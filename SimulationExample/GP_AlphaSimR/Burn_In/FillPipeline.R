#Set initial yield trials with unique individuals
P = runif(5)
for(year in 1:6){
  cat("FillPipeline year:",year,"of 6\n")
  #Year 1
  MaleF1 = randCross(MaleParents,nCrosses, balance = FALSE)
  FemaleF1 = randCross(FemaleParents,nCrosses,balance = FALSE)
  MaleDH = makeDH(MaleF1,nDH)
  FemaleDH = makeDH(FemaleF1,nDH)
  if(year<6){
    #Year 2
    MaleInbredYT1 = MaleDH
    FemaleInbredYT1 = FemaleDH
    MaleHybridYT1 = hybridCross(FemaleTester1,MaleInbredYT1)
    FemaleHybridYT1 = hybridCross(FemaleInbredYT1,MaleTester1)
    MaleHybridYT1 = setPheno(MaleHybridYT1,varE=varE,
                             reps=repYT1,p=P[year])
    FemaleHybridYT1 = setPheno(FemaleHybridYT1,varE=varE,
                               reps=repYT1,p=P[year])
    tmp = calcGCA(MaleHybridYT1)$GCAm                                                    
    MaleInbredYT1@pheno = matrix(tmp[,2])                                                   
    tmp = calcGCA(FemaleHybridYT1)$GCAf
    FemaleInbredYT1@pheno = matrix(tmp[,2])
  }
  if(year<5){
    #Year 3
    MaleInbredYT2 = selectInd(MaleInbredYT1,nInbred2)
    FemaleInbredYT2 = selectInd(FemaleInbredYT1,nInbred2)
    MaleHybridYT2 = hybridCross(FemaleTester2,MaleInbredYT2)
    FemaleHybridYT2 = hybridCross(FemaleInbredYT2,MaleTester2)
    MaleHybridYT2 = setPheno(MaleHybridYT2,varE=varE,
                             reps=repYT2,p=P[year+1L])
    FemaleHybridYT2 = setPheno(FemaleHybridYT2,varE=varE,
                               reps=repYT2,p=P[year+1L])
    tmp = calcGCA(MaleHybridYT2)$GCAm
    MaleInbredYT2@pheno = matrix(tmp[,2])
    tmp = calcGCA(FemaleHybridYT2)$GCAf
    FemaleInbredYT2@pheno = matrix(tmp[,2])
  }
  if(year<4){
    #Year 4
    MaleInbredYT3 = selectInd(MaleInbredYT2,nInbred3)
    FemaleInbredYT3 = selectInd(FemaleInbredYT2,nInbred3)

    MaleInbredYT3_old = MaleInbredYT3
    FemaleInbredYT3_old = FemaleInbredYT3

    MaleHybridYT3 = hybridCross(FemaleElite,MaleInbredYT3)
    FemaleHybridYT3 = hybridCross(FemaleInbredYT3,MaleElite)
    MaleHybridYT3 = setPheno(MaleHybridYT3,varE=varE,
                             reps=repYT3,p=P[year+2L])
    FemaleHybridYT3 = setPheno(FemaleHybridYT3,varE=varE,
                               reps=repYT3,p=P[year+2L])
    
  }
  if(year<3){
    #Year 5
    MaleHybridYT4 = selectInd(MaleHybridYT3,nYT4)
    FemaleHybridYT4 = selectInd(FemaleHybridYT3,nYT4)
    MaleHybridYT4 = setPheno(MaleHybridYT4,varE=varE,
                             reps=repYT4,p=P[year+3L])
    FemaleHybridYT4 = setPheno(FemaleHybridYT4,varE=varE,
                               reps=repYT4,p=P[year+3L])
    MaleInbredYT4 = MaleInbredYT3[
      MaleInbredYT3@id%in%MaleHybridYT4@father
      ]
    FemaleInbredYT4 = FemaleInbredYT3[
      FemaleInbredYT3@id%in%FemaleHybridYT4@mother
      ]
  }
  if(year<2){
    #Year 6
    MaleHybridYT5 = selectInd(MaleHybridYT4,nYT5)
    FemaleHybridYT5 = selectInd(FemaleHybridYT4,nYT5)
    MaleHybridYT5 = setPheno(MaleHybridYT5,varE=varE,
                             reps=repYT5,p=P[year+4L])
    FemaleHybridYT5 = setPheno(FemaleHybridYT5,varE=varE,
                               reps=repYT5,p=P[year+4L])
    MaleInbredYT5 = MaleInbredYT4[
      MaleInbredYT4@id%in%MaleHybridYT5@father
      ]
    FemaleInbredYT5 = FemaleInbredYT4[
      FemaleInbredYT4@id%in%FemaleHybridYT5@mother
      ]
  }
}
