#' Find potential open reading frames (ORFs) in a DNA sequence.
#'
#' By Coghlan (2011) A little book of R for bioinformatics.  https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/.
#' Originally called findORFsinSeq()
#'
#' @param sq Input sequence
#'
#' @examples
#'
#' # From Coglan 2011
#' ## Toy example
#' s1 <- "aaaatgcagtaacccatgccc"
#' find_ORFs_in_seq(s1)
#'
#' ## Dengue virus example
#' data(dengueseqstartstring)
#' find_ORFs_in_seq(dengueseqstartstring)
#'
#' @export
find_ORFs_in_seq <- function(sq)
{

  # Make vectors "positions" and "types" containing information on the positions of ATGs
  ## in the sequence:
  ## call find_start_stop_ORFs()
  mylist <- find_start_stop_codons(sq)
  positions <- mylist$positions
  types <- mylist$types

  # Initailize vectors "orfstarts" and "orfstops"
  ## to store the predicted start and stop codons of ORFs
  orfstarts <- numeric()
  orfstops <- numeric()

   # Make a vector "orflengths" to store the lengths of the ORFs
  orflengths <- numeric()

  # Print out the positions of ORFs in the sequence:
  # Find the length of vector "positions"
  numpositions <- length(positions)
  # There must be at least one start codon and one stop codon to have an ORF.
  if (numpositions >= 2)
  {
    for (i in 1:(numpositions-1))
    {

      posi <- positions[i]
      typei <- types[i]
      found <- 0
      while (found == 0)
      {

        for (j in c(i+1):numpositions)
        {

          posj  <- positions[j]
          typej <- types[j]
          posdiff <- posj - posi

          ## NOTE: %% is the modulo operation
          ### Wikipedia: "In computing, the modulo operation returns the remainder or signed remainder of a division,
          ###             after one number is divided by another (called the modulus of the operation).
          ### Here is used in relation to the fact that all codons have 3 bases on them
          posdiffmod3 <- posdiff %% 3

          # Add in the length of the stop codon
          orflength <- posj - posi + 3

          if (typei == "atg" && (typej == "taa" || typej == "tag" || typej == "tga") && posdiffmod3 == 0)
          {
            # Check if we have already used the stop codon at posj+2 in an ORF
            numorfs <- length(orfstops)

            # set usedstop parameter to -1
            usedstop <- -1
            if (numorfs > 0)
            {
              for (k in 1:numorfs)
              {
                # orfstops initialized as empty vector above
                orfstopk <- orfstops[k]


                if(orfstopk == c(posj + 2)){

                  # set usedstop parameter to +1
                  usedstop <- 1
                }

              }
            }
            if (usedstop == -1)
            {
              orfstarts  <- append(orfstarts,
                                   posi,
                                   after=length(orfstarts))

              orfstops   <- append(orfstops,
                                   c(posj+2),
                                   after=length(orfstops)) # Including the stop codon.

              orflengths <- append(orflengths,
                                   orflength,
                                   after=length(orflengths))
            }
            found <- 1
            break
          }
          if (j == numpositions) {
            found <- 1
            }
        }
      }
    }
  }

  # Sort the final ORFs by start position:
  indices <- order(orfstarts)
  orfstarts <- orfstarts[indices]
  orfstops <- orfstops[indices]
  # Find the lengths of the ORFs that we have
  orflengths <- numeric()
  numorfs <- length(orfstarts)
  for (i in 1:numorfs)
  {

    orfstart <- orfstarts[i]
    orfstop <- orfstops[i]
    orflength <- orfstop - orfstart + 1
    orflengths <- append(orflengths,orflength,after=length(orflengths))
  }
  mylist <- list(orfstarts = orfstarts,
                 orfstops = orfstops,
                 orflengths = orflengths)
  return(mylist)
}
