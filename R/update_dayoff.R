#' Function to update dayoff package
#'
#' @param upgrade Arugement to pass to devtools::install_github: should dependencies be upgrades; defaults to "never
#' @param type Arguement to pass to devtools::install_github: should binary packages be downloaded even if more recent source packages are available.  Defaults to "binary."
#'
#'
#' @export
#'
#'


update_dayoff <- function(upgrade = "never",
                          type = "binary"){
  installed <- rvcheck::check_github(pkg = "brouwern/dayoff")$installed_version
  github    <- rvcheck::check_github(pkg = "brouwern/dayoff")$latest_version


   if(installed != github){
     message("Downloading dayoff")
     message("Note: the default is to not update packages that are already downloaded and to always use the binary version of a package")

     #if(update != "never"){
     #   message("Since upgrade is not set to never,
     #         the status of other packages will be checked")
     #}

     devtools::install_github("brouwern/dayoff",
                              upgrade = upgrade,
                              type = type)

     rstudioapi::restartSession()
   }



}


