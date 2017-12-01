#' Paginator client
#'
#' @export
#' @details
#' **Methods**
#'   \describe{
#'     \item{`get(path, query, disk, stream, ...)`}{
#'       Make a GET request
#'     }
#'   }
#'
#' @format NULL
#' @usage NULL
#' @details Possible parameters (not all are allowed in each HTTP verb):
#' \itemize{
#'  \item path - URL path, appended to the base URL
#'  \item query - query terms, as a list
#'  \item body - body as an R list
#'  \item encode - one of form, multipart, json, or raw
#' }
#'
#' @examples
#' (x <- can_paginate(
#'   by = "query_params",
#'   limit_param = "limit",
#'   offset_param = "offset",
#'   limit = 5000))
can_paginate <- function(by = "query_params", limit_param = "limit",
  offset_param = "offset", limit = 5000) {

  CanPaginate$new(by = by, limit_param = limit_param, 
    offset_param = offset_param, limit = limit)
}

CanPaginate <- R6::R6Class(
  'CanPaginate',
  public = list(
    by = NULL,
    limit_param = NULL,
    offset_param = NULL,
    limit = NULL,

    print = function(x, ...) {
      cat("<can paginate> ", sep = "\n")
      cat(paste0("  by: ", self$by), sep = "\n")
      cat(paste0("  limit_param: ", self$limit_param), sep = "\n")
      cat(paste0("  offset_param: ", self$offset_param), sep = "\n")
      cat(paste0("  limit: ", self$limit), sep = "\n")
      invisible(self)
    },

    initialize = function(by, limit_param, offset_param, limit) {
      if (!missing(by)) self$by <- by
      if (!missing(limit_param)) self$limit_param <- limit_param
      if (!missing(offset_param)) self$offset_param <- offset_param
      if (!missing(limit)) self$limit <- limit
    }
  )
)
