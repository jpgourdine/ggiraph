library(ggplot2)
library(ggiraph)

v <- ggplot(faithfuld, aes(waiting, eruptions, z = density))
p <- v + geom_contour_interactive(aes(
  colour = stat(level),
  tooltip = paste("Level:", stat(level))
))
x <- girafe(ggobj = p)
if (interactive()) print(x)

if (packageVersion("grid") >= numeric_version("3.6")) {
  p <- v + geom_contour_filled_interactive(aes(
    colour = stat(level),
    fill = stat(level),
    tooltip = paste("Level:", stat(level))
  ))
  x <- girafe(ggobj = p)
  if (interactive()) print(x)
}
