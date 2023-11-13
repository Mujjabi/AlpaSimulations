
library(AlphaSimR)
JOB = Sys.getenv("SGE_TASK_ID")
load(paste0("BURNIN",JOB,".RData"))
REP = JOB
JOB = paste0(JOB,"GSDH4_20K")
source("GlobalParameters.R")

# Cycle years
for(year in 21:40){ #Change to any number of desired years
  p=P[year]
  cat("Working on year:",year,"\n")
  source("./20K/Model4_20K/RunGSModel_4.R")
  cat("GS Model Trained")

  source("./20K/Model4_20K/UpdateTesters.R") #Pick new testers and hybrid parents
  cat("Tester Selected")
  source("./20K/Model4_20K/AdvanceYearGS_DH_4.R") #Advances yield trials by a year
  cat("Breeding Decisions Made")
  cat(" GS Training Data Updated")
  source("./20K/Model4_20K/ReportResults_Model_4.R")
}

output$scenarios = rep("GSDH4_20K",40)

saveRDS(output,paste0("Results",JOB,".rds"))

