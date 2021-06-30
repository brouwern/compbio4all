#' Logistic population growth with a discrete time step
#'
#' The function logit_discrete_1step() projects a population one time step forward. (Eg 1 year).
#' The function logit_discrete_multistep() call logit_discrete_1step() repeated to project the population
#' forward multiple time steps.
#'
#' This model can be framed in terms of either alpha, the impact of intraspecific interactions, or K, the
#' carrying capacity.
#'
#' @references Stevens.  200x.  A primer of ecology in R.
#'
#' @param alpha per capita intraspecific competition impact.
#' @param K Carrying capacity; not currently implemented
#' @param r.d discrete growth increment
#' @param Nt Initial population size before projection
#' @param ... additional parameters
#'
#' @examples
#' # Project a population of size 2 forward one time step when
#' ## r.d = 1 and alpha = 0.01
#' logit_discrete_1step(alpha = 0.01,r.d = 1,Nt = 2)
#'
#' # Project a population of size 20 forward one time step when
#' ## r.d = 1 and K (Carrying capacity) = 15
#' logit_discrete_1step(K = 15,r.d = 1,Nt = 20, alpha = NULL)
#'
#' # Model should be defined in terms of alpha OR K, not both.
#' # If both are set it assumes you meant to set K
#' logit_discrete_1step(K = 15,r.d = 1,Nt = 20, alpha = 0.01)
#'
#' # The defaults for the model are set in terms of alpha
#' # If you set K and don't  dfine anything for alpha
#' # The function automatically access the deafult value of alpha (0.01)
#' # Elicity the message as in the previous example
#' logit_discrete_1step(K = 15,r.d = 1,Nt = 20, alpha = 0.01)
#'
#' @export

# project over a single time step
logit_discrete_1step <- function(alpha = 0.01,
                                 K = NULL,
                                 r.d = 1,
                                 Nt = 2,
                                 ...){
  #Project population if given alpha AND K
  if(is.null(alpha) == FALSE &
     is.null(K) == FALSE){
    message("Both alpha and K set. Population size returned assuming you meant to set K.  If you want model run in terms of alpha set K = NULL")
    Nt.plus.1 <- Nt + r.d*((K-Nt)/K)*Nt
  }


  #Project population if given K (Carrying capacity)
  if(is.null(alpha) == FALSE &
     is.null(K) == TRUE){
    Nt.plus.1 <- Nt + r.d*(1-alpha*Nt)*Nt
  }

  #Project population if given alpha
  if(is.null(alpha) == TRUE &
     is.null(K) == FALSE){
    Nt.plus.1 <- Nt + r.d*((K-Nt)/K)*Nt
  }

  return(Nt.plus.1)
}


