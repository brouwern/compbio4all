#' Score a simple alignment
#'
#' @param seq.df Two aligned sequences in a dataframe
#' @param seq1 name of column with first sequences
#' @param seq2 name of column with second sequence
#' @param sub.mat substitution matrix to use.  Defaults to BLOSUM62
#' @param gap.penalty penalty for gaps in the sequence
#' @param gap.extend penalty for gap length, starting with the first gap.
#'
#' @export

score_alignment <- function(seq.df,
                            seq1,
                            seq2,
                            sub.mat,
                            gap.penalty =-10,
                            gap.extend =-4){

  # if(is.null(sub.mat) == TRUE){
  #   library(Biostrings)
  #   sub.mat<-data(BLOSUM62)
  # }

  seq.df$score <- NA

  for(i in 1:nrow(seq.df)){

    x <- unlist(seq.df[i , c(seq1,seq2)])

    if(any(x %in% c(""," ",".","*","-") == TRUE)){
      seq.df$score[i] <- gap.penalty
      next
    }

    seq.df$score[i] <- sub.mat[x[1],x[2]]

  }

  return(seq.df)
}




