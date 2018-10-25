Try bookdown for auto-numbering
================

# First section

``` r
plot(cars)
```

![An amazing plot](try_bookdown_files/figure-gfm/unnamed-chunk-1-1.png)

``` r
plot(cars)
```

![Another amazing
plot](try_bookdown_files/figure-gfm/unnamed-chunk-2-1.png)

# Second section

This is Chapter @ref(intro)

See Table @ref(tab:mtcars)

``` r
knitr::kable(mtcars[1:5, 1:5], caption = "A caption")
```

|                   |  mpg | cyl | disp |  hp | drat |
| ----------------- | ---: | --: | ---: | --: | ---: |
| Mazda RX4         | 21.0 |   6 |  160 | 110 | 3.90 |
| Mazda RX4 Wag     | 21.0 |   6 |  160 | 110 | 3.90 |
| Datsun 710        | 22.8 |   4 |  108 |  93 | 3.85 |
| Hornet 4 Drive    | 21.4 |   6 |  258 | 110 | 3.08 |
| Hornet Sportabout | 18.7 |   8 |  360 | 175 | 3.15 |

A caption

See equation @ref(eq:linear)

\[
a + bx = c  (\#eq:linear)
\]
