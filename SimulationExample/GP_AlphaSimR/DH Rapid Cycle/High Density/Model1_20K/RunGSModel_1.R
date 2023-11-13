
cat(" Collecting Training Population\n") 

if (year>= 22){
  Model1TrainPopM = c(
    Model1TrainPopM,
    MaleInbredYT1,
    MaleInbredYT2,
    MaleInbredYT3
  )
  
  Model1TrainPopF = c(
    Model1TrainPopF, 
    FemaleInbredYT1,
    FemaleInbredYT2,
    FemaleInbredYT3
  )
}


if (year == 21) {
  cat(" Running GS model\n")
  gsModelM = RRBLUP(Model1TrainPopM, 
                    snpChip = 3)
  gsModelF = RRBLUP(Model1TrainPopF, 
                    snpChip = 3)
} else {
  
  gsModelM = RRBLUP2(Model1TrainPopM, 
                     snpChip = 3,
                     Vu = gsModelM@Vu,
                     Ve = gsModelM@Ve)
  gsModelF = RRBLUP2(Model1TrainPopF, 
                     snpChip = 3,
                     Vu = gsModelF@Vu,
                     Ve = gsModelF@Ve)
  
}
