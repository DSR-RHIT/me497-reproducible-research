
# web-scraping HTML data

The purpose of web-scraping is to write scripts to download data from
online sources to avoid manual download operations, thereby enhancing
the project’s reproducibility.

The packages and functions we might use depend on the manner in which
the data is stored online, e.g., HTML, XML, or a text file with no XML
or HTML tags.

In this example, we have data sets encoded online in HTML markup. The
data are median values of US [home
prices](https://www.census.gov/hhes/www/housing/census/historic/values.html)
by state for several decades from the US
Census

<img src="../resources/images/census-housing-1.png" width="70%" style="display: block; margin: auto;" />

## getting started

The basic methodology is adapted from an RStudio [blog
post](https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/).
For webscraping we use the **rvest** package (which also loads required
package **xml2**).

``` r
suppressPackageStartupMessages(library(rvest))
suppressPackageStartupMessages(library(tidyverse))
```

*SelectorGadget* is a java script bookmarklet that allows you to
interactively figure out what markup tags (called CSS “selectors”) you
need to extract desired components from a page. To set it up,

  - Navigate to the
    [SelectorGadget](https://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html)
    site
  - In *Installation*, drag the SelectorGadget link to your browser
    bookmarks
bar.

<img src="../resources/images/census-housing-2.png" width="70%" style="display: block; margin: auto;" />

## work with the HTML page

`read_html()` is a function in **xml2**. The argument is the URL of the
online data set, in this case,
<https://www.census.gov/hhes/www/housing/census/historic/values.html>.

``` r
webdata <- read_html("https://www.census.gov/hhes/www/housing/census/historic/values.html")

webdata
## {xml_document}
## <html lang="en">
## [1] <head>\n<script>\nif (document.layers)\n  WM_scaleFont(initialFontSi ...
## [2] <body>\n\n<script language="JavaScript">\r\n<!--\r\n\r\nfunction WM_ ...
```

To use *SelectorGadget* interactively, open your browser and:

  - Navigate to the data URL, in this case,
    <https://www.census.gov/hhes/www/housing/census/historic/values.html>
  - In this window, click on the selector gadget in the browser
    bookmarks
  - Move down to the data and click
  - In the window at the bottom of the page, the selector appears
  - For selecting more than one or toggling selections on and off, see
    the detailed tutorial at the [SelectorGadget
    vignette](https://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html).

In this case the selector is `pre`.

## use the CSS selector

The CSS selector is the argument for `html_nodes()`.

``` r
webdata <- webdata %>%
  html_nodes("pre")

webdata
## {xml_nodeset (1)}
## [1] <pre>\nMedian Home Values\n\n                     2000      1990     ...
```

## data transformation

First we convert the webdata object to a single text string using
`rvest::html_text()`.

``` r
webdata <- webdata %>%
    html_text()

str(webdata)
##  chr "\nMedian Home Values\n\n                     2000      1990      1980      1970     1960     1950    1940\n\n  "| __truncated__
```

The string includes newline tags (`\n`) that we can use to separate the
one long string into a vector of strings.

``` r
webdata <- webdata %>%
  str_split("\n")

str(webdata)
## List of 1
##  $ : chr [1:129] "" "Median Home Values" "" "                     2000      1990      1980      1970     1960     1950    1940" ...
```

Prior to the split we had one character string. After the split, the
structure shows 129 rows (`chr [1:129]`).

The current vector is a list. Use `unlist()` to convert it to a simple
vector.

``` r
webdata <- unlist(webdata)

webdata
##   [1] ""                                                                                                
##   [2] "Median Home Values"                                                                              
##   [3] ""                                                                                                
##   [4] "                     2000      1990      1980      1970     1960     1950    1940"               
##   [5] ""                                                                                                
##   [6] "                          Adjusted to 2000 dollars"                                              
##   [7] "United States     $119,600  $101,100   $93,400   $65,300  $58,600  $44,600  $30,600"             
##   [8] ""                                                                                                
##   [9] "Alabama            $85,100   $68,600   $67,100   $46,900  $42,400  $27,100  $16,800"             
##  [10] "Alaska            $144,200  $120,600  $151,000   $87,200  $44,800  $21,100     NA"               
##  [11] "Arizona           $121,300  $102,300  $108,500   $62,600  $54,700  $36,000  $14,600"             
##  [12] "Arkansas           $72,800   $59,200   $61,600   $40,300  $33,000  $24,800  $11,400"             
##  [13] "California        $211,500  $249,800  $167,300   $88,700  $74,400  $57,900  $36,700"             
##  [14] "Colorado          $166,600  $105,700  $126,900   $66,400  $60,600  $43,300  $21,800"             
##  [15] "Connecticut       $166,900  $227,200  $129,900   $97,900  $82,300  $71,900  $48,000"             
##  [16] "Delaware          $130,400  $127,900   $87,900   $65,700  $61,100  $55,000  $43,300"             
##  [17] "Dist. of Columbia $157,200  $158,300  $136,200   $81,800  $75,900  $87,800  $78,800"             
##  [18] "Florida           $105,500   $98,500   $89,300   $57,600  $58,100  $40,100  $23,100"             
##  [19] "Georgia           $111,200   $91,100   $73,000   $56,100  $46,800  $31,700  $20,400"             
##  [20] "Hawaii            $272,700  $313,400  $233,800  $134,800 $103,000  $74,400      NA"              
##  [21] "Idaho             $106,300   $74,400   $90,300   $54,200  $52,200  $35,500  $16,700"             
##  [22] "Illinois          $130,800  $103,400  $104,500   $76,000  $72,400  $52,400  $34,100"             
##  [23] "Indiana            $94,300   $68,900   $73,600   $53,000  $50,300  $37,700  $25,000"             
##  [24] "Iowa               $82,500   $58,600   $80,400   $53,400  $48,800  $38,300  $23,400"             
##  [25] "Kansas             $83,500   $66,700   $74,800   $46,500  $45,800  $33,100  $18,000"             
##  [26] "Kentucky           $86,700   $64,500   $67,700   $48,400  $43,400  $32,000  $21,600"             
##  [27] "Louisiana          $85,000   $74,700   $85,100   $56,100  $52,700  $31,100  $14,700"             
##  [28] "Maine              $98,700  $111,700   $75,000   $49,200  $43,400  $29,400  $20,900"             
##  [29] "Maryland          $146,000  $148,800  $115,400   $71,800  $58,600  $48,700  $31,500"             
##  [30] "Massachusetts     $185,700  $208,000   $95,800   $79,100  $68,000  $55,400  $39,900"             
##  [31] "Michigan          $115,600   $77,400   $77,200   $67,200  $59,100  $45,400  $29,800"             
##  [32] "Minnesota         $122,400   $94,500  $105,100   $69,100  $63,100  $47,300  $31,500"             
##  [33] "Mississippi        $71,400   $58,300   $62,200   $43,000  $38,900  $25,200  $12,400"             
##  [34] "Missouri           $89,900   $76,400   $72,600   $55,300  $53,700  $38,800  $24,900"             
##  [35] "Montana            $99,500   $72,300   $92,000   $53,800  $53,700  $35,100  $17,200"             
##  [36] "Nebraska           $88,000   $64,400   $75,200   $47,600  $46,300  $35,900  $22,400"             
##  [37] "Nevada            $142,000  $122,300  $136,000   $86,000  $74,900  $53,700  $20,700"             
##  [38] "New Hampshire     $133,300  $165,300   $95,000   $63,000  $52,700  $37,600  $26,100"             
##  [39] "New Jersey        $170,800  $207,400  $119,200   $89,900  $76,900  $63,100  $47,100"             
##  [40] "New Mexico        $108,100   $89,600   $89,700   $49,900  $52,700  $34,500   $6,800"             
##  [41] "New York          $148,700  $168,100   $90,300   $86,400  $75,400  $61,500  $45,700"             
##  [42] "North Carolina    $108,300   $84,100   $71,300   $49,200  $39,400  $29,700  $18,800"             
##  [43] "North Dakota       $74,400   $64,900   $86,900   $49,900  $48,300  $32,700  $16,900"             
##  [44] "Ohio              $103,700   $81,100   $88,900   $67,600  $66,000  $50,300  $35,500"             
##  [45] "Oklahoma           $70,700   $61,500   $70,500   $42,600  $38,900  $31,700  $13,500"             
##  [46] "Oregon            $152,100   $85,700  $112,600   $59,100  $51,700  $41,500  $24,400"             
##  [47] "Pennsylvania       $97,000   $89,100   $77,400   $52,200  $50,300  $42,400  $33,400"             
##  [48] "Rhode Island      $133,000  $170,600   $92,600   $69,900  $60,600  $59,200  $40,000"             
##  [49] "South Carolina     $94,900   $78,100   $69,500   $49,900  $37,000  $31,000  $22,300"             
##  [50] "South Dakota       $79,600   $57,700   $72,400   $43,800  $43,400  $32,800  $16,800"             
##  [51] "Tennessee          $93,000   $74,600   $70,500   $48,000  $40,900  $31,900  $19,000"             
##  [52] "Texas              $82,500   $76,100   $77,400   $46,100  $43,400  $35,200  $17,600"             
##  [53] "Utah              $146,100   $88,000  $113,400   $64,500  $62,100  $44,900  $24,100"             
##  [54] "Vermont           $111,500  $122,000   $83,500   $63,000  $47,800  $38,000  $29,500"             
##  [55] "Virginia          $125,400  $116,300   $95,000   $65,700  $53,200  $39,900  $27,400"             
##  [56] "Washington        $168,300  $119,300  $118,600   $71,100  $57,700  $43,400  $24,500"             
##  [57] "West Virginia      $72,800   $61,200   $76,200   $43,400  $37,400  $33,200  $24,500"             
##  [58] "Wisconsin         $112,200   $79,900   $96,200   $66,400  $62,100  $48,000  $33,600"             
##  [59] "Wyoming            $96,600   $78,700  $118,400   $58,800  $60,600  $41,300  $22,600"             
##  [60] ""                                                                                                
##  [61] "Note:  To adjust for inflation, the 1940 to 1990 median home values were adjusted to 2000"       
##  [62] "       dollars using the appropriate CPI-U-RS adjustment factor."                                
##  [63] ""                                                                                                
##  [64] "                               Year:       1940      1950     1960     1970     1980      1990"  
##  [65] "                  Adjustment factor:   10.406639  6.057971  4.927308 3.840735 1.979479  1.277636"
##  [66] ""                                                                                                
##  [67] ""                                                                                                
##  [68] "Median Home Values: Unadjusted"                                                                  
##  [69] ""                                                                                                
##  [70] ""                                                                                                
##  [71] "                     2000      1990      1980      1970     1960     1950    1940"               
##  [72] ""                                                                                                
##  [73] "United States     $119,600   $79,100   $47,200   $17,000  $11,900   $7,354  $2,938"              
##  [74] ""                                                                                                
##  [75] "Alabama            $85,100   $53,700   $33,900   $12,200   $8,600   $4,473  $1,610"              
##  [76] "Alaska            $144,200   $94,400   $76,300   $22,700   $9,100   $3,477     NA"               
##  [77] "Arizona           $121,300   $80,100   $54,800   $16,300  $11,100   $5,935  $1,400"              
##  [78] "Arkansas           $72,800   $46,300   $31,100   $10,500   $6,700   $4,087  $1,100"              
##  [79] "California        $211,500  $195,500   $84,500   $23,100  $15,100   $9,564  $3,527"              
##  [80] "Colorado          $166,600   $82,700   $64,100   $17,300  $12,300   $7,151  $2,091"              
##  [81] "Connecticut       $166,900  $177,800   $65,600   $25,500  $16,700  $11,862  $4,615"              
##  [82] "Delaware          $130,400  $100,100   $44,400   $17,100  $12,400   $9,079  $4,159"              
##  [83] "Dist. of Columbia $157,200  $123,900   $68,800   $21,300  $15,400  $14,498  $7,568"              
##  [84] "Florida           $105,500   $77,100   $45,100   $15,000  $11,800   $6,612  $2,218"              
##  [85] "Georgia           $111,200   $71,300   $36,900   $14,600   $9,500   $5,235  $1,957"              
##  [86] "Hawaii            $272,700  $245,300  $118,100   $35,100  $20,900  $12,283     NA"               
##  [87] "Idaho             $106,300   $58,200   $45,600   $14,100  $10,600   $5,852  $1,600"              
##  [88] "Illinois          $130,800   $80,900   $52,800   $19,800  $14,700   $8,646  $3,277"              
##  [89] "Indiana            $94,300   $53,900   $37,200   $13,800  $10,200   $6,226  $2,406"              
##  [90] "Iowa               $82,500   $45,900   $40,600   $13,900   $9,900   $6,320  $2,253"              
##  [91] "Kansas             $83,500   $52,200   $37,800   $12,100   $9,300   $5,462  $1,733"              
##  [92] "Kentucky           $86,700   $50,500   $34,200   $12,600   $8,800   $5,283  $2,074"              
##  [93] "Louisiana          $85,000   $58,500   $43,000   $14,600  $10,700   $5,141  $1,414"              
##  [94] "Maine              $98,700   $87,400   $37,900   $12,800   $8,800   $4,856  $2,008"              
##  [95] "Maryland          $146,000  $116,500   $58,300   $18,700  $11,900   $8,033  $3,031"              
##  [96] "Massachusetts     $185,700  $162,800   $48,400   $20,600  $13,800   $9,144  $3,837"              
##  [97] "Michigan          $115,600   $60,600   $39,000   $17,500  $12,000   $7,496  $2,863"              
##  [98] "Minnesota         $122,400   $74,000   $53,100   $18,000  $12,800   $7,806  $3,024"              
##  [99] "Mississippi        $71,400   $45,600   $31,400   $11,200   $7,900   $4,159  $1,189"              
## [100] "Missouri           $89,900   $59,800   $36,700   $14,400  $10,900   $6,399  $2,392"              
## [101] "Montana            $99,500   $56,600   $46,500   $14,000  $10,900   $5,797  $1,651"              
## [102] "Nebraska           $88,000   $50,400   $38,000   $12,400   $9,400   $5,918  $2,156"              
## [103] "Nevada            $142,000   $95,700   $68,700   $22,400  $15,200   $8,859  $1,987"              
## [104] "New Hampshire     $133,300  $129,400   $48,000   $16,400  $10,700   $6,199  $2,505"              
## [105] "New Jersey        $170,800  $162,300   $60,200   $23,400  $15,600  $10,408  $4,528"              
## [106] "New Mexico        $108,100   $70,100   $45,300   $13,000  $10,700   $5,697    $656"              
## [107] "New York          $148,700  $131,600   $45,600   $22,500  $15,300  $10,152  $4,389"              
## [108] "North Carolina    $108,300   $65,800   $36,000   $12,800   $8,000   $4,901  $1,802"              
## [109] "North Dakota       $74,400   $50,800   $43,900   $13,000   $9,800   $5,396  $1,626"              
## [110] "Ohio              $103,700   $63,500   $44,900   $17,600  $13,400   $8,304  $3,415"              
## [111] "Oklahoma           $70,700   $48,100   $35,600   $11,100   $7,900   $5,228  $1,293"              
## [112] "Oregon            $152,100   $67,100   $56,900   $15,400  $10,500   $6,846  $2,343"              
## [113] "Pennsylvania       $97,000   $69,700   $39,100   $13,600  $10,200   $6,992  $3,205"              
## [114] "Rhode Island      $133,000  $133,500   $46,800   $18,200  $12,300   $9,767  $3,848"              
## [115] "South Carolina     $94,900   $61,100   $35,100   $13,000   $7,500   $5,112  $2,145"              
## [116] "South Dakota       $79,600   $45,200   $36,600   $11,400   $8,800   $5,410  $1,618"              
## [117] "Tennessee          $93,000   $58,400   $35,600   $12,500   $8,300   $5,268  $1,826"              
## [118] "Texas              $82,500   $59,600   $39,100   $12,000   $8,800   $5,805  $1,693"              
## [119] "Utah              $146,100   $68,900   $57,300   $16,800  $12,600   $7,409  $2,320"              
## [120] "Vermont           $111,500   $95,500   $42,200   $16,400   $9,700   $6,277  $2,836"              
## [121] "Virginia          $125,400   $91,000   $48,000   $17,100  $10,800   $6,581  $2,633"              
## [122] "Washington        $168,300   $93,400   $59,900   $18,500  $11,700   $7,169  $2,359"              
## [123] "West Virginia      $72,800   $47,900   $38,500   $11,300   $7,600   $5,473  $2,350"              
## [124] "Wisconsin         $112,200   $62,500   $48,600   $17,300  $12,600   $7,927  $3,232"              
## [125] "Wyoming            $96,600   $61,600   $59,800   $15,300  $12,300   $6,811  $2,174"              
## [126] ""                                                                                                
## [127] "NA:  Not Available"                                                                              
## [128] "Source:  U.S. Census Bureau"                                                                     
## [129] ""
```

This vector of strings is ready for tidying.

## tidy the data

These data are not tidy: years are spread across as column headings.
Extract the year data from its row. Use these to create the eventual
column names of the tibble to come.

``` r
year_row <- which(str_detect(webdata, "2000"))[1]
year     <- str_squish(webdata[year_row])
year
## [1] "2000 1990 1980 1970 1960 1950 1940"

year <- unlist(str_split(year, " "))
year
## [1] "2000" "1990" "1980" "1970" "1960" "1950" "1940"
```

This data set has two major chunks: the upper chunk in constant dollars
(adjusted for inflation) and the lower chunk in nominal dollars (not
adjusted for inflation). Comparisons should always be made in constant
dollars, so we need only the top chunk.

The division between the two chunks is labeled “Median Home Values:
Unadjusted”. Find the row number of this string and filter to keep the
rows above that row.

``` r
unadjusted_row <- which(str_detect(webdata, "Unadjusted"))
unadjusted_row
## [1] 68

webdata <- webdata[1:(unadjusted_row-1)]
head(webdata, n = 12L)
##  [1] ""                                                                                   
##  [2] "Median Home Values"                                                                 
##  [3] ""                                                                                   
##  [4] "                     2000      1990      1980      1970     1960     1950    1940"  
##  [5] ""                                                                                   
##  [6] "                          Adjusted to 2000 dollars"                                 
##  [7] "United States     $119,600  $101,100   $93,400   $65,300  $58,600  $44,600  $30,600"
##  [8] ""                                                                                   
##  [9] "Alabama            $85,100   $68,600   $67,100   $46,900  $42,400  $27,100  $16,800"
## [10] "Alaska            $144,200  $120,600  $151,000   $87,200  $44,800  $21,100     NA"  
## [11] "Arizona           $121,300  $102,300  $108,500   $62,600  $54,700  $36,000  $14,600"
## [12] "Arkansas           $72,800   $59,200   $61,600   $40,300  $33,000  $24,800  $11,400"
```

Keep only those rows that include the names of the states.

``` r
state_names <- state.name
state_names <- str_c(state_names, collapse = "|")
state_names
## [1] "Alabama|Alaska|Arizona|Arkansas|California|Colorado|Connecticut|Delaware|Florida|Georgia|Hawaii|Idaho|Illinois|Indiana|Iowa|Kansas|Kentucky|Louisiana|Maine|Maryland|Massachusetts|Michigan|Minnesota|Mississippi|Missouri|Montana|Nebraska|Nevada|New Hampshire|New Jersey|New Mexico|New York|North Carolina|North Dakota|Ohio|Oklahoma|Oregon|Pennsylvania|Rhode Island|South Carolina|South Dakota|Tennessee|Texas|Utah|Vermont|Virginia|Washington|West Virginia|Wisconsin|Wyoming"

keep_rows   <- which(str_detect(webdata, state_names))
keep_rows
##  [1]  9 10 11 12 13 14 15 16 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
## [24] 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55
## [47] 56 57 58 59

webdata <- webdata[keep_rows]
head(webdata, n = 12L)
##  [1] "Alabama            $85,100   $68,600   $67,100   $46,900  $42,400  $27,100  $16,800"
##  [2] "Alaska            $144,200  $120,600  $151,000   $87,200  $44,800  $21,100     NA"  
##  [3] "Arizona           $121,300  $102,300  $108,500   $62,600  $54,700  $36,000  $14,600"
##  [4] "Arkansas           $72,800   $59,200   $61,600   $40,300  $33,000  $24,800  $11,400"
##  [5] "California        $211,500  $249,800  $167,300   $88,700  $74,400  $57,900  $36,700"
##  [6] "Colorado          $166,600  $105,700  $126,900   $66,400  $60,600  $43,300  $21,800"
##  [7] "Connecticut       $166,900  $227,200  $129,900   $97,900  $82,300  $71,900  $48,000"
##  [8] "Delaware          $130,400  $127,900   $87,900   $65,700  $61,100  $55,000  $43,300"
##  [9] "Florida           $105,500   $98,500   $89,300   $57,600  $58,100  $40,100  $23,100"
## [10] "Georgia           $111,200   $91,100   $73,000   $56,100  $46,800  $31,700  $20,400"
## [11] "Hawaii            $272,700  $313,400  $233,800  $134,800 $103,000  $74,400      NA" 
## [12] "Idaho             $106,300   $74,400   $90,300   $54,200  $52,200  $35,500  $16,700"
```

I think I would like to split the strings on the dollar signs, but to do
that, I’ll need the NA to be replaced with “$NA”.

``` r
webdata <- str_replace(webdata, "NA",  "$NA")
head(webdata, n = 12L)
##  [1] "Alabama            $85,100   $68,600   $67,100   $46,900  $42,400  $27,100  $16,800"
##  [2] "Alaska            $144,200  $120,600  $151,000   $87,200  $44,800  $21,100     $NA" 
##  [3] "Arizona           $121,300  $102,300  $108,500   $62,600  $54,700  $36,000  $14,600"
##  [4] "Arkansas           $72,800   $59,200   $61,600   $40,300  $33,000  $24,800  $11,400"
##  [5] "California        $211,500  $249,800  $167,300   $88,700  $74,400  $57,900  $36,700"
##  [6] "Colorado          $166,600  $105,700  $126,900   $66,400  $60,600  $43,300  $21,800"
##  [7] "Connecticut       $166,900  $227,200  $129,900   $97,900  $82,300  $71,900  $48,000"
##  [8] "Delaware          $130,400  $127,900   $87,900   $65,700  $61,100  $55,000  $43,300"
##  [9] "Florida           $105,500   $98,500   $89,300   $57,600  $58,100  $40,100  $23,100"
## [10] "Georgia           $111,200   $91,100   $73,000   $56,100  $46,800  $31,700  $20,400"
## [11] "Hawaii            $272,700  $313,400  $233,800  $134,800 $103,000  $74,400      $NA"
## [12] "Idaho             $106,300   $74,400   $90,300   $54,200  $52,200  $35,500  $16,700"
```

I think I need to omit the extra spaces

``` r
webdata <- str_squish(webdata)
head(webdata, n = 12L)
##  [1] "Alabama $85,100 $68,600 $67,100 $46,900 $42,400 $27,100 $16,800"       
##  [2] "Alaska $144,200 $120,600 $151,000 $87,200 $44,800 $21,100 $NA"         
##  [3] "Arizona $121,300 $102,300 $108,500 $62,600 $54,700 $36,000 $14,600"    
##  [4] "Arkansas $72,800 $59,200 $61,600 $40,300 $33,000 $24,800 $11,400"      
##  [5] "California $211,500 $249,800 $167,300 $88,700 $74,400 $57,900 $36,700" 
##  [6] "Colorado $166,600 $105,700 $126,900 $66,400 $60,600 $43,300 $21,800"   
##  [7] "Connecticut $166,900 $227,200 $129,900 $97,900 $82,300 $71,900 $48,000"
##  [8] "Delaware $130,400 $127,900 $87,900 $65,700 $61,100 $55,000 $43,300"    
##  [9] "Florida $105,500 $98,500 $89,300 $57,600 $58,100 $40,100 $23,100"      
## [10] "Georgia $111,200 $91,100 $73,000 $56,100 $46,800 $31,700 $20,400"      
## [11] "Hawaii $272,700 $313,400 $233,800 $134,800 $103,000 $74,400 $NA"       
## [12] "Idaho $106,300 $74,400 $90,300 $54,200 $52,200 $35,500 $16,700"
```

For further tidying, convert the vector to a tibble.

``` r
df <- webdata %>%
  as_tibble(headings = FALSE)

colnames(df) <- "state"

head(df, n = 12L)
## # A tibble: 12 x 1
##    state                                                                 
##    <chr>                                                                 
##  1 Alabama $85,100 $68,600 $67,100 $46,900 $42,400 $27,100 $16,800       
##  2 Alaska $144,200 $120,600 $151,000 $87,200 $44,800 $21,100 $NA         
##  3 Arizona $121,300 $102,300 $108,500 $62,600 $54,700 $36,000 $14,600    
##  4 Arkansas $72,800 $59,200 $61,600 $40,300 $33,000 $24,800 $11,400      
##  5 California $211,500 $249,800 $167,300 $88,700 $74,400 $57,900 $36,700 
##  6 Colorado $166,600 $105,700 $126,900 $66,400 $60,600 $43,300 $21,800   
##  7 Connecticut $166,900 $227,200 $129,900 $97,900 $82,300 $71,900 $48,000
##  8 Delaware $130,400 $127,900 $87,900 $65,700 $61,100 $55,000 $43,300    
##  9 Florida $105,500 $98,500 $89,300 $57,600 $58,100 $40,100 $23,100      
## 10 Georgia $111,200 $91,100 $73,000 $56,100 $46,800 $31,700 $20,400      
## 11 Hawaii $272,700 $313,400 $233,800 $134,800 $103,000 $74,400 $NA       
## 12 Idaho $106,300 $74,400 $90,300 $54,200 $52,200 $35,500 $16,700
```

Try splitting the columns on the dollar sign.

``` r
df <- df %>% 
    separate(col = state, into = c("state", year), sep = "[$]")
glimpse(df)
## Observations: 50
## Variables: 8
## $ state  <chr> "Alabama ", "Alaska ", "Arizona ", "Arkansas ", "Califo...
## $ `2000` <chr> "85,100 ", "144,200 ", "121,300 ", "72,800 ", "211,500 ...
## $ `1990` <chr> "68,600 ", "120,600 ", "102,300 ", "59,200 ", "249,800 ...
## $ `1980` <chr> "67,100 ", "151,000 ", "108,500 ", "61,600 ", "167,300 ...
## $ `1970` <chr> "46,900 ", "87,200 ", "62,600 ", "40,300 ", "88,700 ", ...
## $ `1960` <chr> "42,400 ", "44,800 ", "54,700 ", "33,000 ", "74,400 ", ...
## $ `1950` <chr> "27,100 ", "21,100 ", "36,000 ", "24,800 ", "57,900 ", ...
## $ `1940` <chr> "16,800", "NA", "14,600", "11,400", "36,700", "21,800",...
```

Gather the years, trim the strings, convert years to an integer

``` r
df <- df %>% 
    gather(year, price, '2000':'1940') %>% 
    mutate(year = as.integer(year)) %>% 
    mutate(state = str_trim(state)) %>% 
    mutate(price = str_trim(price)) %>% 
    glimpse()
## Observations: 350
## Variables: 3
## $ state <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "California"...
## $ year  <int> 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 20...
## $ price <chr> "85,100", "144,200", "121,300", "72,800", "211,500", "16...
```

Remove the comma from price, omit NA rows, convert price to numeric.

``` r
df <- df %>%
  mutate(price = str_replace(price, ",", "")) %>% 
    filter(price != "NA") %>% 
    mutate(price = as.integer(price)) %>% 
    glimpse()
## Observations: 348
## Variables: 3
## $ state <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "California"...
## $ year  <int> 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 20...
## $ price <int> 85100, 144200, 121300, 72800, 211500, 166600, 166900, 13...
```

These data are tidy

## analysis

For the analysis, we only need the year 2000 data

``` r
df <- df %>% 
    filter(year == 2000)

kable(df)
```

| state          | year |  price |
| :------------- | ---: | -----: |
| Alabama        | 2000 |  85100 |
| Alaska         | 2000 | 144200 |
| Arizona        | 2000 | 121300 |
| Arkansas       | 2000 |  72800 |
| California     | 2000 | 211500 |
| Colorado       | 2000 | 166600 |
| Connecticut    | 2000 | 166900 |
| Delaware       | 2000 | 130400 |
| Florida        | 2000 | 105500 |
| Georgia        | 2000 | 111200 |
| Hawaii         | 2000 | 272700 |
| Idaho          | 2000 | 106300 |
| Illinois       | 2000 | 130800 |
| Indiana        | 2000 |  94300 |
| Iowa           | 2000 |  82500 |
| Kansas         | 2000 |  83500 |
| Kentucky       | 2000 |  86700 |
| Louisiana      | 2000 |  85000 |
| Maine          | 2000 |  98700 |
| Maryland       | 2000 | 146000 |
| Massachusetts  | 2000 | 185700 |
| Michigan       | 2000 | 115600 |
| Minnesota      | 2000 | 122400 |
| Mississippi    | 2000 |  71400 |
| Missouri       | 2000 |  89900 |
| Montana        | 2000 |  99500 |
| Nebraska       | 2000 |  88000 |
| Nevada         | 2000 | 142000 |
| New Hampshire  | 2000 | 133300 |
| New Jersey     | 2000 | 170800 |
| New Mexico     | 2000 | 108100 |
| New York       | 2000 | 148700 |
| North Carolina | 2000 | 108300 |
| North Dakota   | 2000 |  74400 |
| Ohio           | 2000 | 103700 |
| Oklahoma       | 2000 |  70700 |
| Oregon         | 2000 | 152100 |
| Pennsylvania   | 2000 |  97000 |
| Rhode Island   | 2000 | 133000 |
| South Carolina | 2000 |  94900 |
| South Dakota   | 2000 |  79600 |
| Tennessee      | 2000 |  93000 |
| Texas          | 2000 |  82500 |
| Utah           | 2000 | 146100 |
| Vermont        | 2000 | 111500 |
| Virginia       | 2000 | 125400 |
| Washington     | 2000 | 168300 |
| West Virginia  | 2000 |  72800 |
| Wisconsin      | 2000 | 112200 |
| Wyoming        | 2000 |  96600 |

This data frame can be written to file

    write_csv(df, "data/house_price.csv")

or to an RDS data file,

    saveRDS(df, "data/house_price.rds")
