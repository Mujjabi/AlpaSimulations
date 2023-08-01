https://cran.r-project.org/web/packages/AlphaSimR/vignettes/intro.html


library(AlphaSimR)

#founder population 
founderPop<-  runMacs(nInd=100, nChr=5, inbred=TRUE, species='MAIZE')

#######simulation parameters
SP<- SimParam$new(founderPop)

#create two traits with a genetic correlation of 0.5
cormat<- matrix(c(1,0.7,0.7,1), nrow=2)
SP$addTraitA(nQtlPerChr=100, c(0,0), c(1,1), cormat) 

#set other parameters
SP$setSexes("no") #all individuals are hermaphrodites 
SP$setTrackPed(TRUE) #keeps pedigree information
SP$setTrackRec(TRUE) #keeps records of all individuals created
SP$addSnpChip(nSnpPerChr=50) #creates a marker set with 50 SNP per chromosome
SP$setVarE(h2=c(0.2, 0.5)) 

#creating generation 0
gen0<- newPop(founderPop)

#phenotype the population
gen0<- setPheno(pop=gen0)

#set to current gen and record mean gv
currentGen<- gen0
mngvA<- meanG(currentGen)

#simulation with DH generated from F2
for(i in 1:10){
  #select individuals 
  curGensel<- selectInd(pop=currentGen, trait=1, nInd=20, use="pheno")
  #cross
  gen_F1<- randCross(pop=curGensel, nCrosses=100, nProgeny = 1)
  #self once
  gen_F2<- self(pop=gen_F1, nProgeny = 1)
  #create double haploid
  gen_DH<- makeDH(pop=gen_F2, nDH = 1)
  currentGen<- gen_DH
  mngvA<- rbind(mngvA, meanG(currentGen))
}

#start from generation 0 again
currentGen<- gen0
mngvB<- meanG(currentGen)

#simulation with DH generated from F1
for(i in 1:10){
  #select individuals 
  curGensel<- selectInd(pop=currentGen, trait=1, nInd=20, use="pheno")
  #cross
  gen_F1<- randCross(pop=curGensel, nCrosses=100, nProgeny = 1)
  #self once
  #gen_F2<- self(pop=gen_F1, nProgeny = 1)
  #create double haploid
  gen_DH<- makeDH(pop=gen_F1, nDH = 1)
  currentGen<- gen_DH
  mngvB<- rbind(mngvB, meanG(currentGen))
}


#start from generation 0 again
currentGen<- gen0
mngvC<- meanG(currentGen)

#simulation with DH generated from F6
for(i in 1:10){
  #select individuals 
  curGensel<- selectInd(pop=currentGen, trait=1, nInd=10, use="pheno")
  #cross
  gen_F1<- randCross(pop=curGensel, nCrosses=100, nProgeny = 1)
  gen_F2<- self(pop=gen_F1, nProgeny = 1)
  gen_F3<- self(pop=gen_F2, nProgeny = 1)
  gen_F4<- self(pop=gen_F3, nProgeny = 1)
  gen_F5<- self(pop=gen_F4, nProgeny = 1)
  #create double haploid from F5 Lines 
  gen_DH<- makeDH(pop=gen_F2, nDH = 10)
  currentGen<- gen_DH
  mngvC<- rbind(mngvC, meanG(currentGen))
}






plot(mngvA[,1], type='b', ylim=c(0,8))
points(mngvB[,1], type='b', col='red')
points(mngvC[,1], type='b', col='blue')










