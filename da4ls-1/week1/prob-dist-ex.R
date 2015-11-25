# Install de gapminder data ...
# install.packages("gapminder")

# Now load the data and see the first few lines ...
library(gapminder)
data(gapminder)
head(gapminder)

# Create a vector selecting the liveExp of all countries in 1952
x <- filter(gapminder,year=="1952") %>% select(lifeExp) %>% unlist

# get the proportion of countries that in 1952 have a life expectancy 
# less than or equal to 40
mean(x <= 40)

# get the same between 40 and 60 years ...
mean(x <= 60) - mean(x <= 40)
