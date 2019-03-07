library(tidyverse)
library(gapminder)
library(gganimate)

gapminder %>%
  mutate(continent = fct_collapse(continent, Asia = c("Asia", "Oceania"))) %>%
  filter(continent != "Europe") %>%
  
  ggplot(aes(x = gdpPercap, y = lifeExp, size = pop, color = country)) +
    geom_point(alpha = 0.5, show.legend=FALSE) +
    scale_x_log10(breaks = c(1000, 10000),
                  labels = c("$1,000", "$10,000")) +
  facet_grid(~continent) +
  labs(x = "GDP",
       y = "Life Expectancy") +
  scale_color_manual(values = country_colors) +
  transition_time(year) +
  labs(title = "The World Gets Better Every Year: {frame_time}")
  

  
  