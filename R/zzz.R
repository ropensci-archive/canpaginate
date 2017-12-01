pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

pluck_names <- function(x, y) {
  strtrim(strxt(x, paste0(names(y), collapse = "|"))[[1]])
}

strxt <- function(string, pattern) {
  regmatches(string, gregexpr(pattern, string))
}

strtrim <- function(str) gsub("^\\s+|\\s+$", "", str)

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
