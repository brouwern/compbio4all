## code to prepare `DATASET` dataset goes here

file. <- here::here("data-raw","gene_length_human_protein_coding.csv")

genes_hpc <- read.csv(file = file., skip = 0)

# accessed from biomart on "Thu Jul  1 11:04:14 2021"
names(genes_hpc) <- c("id",
                      "chromosome",
                      "start","end",
                      "length",
                      "GCpercent",
                      "gene_type",
                      "strand")

genes_hpc <- genes_hpc[,c("id","chromosome","length","GCpercent","strand","start","end")]



## clean
length(genes_hpc$chromosome[grep("CHR_HSCHR",genes_hpc$chromosome)])

#genes_hpc$chromosome <- gsub("CHR_HSCHR","",genes_hpc$chromosome)

for(i in 1:23){
  x <- paste("CHR_HSCHR",i,"_",sep = "")
  genes_hpc$chromosome[grep(x,genes_hpc$chromosome)] <- i


}

genes_hpc$chromosome[grep("CHR_HSCHR19KIR",genes_hpc$chromosome)] <- 19
genes_hpc$chromosome[grep("CHR_HSCHR19LRC",genes_hpc$chromosome)] <- 19
genes_hpc$chromosome[grep("CHR_HSCHRX",genes_hpc$chromosome)] <- "X"
genes_hpc$chromosome[grep("CHR_HSCHRY",genes_hpc$chromosome)] <- "Y"


# can't figure out
genes_hpc$chromosome[grep("PATCH",genes_hpc$chromosome)] <- NA
genes_hpc$chromosome[grep("TEST",genes_hpc$chromosome)] <- NA

genes_hpc$chromosome[grep("GL",genes_hpc$chromosome)] <- NA
genes_hpc$chromosome[grep("KI",genes_hpc$chromosome)] <- NA


length(grep("PATCH",genes_hpc$chromosome))

summary(factor(genes_hpc$chromosome))

length(summary(factor(genes_hpc$chromosome)))



# save
usethis::use_data(genes_hpc, overwrite = TRUE)



# compbio4all::make_dateset_helpfile(dataset = genes_hpc,
#                      dataset_name = "genes_hpc")

