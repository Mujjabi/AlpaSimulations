
library(AlphaSimR)
JOB = Sys.getenv("SGE_TASK_ID")
load(paste0("BURNIN",JOB,".RData"))
REP = JOB
JOB = paste0(JOB,"GSDH4_QTL")
source("GlobalParameters.R")

# Cycle years
for(year in 21:40){ #Change to any number of desired years
  p=P[year]
  cat("Working on year:",year,"\n")
  source("./QTL/Model4_QTL/RunGSModel_4.R")
  cat("GS Model Trained")

  source("./QTL/Model4_QTL/UpdateTesters.R") #Pick new testers and hybrid parents
  cat("Tester Selected")
  source("./QTL/Model4_QTL/AdvanceYearGS_DH_4.R") #Advances yield trials by a year
  cat("Breeding Decisions Made")
  cat(" GS Training Data Updated")
  source("./QTL/Model4_QTL/ReportResults_Model_4.R")
}

output$scenarios = rep("GSDH4_QTL",40)

saveRDS(output,paste0("Results",JOB,".rds"))

