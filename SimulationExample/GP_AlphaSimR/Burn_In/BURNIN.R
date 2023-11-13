
JOB = Sys.getenv("SGE_TASK_ID")
library('AlphaSimR')
source("GlobalParameters.R")

# Initialize variables for results - Product Development
output = data.frame(
  Year = 1:40,
  Inbred_mean = numeric(40),
  Hybrid_mean = numeric(40),
  Inbred_var = numeric(40),
  Hybrid_var = numeric(40),
  Hyb_Add_Var = numeric(40),
  Hyb_Dom_Var = numeric(40),
  AccuracyGS = numeric(40),
  Panmictic_het = numeric(40),
  Base_het = numeric(40),
  Inbred_het = numeric(40)
)

# Initialize variables for results - Population Improvement
output_PopImp = data.frame(
  Year = rep(21:40, each = nCycle),
  Cycle = rep(1:nCycle, times = 20),
  PopImp_inbred_mean = numeric(20*nCycle),
  PopImp_hybrid_mean = numeric(20*nCycle),
  PopImp_inbred_var = numeric(20*nCycle),
  PopImp_hybrid_var = numeric(20*nCycle),
  PopImp_Hyb_Add_Var = numeric(20*nCycle),
  PopImp_Hyb_Dom_Var = numeric(20*nCycle),
  PopImp_AccuracyGS = numeric(20*nCycle),
  PopImp_Panmictic_het = numeric(20*nCycle),
  PopImp_Base_het = numeric(20*nCycle),
  PopImp_Inbred_het = numeric(20*nCycle)
)

source("./CreateParents.R")
source("./FillPipeline.R")

P = runif(40)
# Cycle years
for(year in 1:20){ #Change to any number of desired years
  cat("Working on year:",year,"\n")
  source("./InitTrainingPop.R")
  if (year >= 17){cat("GS Training Set Updated \n")}
  source("./UpdateTesters.R") #Pick new testers and hybrid parents
  source("./AdvanceYear.R") #Advances yield trials by a year
  source("./ReportResults_BURNIN.R")
}

save.image(paste0("BURNIN",JOB,".RData"))
