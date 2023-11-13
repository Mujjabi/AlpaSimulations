
cat(" Collecting Training Population\n") 

if (year >= 22){
  Model234TrainPop = c(
    Model234TrainPop, #remove oldest year of hybrids
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
  gsModel = RRBLUP_D(Model234TrainPop, 
                     snpChip = 3)
} else {
  
  gsModel = RRBLUP_D2(Model234TrainPop, 
                      snpChip = 3, 
                      Va = gsModel@Vu[1],
                      Vd = gsModel@Vu[2],
                      Ve = gsModel@Ve)
}
