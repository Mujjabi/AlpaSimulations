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
  gsModel = RRBLUP(Model234TrainPop, useQtl = TRUE)
} else {

  gsModel = RRBLUP2(Model234TrainPop, useQtl = TRUE,
                    Vu = gsModel@Vu,
                    Ve = gsModel@Ve)
}
