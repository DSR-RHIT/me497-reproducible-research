
# visually check the data





How to use this tutorial 

- ![](../resources/images/text-icon.png)<!-- --> *add text*: type the prose verbatim into the Rmd file 
- ![](../resources/images/code-icon.png)<!-- --> *add code*: insert a code chunk, then transcribe the R code 
- ![](../resources/images/knit-icon.png)<!-- --> *knit* after each addition. 
- *Install* packages one time only
- *Load* a package using `library()` every session

Packages used in this tutorial  

- readr
- ggplot2

## what we're doing 

Graphing the data is one of the first things a data scientist does before doing any analysis. You want to check for anomalies visually.  

## open a new Rmd script

Open a new Rmd file, and name it `03_calibr_graph-draft.Rmd`. Save it to the `scripts` directory.

Edit the YAML header:  

    ---
    title: "Load-cell calibration --- graph first look"
    author: "your name"
    date: "date"
    output: html_document
    ---

Delete the rest of the pre-populated text. Insert knitr setup code

![](../resources/images/code-icon.png)<!-- --> 

    library(knitr)
    opts_knit$set(root.dir = '../')
    opts_chunk$set(echo = TRUE,  collapse = TRUE)

Knowing the packages we'll be using, we can load them right away, near the top of the file.

![](../resources/images/code-icon.png)<!-- -->


```r
# load packages
library(readr)
library(ggplot2)
```

You will most likely encounter three main graphical systems in R: `base graphics`, `lattice`, and `ggplot2`. We'll use `ggplot2`, written by the [nerd famous Hadley Wickham](http://priceonomics.com/hadley-wickham-the-man-who-revolutionized-r/), and currently the most popular R graphics system. 

You should learn to recognize syntax from the other systems too. With so many code samples online, you will eventually want to copy someone's code as a basis for a new graph, and you can't use, say, `lattice` syntax in a `ggplot2` environment. To illustrate the difference in the three systems, scatter plots are drawn using: 

- `plot(x, y, ...)` in `base`
- `xyplot(y ~ x, ...)` in `lattice` 
- `geom_point(aes(x, y, ...))` in `ggplot2`

Robert Kabacoff, the author of the online reference [Quick-R](http://www.statmethods.net/) and the book [R in Action  2/e](https://www.manning.com/books/r-in-action-second-edition) (if you buy one book to help you learn R, I recommend this one), summarizes R graphics systems [here](http://www.slideshare.net/kabacoff/r-for-data-visualization-and-graphics-31577136?next_slideshow=1). Also, an anonymous blogger compares lattice to ggplot2 in a series of posts [here](https://learnr.wordpress.com/2009/08/26/ggplot2-version-of-figures-in-lattice-multivariate-data-visualization-with-r-final-part/). 

Having used `lattice` for years now, I am a novice `ggplot2` user too, but I'm convinced it's the package to learn --- all the cool kids are using it. 

Read more about `ggplot2` in section 10.4 of the text. 

## data 

![](../resources/images/text-icon.png)<!-- -->

    # Data

    Read the tidy data set.

![](../resources/images/code-icon.png)<!-- -->


```r
graph_data <- read_csv("data/02_calibr_data-tidy.csv")
str(graph_data)
```

## check yourself

Confer with a neighbor.

1. How many variables in this data frame?
2. Which variables do we use in the calibration graph?

## a simple graph

![](../resources/images/text-icon.png)<!-- -->

    # Building the graph in layers

    Just show the data. 

![](../resources/images/code-icon.png)<!-- -->


```r
calibr_graph <- ggplot(data = graph_data, aes(x = input_lb, y = output_mV)) +
	geom_point()

print(calibr_graph)
```

Learning ggplot2

- `data = ...` assigns the data frame on which `ggplot` operates
- `aes()` is the **aes**thetic mapping, indicating which of the variables in the data frame are used for `x` and `y` coordinates of the scatter plot
- `+` is the syntax for "add the next layer"
- `geom_point()` is a **geom**etric object. We use points because we're drawing a scatterplot

That's all it takes to obtain a basic scatterplot. We'll be doing more to edit the graph after we've done some regression analysis. 

## print to file 

![](../resources/images/text-icon.png)<!-- -->

    # Print to file  

![](../resources/images/code-icon.png)<!-- -->


```r
# print to file
ggsave("results/03_calibr_graph-draft.png", plot = calibr_graph, width = 6, height = 4, units = "in", dpi = 300)
```

Learning ggplot2

- Save to the `results` directory 
- `dpi = 300` for using in a print document
- `dpi` $\times$ `width` and `dpi` $\times$ `height` in inches yields screen dimension in pixels (72 ppi for web resolution is a  [myth](http://www.photoshopessentials.com/essentials/the-72-ppi-web-resolution-myth/)).


## check yourself

Your directories should contain these files:

    data\
      |-- 007_wide-data.csv
      |-- 01_calibr_data_active-report.csv
      `-- 02_calibr_data-tidy.csv

    reports\
    
    resources\
      `-- load-cell-setup-786x989px.png 
      
    results\
      |-- 01_calibr_data-wide.csv 
      `-- 03_calibr_graph-draft.png 
      
    scripts\
      |-- 01_calibr_data-wide.Rmd 
      |-- 02_calibr_data-tidy.Rmd 
      `-- 03_calibr_graph-draft.Rmd 
      
## push to github

- RStudio Environment pane,`Git` tab  
- Check the `Staged` box for new files and folders 
- `Commit` 
- Type a unique commit message 
- `Commit` 
- `Close` 
- `Push` 
- `Close` 

## check yourself

- Online, navigate to your project repo on GitHub. 
- The new files and folders should be there 

---

[main page](../README.md)  
