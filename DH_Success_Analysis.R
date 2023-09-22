DL <- read.csv("DH_Lines.csv", header = TRUE)

DL$PRPlots <- as.character(DL$PRPlots)


library(dplyr)

DHL_Sum = DL %>% group_by(PRPlots)  %>%
    summarise(Pollination = sum(Pollinations),
            Haploids = sum(Haploids),
            DH = sum(DH),
            Rate =((DH/Haploids)*100))

View(DHL_Sum)

# Analysis of doubling rates
DHL_families$Haploids <- as.numeric(DHL_families$Haploids)
DHL_families <- as.character(DHL_families)

install.packages("xlsx")
library(xlsx)
DH_Unique <- write.xlsx(DHL_Sum, "DHL_Unique2.xlsx")


DHL_families <- read.csv("DHL_Unique.csv", header = TRUE)
unique(DHL_families$Family)
unique(DHL_families$SHGD_Donor)


# 1. Distribution of haploids

library(ggplot2)
ggplot(DHL_families, aes(Haploids)) +
  geom_histogram(position="dodge", color="black", fill="#2166AC",linetype="solid", alpha=0.9)+
  geom_vline(data=DHL_families, aes(xintercept=mean(Haploids)),linetype="dashed", color="red", lwd=1) + 
  scale_color_brewer(palette="Paired") + 
  theme_classic()+theme(legend.position="top") + 
  scale_color_brewer(palette="Dark2") +
  labs(title="Histogram of Haploid Inductions",
     x ="Number of Haploids", y = "Frequency")


###BOX PLOTS FOR GRAIN QUALITY ###

# 1. Visualizing the number of haploids per family 

library(ggplot2)
ggplot(DHL_families, aes(x=Family, y=Haploids,fill=Family))+
  stat_boxplot( aes(Family, Haploids), 
                geom='errorbar', linetype=1, width=0.5)+  #whiskers
  geom_boxplot( aes(Family, Haploids),outlier.shape=1) +    
  stat_summary(fun=mean, geom="point", size=2)+
  theme(axis.text.x=element_text(size=12, angle=90),  legend.position="none") +
  geom_boxplot(lwd=0.6) +
  scale_fill_manual(values=c("red", "blue", "orange", "green", "yellow", "#2166AC", "firebrick4", "tan3","#69b3a2", "turquoise", "grey" )) +
  labs(title="Number of Haploids per Family",
        x ="Families", y = "Number of Haploids") +
  coord_flip()


# 2. Visualizing the number of sucessful male fertile haploids (DH) per family

library(ggplot2)
library(viridis)
library(hrbrthemes)
ggplot(DHL_families, aes(x=Family, y=DH, fill = SHGD_Donor)) + 
  geom_bar(position="dodge", stat="identity") +
  theme(text=element_text(size=12, angle=90)) +
  scale_fill_viridis(discrete = T) +
  ggtitle("Number of MF-Plants by Family") +
  theme_ipsum() +
  xlab("Family")


# 3. Visualizing the success rate of genome doubling per family 

library(ggplot2)
library(viridis)
library(hrbrthemes)
ggplot(DHL_families, aes(x=Family, y=Rate, fill = SHGD_Donor)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_fill_viridis(discrete = T) +
  ggtitle("Number of MF-Plants by Family") +
  theme_ipsum() +
  xlab("Family")


