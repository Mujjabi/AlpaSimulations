
if (year == 17) {
  cat("Collecting Training Population\n")
  Model1TrainPopM = c(
    MaleInbredYT1,
    MaleInbredYT2,
    MaleInbredYT3
  )
  
  Model1TrainPopF = c(
    FemaleInbredYT1,
    FemaleInbredYT2,
    FemaleInbredYT3
  )
  
  Model234TrainPop = c(
    MaleHybridYT1,
    MaleHybridYT2,
    MaleHybridYT3,
    FemaleHybridYT1,
    FemaleHybridYT2,
    FemaleHybridYT3
  )
}

if (year > 17) {
  cat(" Collecting Training Population\n")
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
