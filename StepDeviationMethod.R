#Step Deviation Method to find the Mean.

stepdev.mean <- function(vect)
{
  n <- length(vect)
  k <- round(log2(n))
  low <- min(vect,na.rm = TRUE)
  high <- max(vect,na.rm = TRUE)
  width <- round((high - low)/k)
  bins <- seq(low,high,width)
  interval <- cut(vect,bins)
  tab <- transform(table(interval))
  names(tab) <- c("Interval","Frequency")
  interval.char <- strsplit(as.character(tab$Interval),split = "[(,]")
  low.limit <- as.numeric(unlist(lapply(interval.char,function(x){return(x[2])})))
  mid <- ((low.limit + width) + (low.limit))/2
  tab <- cbind(tab,MidValue = mid)
  arbitrary <- tab$MidValue[floor(length(tab$MidValue)/2)]
  dev <- (tab$MidValue - arbitrary)/nrow(tab)
  tab <- cbind(tab,Dev = round(dev,2))
  tab <- cbind(tab,FreqDev = tab$Frequency*tab$Dev)
  mean <- arbitrary + ((sum(tab$FreqDev)/sum(tab$Frequency))*5)
  print(tab) 
  cat("\nMean Using Step Deviation = ",mean)
}

df <- datasets::airquality
stepdev.mean(df$Wind)
stepdev.mean(df$Ozone)
stepdev.mean(df$Solar.R)
stepdev.mean(df$Temp)
stepdev.mean(df$Month)
stepdev.mean(df$Day)


