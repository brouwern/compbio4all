#' Wrapper function for creating unrooted neighbor-joining trees
#'
#' By Avril Coghlan (2011).
#'
#' Uses seqinr::dist.alignment() and ape::nj(), ape::boot.phylo().
#'
#' @param alignment Multiple sequence alignment
#' @param type "DNA" or "protein"
#'
#' @export


unrooted_NJ_tree <- function(alignment,type)
{
  # this function requires the ape and seqinR packages:
  #require("ape")
  #require("seqinr")
  # define a function for making a tree:
  makemytree <- function(alignmentmat)
  {
    alignment <- ape::as.alignment(alignmentmat)
    if      (type == "protein")
    {
      mydist <- seqinr::dist.alignment(alignment)
    }
    else if (type == "DNA")
    {
      alignmentbin <- ape::as.DNAbin(alignment)
      mydist <- ape::dist.dna(alignmentbin)
    }
    mytree <- ape::nj(mydist)
    mytree <- ape::makeLabel(mytree, space="") # get rid of spaces in tip names.
    return(mytree)
  }

  # infer a tree
  mymat  <- seqinr::as.matrix.alignment(alignment)
  mytree <- makemytree(mymat)
  # bootstrap the tree
  myboot <- ape::boot.phylo(mytree, mymat, makemytree)
  # plot the tree:
  ape::plot.phylo(mytree,type="u")   # plot the unrooted phylogenetic tree
  ape::nodelabels(myboot,cex=0.7)    # plot the bootstrap values
  mytree$node.label <- myboot   # make the bootstrap values be the node labels
  return(mytree)
}
