
# https://www.uv.es/rsanjuan/Viral_mutation_rates_snc.txt

# Viral mutation rates can be expressed as
## substitutions per nucleotide site per cell infection (s/n/c)
## or as substitutions per nucleotide per strand copying (s/n/r).


## snc
## Viral mutation rates expressed as nucleotide substitutions per site per cell infection (s/n/c)
## https://www.uv.es/rsanjuan/Viral_mutation_rates_snc.htm

## snr
## Viral mutation rates expressed as nucleotide substitutions per site per strand copying (s/n/r)
## https://www.uv.es/rsanjuan/Viral_mutation_rates_snr.htm
file. <- here::here("data-raw","virus_mutation_rates_snr.csv")

virus_snr <- read.csv(file = file.,
                                 skip = 2,
                                 na.strings = "-")

virus_snr$mutation_rate <- gsub("E","e",
                                virus_snr$mutation_rate)
virus_snr$mutation_rate <- gsub(" ","",virus_snr$mutation_rate )
virus_snr$mutation_rate <- as.numeric(virus_snr$mutation_rate )

summary(virus_snr$mutation_rate )

usethis::use_data(virus_snr, overwrite = TRUE)

# compbio4all::make_dateset_helpfile(dataset = virus_snr,
#                       dataset_name = "virus_snr")



library(ggpubr)
virus_snr$mutation_rate_log <- log(virus_snr$mutation_rate)
virus_snr$genome_size_kb_log <- log(virus_snr$genome_size_kb)

ggscatter(y = "mutation_rate_log",
          x = "genome_size_kb_log",
          data = virus_snr,
          color = "group")

