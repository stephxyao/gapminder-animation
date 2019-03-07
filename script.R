library(tidyverse)
library(gapminder)
library(gganimate)

gapminder %>%
  mutate(continent = fct_collapse(continent, Asia = c("Asia", "Oceania"))) %>%
  filter(continent != "Europe") %>%
  
  ggplot(aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) +
    geom_point(alpha = 0.5, show.legend=FALSE) +
    scale_x_log10() +
  facet_grid(~continent)
  
  