#' Print the lower or upper triangular part of a matrix  flextable
#'
#' @param mat input matrix
#' @param triangle specify upper or lower in quotes
#' @param fill what to fill the other part of the matrix (defaults to "")
#' @param as.image print it as a image (flextable)
#' @param row.names display row names
#'
#' @export

tri_print <- function(mat,
                      triangle = "lower",
                      fill = "",
                      as.image = TRUE,
                      row.names = TRUE){



  if(triangle == "upper"){
    mat[lower.tri(mat, diag = F)] <- fill
  }

  if(triangle == "lower"){
    mat[upper.tri(mat, diag = F)] <- fill
  }

  if(row.names == TRUE &
     is.null(row.names(mat)) ==F){
    x <- rep("x", nrow(mat))
    mat <- cbind(x, mat)
    mat[ ,"x"] <-  row.names(mat)
  }



  if(as.image == TRUE){
    mat <- flextable::flextable(data.frame(mat))
  }

  mat

}
