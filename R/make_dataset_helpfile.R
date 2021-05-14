#' Create template for dataset documentation
#'
#' Given an dataframe, creates a template for a R package documentation file.
#'
#' Defaults are set to generic template.
#'
#' NOTE: Does not check if a file of the same name currently exists!
#'
#' @param dataset Dataframe object.
#' @param dataset_name Quoted name of the dataset object
#' @export

make_dateset_helpfile <- function(dataset,
                                  dataset_name  = "temp"){
  library(here)

  to_sink <- paste(dataset_name,"R",sep = ".")
  to_sink_with_dir <- here::here("R",to_sink)

  sink(to_sink_with_dir)
  cat("#' Dataset helpfile header . . .\n")
  cat("#'\n")
  cat("#' Short description of data . . . \n")
  cat("#'\n")
  cat("#' @format A data frame with ", dim(dataset)[1], " rows and ",dim(dataset)[2]," column(s)\n", sep = "")
  cat("#' \\describe{\n", sep = "")

  for(i in 1:ncol(dataset)){
    colname.i <- names(dataset)[i]
    cat("#'   \\item{",colname.i,"}{Describe column ",colname.i, " here . . .}\n",sep = "")
  }

  cat("#' }\n")
  cat("#' @source \\url{http://www.whereyougotthedata.com/}\n")
  cat("#'\n")
  cat("'",dataset_name,"'", sep = "")
  sink()
}

