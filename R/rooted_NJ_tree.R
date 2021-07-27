#' Wrapper function for creating rooted neighbor-joining trees
#'
#' By Avril Coghlan (2011).
#'
#' Uses seqinr::dist.alignment() and ape::nj(), ape::boot.phylo().
#'
#' @param alignment Multiple sequence alignment object
#' @param og Outgroup, as quoted string
#' @param type Type of sequencE: "DNA" or "protein"
#'
#' @export
#'

rooted_NJ_tree <- function(alignment, og, type)
{
  # load the ape and seqinr packages:
  ##require("ape")
  ##require("seqinr")

  # define a function for making a tree:
  makemytree <- function(alignmentmat, og = og)
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
    myrootedtree <- ape::root(phy = mytree,
                              outgroup = og,
                              resolve.root=TRUE)
    return(myrootedtree)
  }

  # infer a tree
  mymat  <- seqinr::as.matrix.alignment(alignment)
  myrootedtree <- makemytree(mymat, og = og)
  # bootstrap the tree
  myboot <- ape::boot.phylo(phy = myrootedtree,
                            x = mymat,
                            FUN = makemytree)
  # plot the tree:
  ape::plot.phylo(myrootedtree, type="p")  # plot the rooted phylogenetic tree
  ape::nodelabels(myboot,cex=0.7)          # plot the bootstrap values

  mytree$node.label <- myboot   # make the bootstrap values be the node labels

  return(mytree)
}
