library(UsingR)
x <- father.son$fheight
round(sample(x,10),1)

smallest <- floor(min(x))
largest <- ceiling(max(x))
values <- seq(smallest, largest,len=300)
heightecdf <- ecdf(x)
plot(values, heightecdf(values), type="l", xlab="a (Height in inches)",ylab="Pr(x <= a)")

