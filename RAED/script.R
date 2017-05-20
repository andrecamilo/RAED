installed.packages()

search()

library(foreign)

library(help = foreign)

if (!require("datasets")) { 
	install.packages("datasets")
}

library("datasets")
search()

data(package = "datasets")$results

data(diamonds, package = "datasets")

head(diamonds)


