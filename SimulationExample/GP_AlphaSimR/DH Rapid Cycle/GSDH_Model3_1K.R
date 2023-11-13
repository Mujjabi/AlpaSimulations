
library(AlphaSimR)
JOB = Sys.getenv("SGE_TASK_ID")
load(paste0("BURNIN",JOB,".RData"))
REP = JOB
JOB = paste0(JOB,"GSDH3_1K")
source("GlobalParameters.R")

# Cycle years
for(year in 21:40){ #Change to any number of desired years
  p=P[year]
  cat("Working on year:",year,"\n")
  source("./1K/Model3_1K/RunGSModel_3.R")
  cat("GS Model Trained")

  source("./1K/Model3_1K/UpdateTesters.R") #Pick new testers and hybrid parents
  cat("Tester Selected")
  source("./1K/Model3_1K/AdvanceYearGS_DH_3.R") #Advances yield trials by a year
  cat("Breeding Decisions Made")
  cat(" GS Training Data Updated")
  source("./1K/Model3_1K/ReportResults_Model_3.R")
}

output$scenarios = rep("GSDH3_1K",40)

saveRDS(output,paste0("Results",JOB,".rds"))

