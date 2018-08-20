Sturge Method - Equal Intervals
================
Ravindra Reddy Tamma
29 July 2018

STURGE FORMULA (or) METHOD : It is used to divide the raw data given in the form of a vector in to class intervals of equal widths. The Method Implemented in R can directly identify the suitable number of Class Intervals and also allocate appropriate width for each class.

No.of Classes is defined using: k = log(n,base = 2) \# K = No.of Classes and n = length of the vector

Width of each interval is defined using: w = (High + Low)/k \# High = Maximum Value and Low = Minimum value

``` r
# STRUGE Formula to make equal intervals for Data.

sturge <- function(vect,bins = 0)
{
  if(class(vect) == "character")
    return(transform(table(vect)))
  n <- length(vect)
  if(n == 1)return(table(vect))
  low <- round(min(vect,na.rm = TRUE))
  high <- round(max(vect,na.rm = TRUE))
  k <- round(log2(n))
  if(bins != 0){
    width <- round((high - low)/(bins-1))
  }else{
    width <- round((high - low)/k)
  }
  if(width > 0)
  {
    bins <- seq(low,high+width,width)
  }
  else
  {
    stop("Width of Interval is not Correct or NA values in DataSet")
  }
  interval <- cut(vect,bins,dig.lab = 5)
  freq.table <- transform(table(interval))
  print(freq.table)
}
```

``` r
sturge(rnorm(50,20,20))
```

    ##   interval Freq
    ## 1  (-14,1]    7
    ## 2   (1,16]   16
    ## 3  (16,31]   14
    ## 4  (31,46]    8
    ## 5  (46,61]    3
    ## 6  (61,76]    2

``` r
sturge(c(rep("A",10),rep("B",20),rep("C",15)))
```

    ##   vect Freq
    ## 1    A   10
    ## 2    B   20
    ## 3    C   15

``` r
vect <- c(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length,iris$Petal.Width)
sturge(vect)
```

    ##   interval Freq
    ## 1    (0,1]   58
    ## 2    (1,2]  120
    ## 3    (2,3]  106
    ## 4    (3,4]   79
    ## 5    (4,5]   77
    ## 6    (5,6]   90
    ## 7    (6,7]   58
    ## 8    (7,8]   12
    ## 9    (8,9]    0
