#' Find and plot potential ORFs
#'
#' By Coghlan (2011) A little book of R for bioinformatics.  https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/.
#' This function calls find_start_stop_ORFs() thenm builds a plot of the output.
#' Predictions are based on the standard genetic code.
#'
#' @param sq DNA sequence
#'
#' @examples
#' # From Coglan 2011
#' ## Toy example
#' s1 <- "aaaatgcagtaacccatgccc"
#' plot_ORFs_in_seq(s1)
#'
#' ## Dengue virus example
#' data(dengueseqstartstring)
#' plot_ORFs_in_seq(dengueseqstartstring)
#'
#'
#' @export

plot_ORFs_in_seq <- function(sq)
{


  # Make vectors "positions" and "types"
  ## containing information on the positions of ATGs in the sequence:
  # mylist <- find_start_stop_codons(sequence)
  # positions <- mylist[[1]]
  # types <- mylist[[2]]

  # # Initialize vectors "orfstarts" and "orfstops"
  # ## to store the predicted start and stop codons of ORFs
  # orfstarts <- numeric()
  # orfstops <- numeric()
  #
  # # Make a vector "orflengths"
  # ## to store the lengths of the ORFs
  # orflengths <- numeric()
  #
  # # Print out the positions of ORFs in the sequence:
  # numpositions <- length(positions) # Find the length of vector "positions"
  #
  # # There must be at least one start codon and one stop codon to have an ORF.
  # if (numpositions >= 2)
  # {
  #   for (i in 1:c(numpositions-1))
  #   {
  #     posi <- positions[i]
  #     typei <- types[i]
  #     found <- 0
  #     while (found == 0)
  #     {
  #       for (j in c(i+1):numpositions)
  #       {
  #         posj <- positions[j]
  #         typej <- types[j]
  #         posdiff <- posj - posi
  #         posdiffmod3 <- posdiff %% 3
  #         orflength <- posj - posi + 3 # Add in the length of the stop codon
  #         if (typei == "atg" && (typej == "taa" || typej == "tag" || typej == "tga") && posdiffmod3 == 0)
  #         {
  #           # Check if we have already used the stop codon at posj+2 in an ORF
  #           numorfs <- length(orfstops)
  #           usedstop <- -1
  #           if (numorfs == 0)
  #           {
  #             for (k in 1:numorfs)
  #             {
  #               orfstopk <- orfstops[k]
  #               #browser()
  #               if(orfstopk == c(posj + 2)) {
  #                 usedstop <- 1
  #                 }
  #             }
  #           }
  #           if (usedstop == -1)
  #           {
  #             orfstarts  <- append(orfstarts, posi, after=length(orfstarts))
  #             orfstops   <- append(orfstops, posj+2, after=length(orfstops)) # Including the stop codon.
  #             orflengths <- append(orflengths, orflength, after=length(orflengths))
  #           }
  #           found <- 1
  #           break
  #         }
  #         if (j == numpositions) {
  #           found <- 1
  #           }
  #       }
  #     }
  #   }
  # }
  #

  # Return list of ORFs
  ## $orfstarts
  ## $orfstops
  ## $orflengths
  mylist <- find_ORFs_in_seq(sq)


  # Sort the final ORFs by start position:
  indices <- order(mylist$orfstarts)
  orfstarts <- mylist$orfstarts[indices]
  orfstops <- mylist$orfstops[indices]

  # Plot
  ## Make a plot showing the positions of ORFs in the input sequence:
  ## Draw a line at y=0 from 1 to the length of the sequence:
  x <- c(1,nchar(sq))
  y <- c(0,0)
  plot(x, y, ylim=c(0,3), type="l", axes=FALSE,
       xlab="Nucleotide", ylab="Reading frame",
       main="Predicted ORFs")
  graphics::segments(1,1,nchar(sq),1)
  graphics::segments(1,2,nchar(sq),2)

  # Add the x-axis at y=0:
  graphics::axis(1, pos=0)

  # Add the y-axis labels:
  graphics::text(0.9,0.5,"+1")
  graphics::text(0.9,1.5,"+2")
  graphics::text(0.9,2.5,"+3")

  # Make a plot of the ORFs in the sequence:
  numorfs <- length(orfstarts)
  for (i in 1:numorfs)
  {
    orfstart <- orfstarts[i]
    orfstop <- orfstops[i]
    remainder <- (orfstart-1) %% 3
    if    (remainder == 0) # +1 reading frame
    {
      graphics::rect(orfstart,0,orfstop,1,col="cyan",border="black")
    }
    else if (remainder == 1)
    {
      graphics::rect(orfstart,1,orfstop,2,col="cyan",border="black")
    }
    else if (remainder == 2)
    {
      graphics::rect(orfstart,2,orfstop,3,col="cyan",border="black")
    }
  }
}
