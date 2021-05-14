#' Print the diagonal of a matrix
#'
#' @param mat input matrix
#' @param fill what to fill the other part of the matrix (defaults to "")
#' @param row.names display row names
#'
#' @export

diag_show <- function(mat, fill = "",
                      row.names = TRUE){

  i.s <- 1:nrow(mat)
  d <- diag(mat)
  mat.dummy <- mat
  mat.dummy[ , ] <- fill

  for(i in 1:nrow(mat)){
    mat.dummy[i.s[i],i.s[i]] <- d[i]
  }

  if(row.names == TRUE &
     is.null(row.names(mat.dummy)) ==F){
    x <- rep("x", nrow(mat.dummy))
    mat.dummy <- cbind(x, mat.dummy)
    mat.dummy[ ,"x"] <-  row.names(mat)
  }

  colnames(mat.dummy)[1] <-"."


  flextable::flextable(data.frame(mat.dummy))
}
