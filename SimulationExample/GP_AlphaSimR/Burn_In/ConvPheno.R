

library(AlphaSimR)
JOB = Sys.getenv("SGE_TASK_ID")
load(paste0("BURNIN",JOB,".RData"))
REP = JOB
JOB = paste0(JOB,"Pheno")
source("GlobalParameters.R")

# Cycle years
for(year in 21:40){ #Change to any number of desired years
  p=P[year]
  cat("Working on year:",year,"\n")
  cat("Parents Selected")
  source("./Pheno/UpdateTesters.R") #Pick new testers and hybrid parents
  cat("Tester Selected")
  source("./Pheno/AdvanceYear_Pheno.R") #Advances yield trials by a year
  source("./Pheno/ReportResults_Pheno.R")
}

output$scenarios = rep("Pheno",40)

saveRDS(output,paste0("Results",JOB,".rds"))
