#' Logistic population growth with a discrete time step
#'
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
#' @param time.steps number of time steps for model to run
#' @param add.params Logical.  Should underlying parameters be appended to model (r.d, alpha, K)
#' @param ... additional parameters
#'
#' @export

# project over multiple time steps by iterating logit_discrete_1step()
logit_discrete_multistep <-function(alpha = 0.01,
                                    K = NULL,
                                    r.d = 1,
                                    Nt = 2,
                                    time.steps = 15,
                                    add.params = TRUE,
                                    ...){
  #expand time to vector
  N.t <- rep(NA, time.steps)
  N.t <- c(Nt,N.t)


  for(t in 1:time.steps){
    N.t[t+1] <- logit_discrete_1step(alpha,K,r.d,N.t[t])

  }

  time <- c(0,1:time.steps)

  df <- data.frame(time = time,
                   N.t = N.t)

  if(is.null(alpha) == TRUE){
    alpha <- NA
  }

  if(is.null(K) == TRUE){
    K <- NA
  }


  if(add.params == TRUE){
    df <- data.frame(df,
                     alpha,
                     K,
                     Nt,
                     time.steps)
  }

  return(df)
}




