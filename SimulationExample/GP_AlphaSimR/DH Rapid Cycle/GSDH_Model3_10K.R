
library(AlphaSimR)
JOB = Sys.getenv("SGE_TASK_ID")
load(paste0("BURNIN",JOB,".RData"))
REP = JOB
JOB = paste0(JOB,"GSDH3_10K")
source("GlobalParameters.R")

# Cycle years
for(year in 21:40){ #Change to any number of desired years
  p=P[year]
  cat("Working on year:",year,"\n")
  source("./10K/Model3_10K/RunGSModel_3.R")
  cat("GS Model Trained")

  source("./10K/Model3_10K/UpdateTesters.R") #Pick new testers and hybrid parents
  cat("Tester Selected")
  source("./10K/Model3_10K/AdvanceYearGS_DH_3.R") #Advances yield trials by a year
  cat("Breeding Decisions Made")
  cat(" GS Training Data Updated")
  source("./10K/Model3_10K/ReportResults_Model_3.R")
}

output$scenarios = rep("GSDH3_10K",40)

saveRDS(output,paste0("Results",JOB,".rds"))

