cat(" Collecting Training Population\n") 

if (year >= 22){
  Model234TrainPop = c(
    Model234TrainPop,
    MaleHybridYT1,
    MaleHybridYT2,
    MaleHybridYT3,
    FemaleHybridYT1,
    FemaleHybridYT2,
    FemaleHybridYT3
  ) 
  
} 


if (year == 21) {
  cat(" Running GS model\n")
  SP$addSnpChip(100, force = TRUE)
  gsModel = RRBLUP(Model234TrainPop, snpChip = 4)
} else {

  gsModel = RRBLUP2(Model234TrainPop, snpChip = 4,
                    Vu = gsModel@Vu,
                    Ve = gsModel@Ve)
}
