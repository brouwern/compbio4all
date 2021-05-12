# Make mRNA initiation size
#library(googlesheets)
#library(readr)

RNA_init <- read.csv(here::here("data-raw","mRNA_initiation.csv"),
                     stringsAsFactors = F)

RNA_init$X20 <- "T"
RNA_init$cat <- NA





RNA_init$sequence <-  apply(RNA_init[,1:21],1, paste0, collapse = "")


RNA_init[, c("seq.i","sequence")]


RNA_init$sequence[1]

library(Biostrings)

a12 <- pairwiseAlignment(RNA_init$sequence[1],
                         RNA_init$sequence[2])


a13 <- pairwiseAlignment(RNA_init$sequence[1],
                         RNA_init$sequence[3])



RNA_init$sequence[1]


RNA_init[1,1:31]

consensusMatrix(a12)
pid(a12)
pid(a13)

library(msa)


stringsets <- DNAStringSet(x = RNA_init$sequence[1:nrow(RNA_init)])

names(stringsets) <- paste(RNA_init$gene,RNA_init$organism)

align <- msaClustalW(stringsets,
             gapOpening = 30,
             gapExtension = 30)


align2 <- msaConvert(align, type="seqinr::alignment")

dist <- seqinr::dist.alignment(align2, "identity")

tree <- ape::nj(dist)

plot(tree)
