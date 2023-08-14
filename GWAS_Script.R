#
library(tidyverse)
root <- "E:/gitfolder/EVOLVES_NAM"
setwd(root)
#
myY <- read.csv("Data_GWAS/myY_Seed.csv") %>%
  mutate(Name = gsub("\\.","-",Name))
myG <- read.table("NAM_hapmap/myG.NAM.hmp.txt", header = F)
#
setdiff(myY$Name, t(myG[1,]))
setdiff(t(myG[1,]), myY$Name )
#
library(GAPIT3)
#
setwd(paste0(root, "/GWAS_Results_new/"))
GWAS <- GAPIT( Y = myY, G = myG, PCA.total = 4, model = "MLM")
GWAS <- GAPIT( Y = myY, G = myG, PCA.total = 4, model = "MLMM")
GWAS <- GAPIT( Y = myY, G = myG, PCA.total = 4, model = "FarmCPU")
GWAS <- GAPIT( Y = myY, G = myG, PCA.total = 4, model = "BLINK")
#