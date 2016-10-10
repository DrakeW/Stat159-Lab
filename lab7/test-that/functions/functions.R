range_value <- function(x, na.rm=FALSE) {
  max(x, na.rm=na.rm) - min(x, na.rm=na.rm)
}

missing_values <- function(x) {
  sum(is.na(x))
}
