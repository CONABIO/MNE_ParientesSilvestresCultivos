splist2presabs <-
function(data, sites.col, sp.col, keep.n = FALSE) {
  stopifnot(
    length(sites.col) == 1,
    length(sp.col) == 1,
    sites.col != sp.col,
    sites.col %in% 1 : ncol(data) | sites.col %in% names(data),
    sp.col %in% 1 : ncol(data) | sp.col %in% names(data),
    is.logical(keep.n)
  )
  presabs <- table(data[ , c(sites.col, sp.col)])
  presabs <- as.data.frame(unclass(presabs))
  if (!keep.n)  presabs[presabs > 1] <- 1
  presabs <- data.frame(row.names(presabs), presabs)
  names(presabs)[1] <- names(subset(data, select = sites.col))
  rownames(presabs) <- NULL
  return(presabs)
}
