#' Open a specified tutorial file contained within the package
#'
#' This function identifies where on your local hard drive the dayoff package is located.  It then locates the tutorials folder and opens the specified tutorial using rstudioapi::navigateToFile
#' NOTE: The function system() has similar functionality as navigateToFile() but seems to behave differ
#'
#' TO DO: Add a call to file.exists()
#' Add an argument for running the function but not exectuting the opening of the file (Eg, just doing file.exists).  This might make testing easier.
#'
#' @param tutorial name of tutorial to open as a quotes string.  Defaults to NULL and opens up a sample tutorial.
#'
#'
#' @export

tutor_open <- function(tutorial = NULL){
  dayoff.path <- system.file(package = "dayoff")
  tutor.path <- paste0(dayoff.path,"/tutorials")

  if(is.null(tutorial) == TRUE){
    tutorial <- list.files(tutor.path)[1]
    warning("No tutorial specified, SAMPLE TUTORIAL OPENED")
  }

  #construct path to tutorial
  tutor.file.path <- paste0(tutor.path,"/",tutorial)

  if(file.exists(tutor.file.path) == FALSE){
   stop(cat("Sorry, file ", tutorial, "does not exist.  \nUse the function tutor_show() to see a list of available tutorials "))

  }


  message("Opening: ",tutor.file.path)
  message("If you want to save your work save the file in a new location!")


  #system.string <- paste("RStudio", tutor.file.path)
  #system(system.string)

  file.exists(tutor.file.path)

  rstudioapi::navigateToFile(tutor.file.path)
}
