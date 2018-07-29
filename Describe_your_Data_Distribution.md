Describe your Data Distrbution
================
Ravindra Reddy Tamma
29 July 2018

Describing your Data Distribution
---------------------------------

Distribution of Data can be best described using 2 Parameters namely Central Tendency & Spread
Central Tendency : It tries to identify the most suitable central point of Distribution
Spread or Dispersion : How is data spread across different data points.

To Describe the Data Accurately we should know the distribution of data correctly.
If the data follows Normal Distribution - Mean and Standard Deviation will be used.
If the data does not follows Normal Distribution - Median and IQR will be used.

Testing for Normality of the Distribution
-----------------------------------------

Shapiro - Wilk Test
-------------------

Steps Involved in Shapiro - Wilk Test

Step - 1
Null Hypothesis : The Sample (x1,x2,x3,x4,... xn) came from a normally distributed population
Alternate Hypothesis :The Sample (x1,x2, x3,x4,... xn) does not follow normal distribution.

Step - 2
Alpha = 0.05

Step - 3
Test Statistic: W = \[sum(ai \* x(i))^2\]/\[sum(x - mean(x))^2\]
ai = Constants that can be got from the below link based on n-value
x(i) = ith smallest number in the sample
Link for shapiro - wilk tables : <http://www.real-statistics.com/statistics-tables/shapiro-wilk-table/>

``` r
suppressPackageStartupMessages(library(dplyr))
```

    ## Warning: package 'dplyr' was built under R version 3.4.3

``` r
suppressPackageStartupMessages(library(ggpubr))
```

    ## Warning: package 'ggpubr' was built under R version 3.4.4

    ## Warning: package 'ggplot2' was built under R version 3.4.3

    ## Warning: package 'magrittr' was built under R version 3.4.3

``` r
suppressPackageStartupMessages(library(readr))
```

    ## Warning: package 'readr' was built under R version 3.4.3

``` r
desc_data_distrib <- function(vect)
{
  options(scipen = 999)
  p.val <- unlist(shapiro.test(vect)[2])
  alpha <- 0.05
  cat("Shapiro - Wilk Test : \n")
  cat("P-Value : ",p.val,"\nAlpha-Value : ",alpha,"\n\n")
  if(p.val > alpha)
  {
    cat("Data follows Normal Distribution\n")
    cat("Descriptions for Distribution of Data is :\nMean :",mean(vect,na.rm = T),"\nStandard Deviation   :",sd(vect,na.rm = T))
  }else
  {
    cat("Data donot follow Normal Distribution\n")
    cat("Descriptions for Distribution of Data is :\nMedian :",median(vect,na.rm = T),"\nInter Quartile Range :",IQR(vect,na.rm = T))
  }
}
```

Using a Vector of Data for Normality Test
-----------------------------------------

``` r
vect <- c(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length,iris$Petal.Width)
desc_data_distrib(vect)
```

    ## Shapiro - Wilk Test : 
    ## P-Value :  0.00000000004950775 
    ## Alpha-Value :  0.05 
    ## 
    ## Data donot follow Normal Distribution
    ## Descriptions for Distribution of Data is :
    ## Median : 3.2 
    ## Inter Quartile Range : 3.4

Using a Uniform Distribution for Normality Test
-----------------------------------------------

``` r
vect <- runif(50,0,40)
desc_data_distrib(vect)
```

    ## Shapiro - Wilk Test : 
    ## P-Value :  0.0395623 
    ## Alpha-Value :  0.05 
    ## 
    ## Data donot follow Normal Distribution
    ## Descriptions for Distribution of Data is :
    ## Median : 17.88038 
    ## Inter Quartile Range : 14.2712

Using a Normal Distribution for Normality Test
----------------------------------------------

``` r
vect <- rnorm(50,30,5)
desc_data_distrib(vect)
```

    ## Shapiro - Wilk Test : 
    ## P-Value :  0.893292 
    ## Alpha-Value :  0.05 
    ## 
    ## Data follows Normal Distribution
    ## Descriptions for Distribution of Data is :
    ## Mean : 30.10547 
    ## Standard Deviation   : 5.641097

Visual Tests for Normality
--------------------------

``` r
ggdensity(vect, 
          main = "Density plot of Distribution",
          xlab = "Values")
```

![](Describe_your_Data_Distribution_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
ggqqplot(vect)
```

![](Describe_your_Data_Distribution_files/figure-markdown_github/unnamed-chunk-6-1.png)
