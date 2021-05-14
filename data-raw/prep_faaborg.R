#Prep faaborg

Faaborg_wide <- read.csv("~/1_R/git/wildlifeR_home/wildlifeR/inst/extdata/Faaborg_wide.csv", header=TRUE)


head(Faaborg_wide)
Faaborg_wide[,1:8]

i.use <- c("Ovenbird",
           "Worm-eating Warbler",
           "Northern Waterthrush",
           "Black-and-white Warbler",
           "Hooded Warbler",
           "American Redstart",
           "Cape May Warbler",
           "Northern Parula",
           "Prairie Warbler")

Faaborg_wide[which(Faaborg_wide$common.name %in% i.use),
             c("yr.1991","yr.2005")]

species <- c("Ovenbird",
             "Worm-eating Warbler",
             "Northern Waterthrush",
             "Black-and-white Warbler",
             "Hooded Warbler",
             "American Redstart",
             "Cape May Warbler",
             "Northern Parula",
             "Prairie Warbler")

N.1991 <- c(29,6,4,60,8,19,9,7,4)
N.2005 <- c(24,5,0,16,3, 9,2,5,8)

dat <- data.frame(species,N.1991,N.2005)

## Version 1

* Note there is no "~", just the name of each column, followed by a comma
* must include paired = TRUE

t.test(dat$N.1991,
       dat$N.2005,
       paired = TRUE)
