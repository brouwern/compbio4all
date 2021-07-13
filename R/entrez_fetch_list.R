#' Process multiple NCBI accessions and output as list
#'
#' Wrapper for rentez::entrez_fetch
#'
#' @param db Sequence database
#' @param id vector of sequence IDs (accessions)
#' @param rettype ...
#' @param ... Additional
#'
#' @export

entrez_fetch_list <- function(db, id, rettype, ...){

  #setup list for storing output
  n.seq <- length(id)
  list.output <- as.list(rep(NA, n.seq))
  names(list.output) <- id

  # get output
  for(i in 1:length(id)){
    list.output[[i]] <- rentrez::entrez_fetch(db = db,
                                              id = id[i],
                                              rettype = rettype)
  }


  return(list.output)
}
