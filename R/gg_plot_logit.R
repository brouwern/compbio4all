#' Plot output of logistic population growth model using ggplot2
#'
#' @param logit.out output of logistic modeling functions such as logit_discrete()
#' @param axis.txt.sz size of labels along x and y axes
#' @param axis.ti.sz size of axis titles
#' @param title.sz Size of the title
#' @param title Title for for plot.  Default is blank ("")
#'
#' @export

gg_plot_logit <- function(logit.out,
                          axis.txt.sz = 25,
                          axis.ti.sz = 25,
                          title.sz = 30,
                          title = ""){
  ggplot2::ggplot(ggplot2::aes(y = N.t,
             x = time),
         data = logit.out) +
    #geom_point(size = 4) +
    ggplot2::geom_line(size = 3) +
    ggplot2::xlab("Time (t)") +
    ggplot2::ylab("Population size (N)") +
    ggplot2::theme(axis.text=ggplot2::element_text(size=axis.txt.sz),
        axis.title=element_text(size=axis.ti.sz, face="bold")) +
    ggplot2::theme(plot.title = ggplot2::element_text(size=title.sz)) +
    ggplot2::ggtitle(title)
}
