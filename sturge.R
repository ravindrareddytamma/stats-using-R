# STRUGE Formula to make equal intervals for Data.

sturge <- function(vect,type = "excl")
{
  if(class(vect) == "character")
    return(transform(table(vect)))
  if(!type %in% c("incl","excl"))
    stop("Invalid type of Interval Given!")
  n <- length(vect)
  if(n == 1)return(table(vect))
  low <- round(min(vect,na.rm = TRUE))
  high <- round(max(vect,na.rm = TRUE))
  k <- round(log2(n))
  width <- round((high - low)/k)
  if(width > 0)
  {
    bins <- seq(low,high+width,width)
  }
  else
  {
    stop("Width of Interval is not Correct or NA values in DataSet")
  }
  if(type == "incl")
  interval <- cut(vect,bins,dig.lab = 5,right = F)
  if(type == "excl")
  interval <- cut(vect,bins,dig.lab = 5)
  freq.table <- transform(table(interval))
  return(freq.table)
}

