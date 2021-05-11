#' Function to convert a FASTA file stored as an object into a vector
#'
#' @param fasta_object R object with FASTA character data to clean
#' @param parse Parse data to character vector?
#'
#' @examples
#'
#' dengueseq_fasta <- rentrez::entrez_fetch(db = "nucleotide", id = "NC_001477", rettype = "fasta")
#' fasta_cleaner(dengueseq_fasta, parse = TRUE)
#'
#' @export

fasta_cleaner <- function(fasta_object, parse = TRUE){

  #header <- gsub("\\|","",header)
  #header <- gsub("\\+","",header)
  #header <- gsub("\\=","",header)
  #header <- gsub("\\:","",header)
  #header <- gsub("\\;","",header)

  #fasta_object <- gsub("\\|","",fasta_object)
  #fasta_object <- gsub("\\+","",fasta_object)
  #fasta_object <- gsub("\\=","",fasta_object)
  #fasta_object <- gsub("\\:","",fasta_object)
  #fasta_object <- gsub("\\;","",fasta_object)


  #fasta_object <- gsub(header, "", fasta_object)

  fasta_object <- sub("^(>)(.*?)(\\n)(.*)(\\n\\n)","\\4",fasta_object)
  fasta_object <- gsub("\n", "", fasta_object)

  if(parse == TRUE){
    fasta_object <- stringr::str_split(fasta_object,
                                       pattern = "",
                                       simplify = FALSE)
  }


  return(fasta_object[[1]])
}
