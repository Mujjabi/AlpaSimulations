cat(" Reporting Results...\n")

#Inbred Mean
#output$InbredMean[year] = (meanG(MaleDH) + meanG(FemaleDH))/2

#Hybrid Mean
#Hybrids = hybridCross(FemaleDH, MaleDH)

#output$HybridMean[year] = meanG(Hybrids)

#Inbred Genic Variance
#output$InbredGenicVariance[year] = (genicVarG(MaleDH) + genicVarG(FemaleDH))/2

#Hybrid Genic Variance
#output$HybridGenicVariance[year] = genicVarG(Hybrids) 


#################################################################

a = SP$traits[[1]]@addEff
d = SP$traits[[1]]@domEff
int = SP$traits[[1]]@intercept


Mm = pullQtlGeno(MaleDH)
pm = colMeans(Mm)/2
qm = 1-pm

Mf = pullQtlGeno(FemaleDH)
pf= colMeans(Mf)/2
qf = 1 - pf

y = pm - pf

#################################################################

#Inbred Mean
output$Inbred_mean[year] = sum(a*(pm - qm - y)) + int

#Hybrid Mean
output$Hybrid_mean[year] = sum(a*(pm - qm - y) + (2*pm*qm + y*(pm - qm))*d) + int


#Inbred Variance
Finb = 1

genic_var_f = sum(2*pf*qf*(1 + Finb)*(a + (1 - Finb)/(1 + Finb)*(qf - pf)*d)^2)
genic_var_m = sum(2*pm*qm*(1 + Finb)*(a + (1 - Finb)/(1 + Finb)*(qm - pm)*d)^2)

output$Inbred_var[year] = (genic_var_f + genic_var_m)/2

#Hybrid Variance

p_bar = (pm + pf)/2
q_bar = (qm + qf)/2

var_p = (pf^2 + pm^2)/2 - p_bar^2

Fhyb = var_p/(p_bar*q_bar)*(-1)

output$Hybrid_var[year] = sum(2*p_bar*q_bar*(1 + Fhyb)*(a + (1 - Fhyb)/(1 + Fhyb)*(q_bar - p_bar)*d)^2, na.rm = TRUE) + sum(4*p_bar*q_bar*((1 - Fhyb)/(1 + Fhyb))*(p_bar + Fhyb*q_bar)*(q_bar + Fhyb*p_bar)*(d^2), na.rm = TRUE)

output$Hyb_Add_Var[year] = sum(2*p_bar*q_bar*(1 + Fhyb)*(a + (1 - Fhyb)/(1 + Fhyb)*(q_bar - p_bar)*d)^2, na.rm = TRUE)
output$Hyb_Dom_Var[year] = sum(4*p_bar*q_bar*((1 - Fhyb)/(1 + Fhyb))*(p_bar + Fhyb*q_bar)*(q_bar + Fhyb*p_bar)*(d^2), na.rm = TRUE)

#################################################################

output$Panmictic_het[year] = sum((y^2)*d)
output$Base_het[year] = sum((2*p_bar*q_bar*d) - ((1/2)*((y^2)*d)))  
output$Inbred_het[year] = sum((2*p_bar*q_bar*d) + ((1/2)*((y^2)*d))) 

#################################################################


if(exists("gsModel")){
  Mf = pullQtlGeno(FemaleDH)
  Mm = pullQtlGeno(MaleDH)
  
  FemaleDH = setEBV(FemaleDH, gsModel, value = "bv", targetPop = MaleDH)
  pm = colMeans(Mm)/2
  alphaf = SP$traits[[1]]@addEff + SP$traits[[1]]@domEff*(1-2*pm)
  
  MaleDH = setEBV(MaleDH, gsModel, value = "bv", targetPop = FemaleDH)
  pf = colMeans(Mf)/2
  alpham = SP$traits[[1]]@addEff + SP$traits[[1]]@domEff*(1-2*pf)
  
  output$AccuracyGS[year] = (cor(ebv(FemaleDH),Mf%*%alphaf)+
                               cor(ebv(MaleDH),Mm%*%alpham))/2
}


