
# candidate reproducibility projects

## getting started

Please consider which project listed below you might prefer for your
Project 2. Read the brief descriptions below and use the links to read
the source material for more detail.

How we will manage the projects:

  - Each student will be assigned a different project
  - Each student will be a GitHub collaborator with another student,
    locally running their scripts, adding comments and questions, and
    pushing to the project repo.  
  - In the report, the analysis has to be transparent and explained,
    that is, you explain the analysis with visible code chunks and
    output (unlike the original articles in which the analysis is
    discussed but not explicitly shown).
  - Ultimately you obtain results that are compatible (or not) with the
    original findings. If not, you explain the cause of the
discrepancy.

## project descriptions

<!-- **Can you trust Microsoft Excel 2015 for accurate computing?** -->

<!-- In 2008, [B.D. McCullough and David Heiser](http://www.pucrs.br/famat/viali/tic_literatura/artigos/planilhas/McHe08.pdf) published a paper documenting that "Excel 2007, like its predecessors, fails a standard set of intermediate-level accuracy tests in three areas: statistical distributions, random number generation, and estimation." In this project I want you to update this analysis, apply the intermediate tests they describe to Excel 2015 and R and compare the results. Specifically, I suggest you use the following Excel functions -->

<!-- - `LOGEST` for exponential curve-fitting  -->

<!-- - `RAND` for random number generation (per Wichmann-Hill)  -->

<!-- - `Exponential smoothing`  -->

<!-- and do the same computations in R and compare the results.  -->

**Does mortality increase with income inequality?**

In 2000, [Nancy A Ross, Michael C Wolfson, and
others](http://www.bmj.com/content/320/7239/898?query=rft.jtitle%25253DJ%252BGerontol%2526rft_id%25253Dinfo%25253Apmid%25252F8315241%2526rft.genre%25253Darticle%2526rft_val_fmt%25253Dinfo%25253Aofi%25252Ffmt%25253Akev%25253Amtx%25253Ajournal%2526ctx_ver%25253DZ39.88-2004%2526url_ver%25253DZ39.88-2004%2526url_ctx_fmt%25253Dinfo%25253Aofi%25252Ffmt%25253Akev%25253Amtx%25253Actx)
found that Canadian provinces and metropolitan areas generally had both
lower income inequality and lower mortality than US states and
metropolitan areas. In this project, I would like you to

  - reproduce their 1990 Census analysis and findings
  - bring the results up to date by acquiring data from the 2000 Census
    and if possible the 2010 Census

**How does the stock market or cost of housing affect consumer
spending?**

Using data from 1975–2012, [Karl Case, John Quigley, and Robert
Shiller](http://www.nber.org/papers/w18667) found that US households
increase their spending when house prices rise, but not when house
prices fall. In this project, I would like you to reproduce their
analysis and findings. How do these results inform our understanding of
the consequences of the 2008 financial crisis? For a big-picture view of
the causes and effects of the 2008 financial crisis, read [this 2009
article](http://faculty.econ.ucdavis.edu/faculty/kdsalyer/LECTURES/Ecn200e/krugman_macro.pdf)
by Paul
Krugman.

<!-- **How trustworthy are electronic voting systems in the US?** -->

<!-- In 2015, [Beth Clarkson](https://www.statslife.org.uk/politics/2288-how-trustworthy-are-electronic-voting-systems-in-the-us), a professor of statistics at Wichita State University, analyzed election returns in Kansas, Ohio, and Wisconsin over several elections and found patterns that indicate votes are being manipulated in the voting machines. Her assessment is that "the data reveals multiple (at least two) agents working independently to successfully alter voting results." In this project, I want you to reproduce her analysis. Links to the data she used are given at the end of the paper.  -->

<!-- If you are successful in reproducing the reults, it would be interesting to apply the same analysis to data from a State of your choosing from the 2012 election.  -->

**Magnitude-based inference is a flawed statistical method**

In 2018, [Kristin
Sainani](https://journals.lww.com/acsm-msse/Fulltext/2018/10000/The_Problem_with__Magnitude_based_Inference_.23.aspx)
showed that, contrary to its proponents’ claims, Magnitude-based
Inference (MBI) does not exhibit “superior” type I and type II error
rates compared to standard null hypothesis testing. The flagship journal
of the American College of Sports Medicine—Medicine and Science in
Sports and Exercise—has stopped accepting papers that use MBI.

In this project, I would like you to reproduce her analysis and
findings. You can read an overview in an article on
[FiveThirtyEight](https://fivethirtyeight.com/features/a-flawed-statistical-method-was-just-banned-from-a-major-sports-science-journal/).

<!-- **Protein ID.** Rating ______ . Identifying proteins by tandem mass spectrometry.  -->

<!-- A statistical model is presented for computing probabilities that proteins are present in a sample on the basis of peptides assigned to tandem mass (MS/MS) spectra acquired from a proteolytic digest of the sample. In this project, I ask you to reproduce this work using the [assignment and data](http://noble.gs.washington.edu/~wnoble/genome541/prophet/) by Prof. William Stafford Noble at the Department of Genome Sciences, University of Washington.  [](http://pubs.acs.org/doi/abs/10.1021/ac0341261)  -->

<!-- **Global population.** Rating ______ . How is the global population changing?  -->

<!-- The [Gapminder project](https://www.gapminder.org/data/) provides data by country for all sorts of population dynamics, for example, fertility, life expectancy, GDP per capita, etc. There are many research questions that could be investigated using these data. For example, Hans Rosling developed visualization of life expectancy as a function of fertility rate, with data markers indicating population size, and the whole thing changing over time. [](https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen?language=en#t-30140) Can you reproduce Hans' work in static images? Or address some other question with the Gapminder data?  -->
