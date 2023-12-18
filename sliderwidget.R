## Not run: 
library(manipulate)

## Create a plot with a slider
manipulate(plot(1:x), x = slider(5, 10))

## Use multiple sliders
manipulate(
  plot(cars, xlim = c(x.min, x.max)),
  x.min = slider(0,15),
  x.max = slider(15,30))

## Specify a custom initial value for a slider
manipulate(
  barplot(1:x),
  x = slider(5, 25, initial = 10))

## Specify a custom label for a slider
manipulate(
  barplot(1:x),
  x = slider(5, 25, label = "Limit"))

## Specify a step value for a slider
manipulate(
  barplot(1:x),
  x = slider(5, 25, step = 5))

## End(Not run)
