#' Execute BLAST from R.
#'
#' Code is modified from the blast.pdb() function of bio3d to allow different databases to be queried and the maximum number of hits to be changed.
#'
#' For more information see
#' General: https://ncbi.github.io/blast-cloud/dev/api.html
#' Databases: https://ncbi.github.io/blast-cloud/blastdb/available-blastdbs.html for
#'
#' @param seq Sequence as character string, eg "ACVPTY" or "ATCGGC"
#' @param program blastn, blastp, blastx, tblastn, tblastx
#' @param database Defaults to refseq_protein  Other options include nt (nucleotide), nr (non-redundant protein), refseq_rna (NCBI Transcript Reference Sequences	DNA), swissprot (Non-redundant UniProtKB/SwissProt sequences	Protein), pdbaa (PDB protein database), pdbnt (PDB nucleotide database)
#' @param time.out xxx
#' @param chain.single xxxx
#' @param maxhits Maximum number of hits to keep.  Passed to BLAST parameter HITLIST_SIZE
#'
#' @export

blastr <- function(seq,
                    program = "blastp",
                    database = "refseq_protein",
                    time.out = NULL,
                    chain.single = TRUE,
                    maxhits = 2000){
  #library(bio3d)

  if (inherits(seq, "fasta")) {
    if (is.matrix(seq$ali)) {
      if (nrow(seq$ali) > 1)
        warning("Multiple sequences detected - using only the first sequence in input object")
      seq <- as.vector(seq$ali[1, ])
    }
    else {
      seq <- as.vector(seq$ali)
    }
  }
  if (bio3d::is.pdb(seq)) {
    seq <- bio3d::pdbseq(seq)
  }
  if (!is.vector(seq)) {
    stop("Input 'seq' should be a single sequence as a single or multi element character vector (as obtained from the pdbseq() function)")
  }
  seq <- paste(seq, collapse = "")
  #if (!(database %in% c("pdb", "nr", "swissprot")))
  # stop("Option database should be one of pdb, nr or swissprot")
  urlput <- paste("https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Put&DATABASE=",
                  database, "&HITLIST_SIZE=",maxhits,"&",program,"=blastp&CLIENT=web&QUERY=",
                  paste(seq, collapse = ""), sep = "")
  txt <- scan(urlput, what = "raw", sep = "\n",
              quiet = TRUE)
  rid <- sub("^.*RID = ", "", txt[grep("RID =",
                                       txt)])
  urlget <- paste("https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Get",
                  "&FORMAT_OBJECT=Alignment",
                  "&ALIGNMENT_VIEW=Tabular",
                  "&RESULTS_FILE=on",
                  "&FORMAT_TYPE=CSV",
                  "&ALIGNMENTS=2000",
                  "&RID=",
                  rid,
                  sep = "")
  blast <- bio3d::get.blast(urlget, time.out = time.out, chain.single = chain.single)
  return(blast)
}
