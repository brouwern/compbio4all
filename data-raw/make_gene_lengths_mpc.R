## code to prepare `DATASET` dataset goes here

file. <- here::here("data-raw","gene_length_mus_protein_coding.csv")

genes_mpc <- read.csv(file = file., skip = 0)

# accessed from biomart on "Thu Jul  1 11:04:14 2021"
# length includes UTRS and CDS
names(genes_mpc) <- c("id",
                      "chomosome",
                      "start","end",
                      "strand",
                      "length",
                      "GCpercent",
                      "gene_type")

genes_mpc <- genes_mpc[,c("id","length","GCpercent","chomosome","strand","start","end")]


## clean
# gene names such as "GL456210.1" are "unlocalized"
## converted to just 1
genes_mpc$chomosome[grep("\\.1",genes_mpc$chomosome)] <- 1

summary(factor(genes_mpc$chomosome))


usethis::use_data(genes_mpc, overwrite = TRUE)



# compbio4all::make_dateset_helpfile(dataset = genes_mpc,
#                      dataset_name = "genes_mpc")

