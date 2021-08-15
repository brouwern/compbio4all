#' plot_potential_starts_and_stops
#'
#' From Coghlan (2011) A little book of R for bioinformatics.
#' https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter7.html
#' Function original named plotPotentialStartsAndStops()
#'
#' @param sq sequence to analyze and plot
#'
#' @examples
#' # Toy Example sequence from Coghlan 2011
#' s1 <- "aaaatgcagtaacccatgccc"
#' plot_start_stop_codons(s1)
#'
#' # Dengue virus example from Coghlan 2011
#' data(dengueseqstartstring)
#' plot_start_stop_codons(dengueseqstartstring)
#'
#' @export

plot_start_stop_codons <- function(sq)
{

  # Find start and stop codons
  ## returns list
  ## $positions
  ## $types

  starts_stops_list <- find_start_stop_codons(sq)

  #-- This should all be the same code as find_stat_stop_codons() --#
  # # Define a vector with the sequences of potential start and stop codons
  # codons <- c("atg", "taa", "tag", "tga")
  # # Find the number of occurrences of each type of potential start or stop codon
  # for (i in 1:4)
  # {
  #   codon <- codons[i]
  #   # Find all occurrences of codon "codon" in sequence "sq"
  #   occurrences <- matchPattern(codon, sq)
  #   # Find the start positions of all occurrences of "codon" in sequence "sq"
  #   codonpositions <- occurrences@ranges@start
  #   # Find the total number of potential start and stop codons in sequence "sq"
  #   numoccurrences <- length(codonpositions)
  #   if (i == 1)
  #   {
  #     # Make a copy of vector "codonpositions" called "positions"
  #     positions   <- codonpositions
  #     # Make a vector "types" containing "numoccurrences" copies of "codon"
  #     types       <- rep(codon, numoccurrences)
  #   }
  #   else
  #   {
  #     # Add the vector "codonpositions" to the end of vector "positions":
  #     positions   <- append(positions, codonpositions, after=length(positions))
  #     # Add the vector "rep(codon, numoccurrences)" to the end of vector "types":
  #     types       <- append(types, rep(codon, numoccurrences), after=length(types))
  #   }
  # }



  # Sort the vectors "positions" and "types" in order of position along the input sequence:
  indices     <- order(starts_stops_list$positions)
  positions   <- starts_stops_list$positions[indices]
  types       <-starts_stops_list$types[indices]

  cat("This may take a second...")
  # Make a plot showing the positions of the start and stop codons in the input sequence:
  # Draw a line at y=0 from 1 to the length of the sequence:
  x  <- c(1,nchar(sq))
  y <- c(0,0)
  plot(x, y, ylim=c(0,3), type="l", axes=FALSE, xlab="Nucleotide", ylab="Reading frame",
       main="Predicted start (red) and stop (blue) codons")
  graphics::segments(1,1,nchar(sq),1)
  graphics::segments(1,2,nchar(sq),2)
  # Add the x-axis at y=0:
  graphics::axis(1, pos=0)
  # Add the y-axis labels:
  graphics::text(0.9,0.5,"+1")
  graphics::text(0.9,1.5,"+2")
  graphics::text(0.9,2.5,"+3")
  # Draw in each predicted start/stop codon:
  numcodons <- length(positions)
  for (i in 1:numcodons)
  {
    position <- positions[i]
    type <- types[i]
    remainder <- (position-1) %% 3
    if    (remainder == 0) # +1 reading frame
    {
      if (type == "atg") { graphics::segments(position,0,position,1,lwd=1,col="red") }
      else               { graphics::segments(position,0,position,1,lwd=1,col="blue")}
    }
    else if (remainder == 1)
    {
      if (type == "atg") { graphics::segments(position,1,position,2,lwd=1,col="red") }
      else               { graphics::segments(position,1,position,2,lwd=1,col="blue")}
    }
    else if (remainder == 2)
    {
      if (type == "atg") { graphics::segments(position,2,position,3,lwd=1,col="red") }
      else               { graphics::segments(position,2,position,3,lwd=1,col="blue")}
    }
  }
}
