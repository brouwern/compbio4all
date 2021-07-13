## code to prepare `DATASET` dataset goes here

file. <- here::here("data-raw","gene_length_danio_protein_coding.csv")

genes_dpc <- read.csv(file = file., skip = 0)

# accessed from biomart on "Thu Jul  1 11:04:14 2021"
names(genes_dpc) <- c("id",
                      "chromosome",
                      "start","end",
                      "strand",
                      "length",
                      "GCpercent",
                      "gene_type")

genes_dpc <- genes_dpc[,c("id","chromosome","length","GCpercent","strand","start","end")]


summary(factor(genes_dpc$chromosome))

## clean

for(i in 1:25){
  x <- paste("CHR_ALT_CTG",i,"_",sep = "")
  genes_dpc$chromosome[grep(x,genes_dpc$chromosome)] <- i

}
genes_dpc$chromosome[grep("KN",genes_dpc$chromosome)] <- NA
genes_dpc$chromosome[grep("KZ",genes_dpc$chromosome)] <- NA



# save
usethis::use_data(genes_dpc, overwrite = TRUE)



# compbio4all::make_dateset_helpfile(dataset = genes_dpc,
#                      dataset_name = "genes_dpc")

