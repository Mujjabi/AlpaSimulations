
library(AlphaSimR)
JOB = Sys.getenv("SGE_TASK_ID")
load(paste0("BURNIN",JOB,".RData"))
REP = JOB
JOB = paste0(JOB,"GSDH1_QTL")
source("GlobalParameters.R")

# Cycle years
for(year in 21:40){ #Change to any number of desired years
  p=P[year]
  cat("Working on year:",year,"\n")
  source("./QTL/Model1_QTL/RunGSModel_1.R")
  cat("GS Model Trained")

  source("./QTL/Model1_QTL/UpdateTesters.R") #Pick new testers and hybrid parents
  cat("Tester Selected")
  source("./QTL/Model1_QTL/AdvanceYearGS_DH_1.R") #Advances yield trials by a year
  cat("Breeding Decisions Made")
  cat(" GS Training Data Updated")
  source("./QTL/Model1_QTL/ReportResults_Model_1.R")
}

output$scenarios = rep("GSDH1_QTL",40)

saveRDS(output,paste0("Results",JOB,".rds"))

