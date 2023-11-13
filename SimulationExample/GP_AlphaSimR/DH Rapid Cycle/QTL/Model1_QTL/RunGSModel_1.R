
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
  gsModelM = RRBLUP(Model1TrainPopM, useQtl = TRUE)
  gsModelF = RRBLUP(Model1TrainPopF, useQtl = TRUE)
} else {

  gsModelM = RRBLUP2(Model1TrainPopM, useQtl = TRUE,
                      Vu = gsModelM@Vu,
                      Ve = gsModelM@Ve)
  gsModelF = RRBLUP2(Model1TrainPopF, useQtl = TRUE,
                      Vu = gsModelF@Vu,
                      Ve = gsModelF@Ve)

}
