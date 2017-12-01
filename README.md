canpaginate
===========



[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/ropensci/canpaginate.svg?branch=master)](https://travis-ci.org/ropensci/canpaginate)

`canpaginate` helps you paginate with REST APIs

(p.s. named inspired from Ruby's [will_paginate](https://github.com/mislav/will_paginate/))

## install


```r
devtools::install_github("ropensci/canpaginate")
```


```r
library(canpaginate)
```

## Set pagination options

query parameters


```r
x <- can_paginate(
  by = "query_params",
  limit_param = "limit",
  offset_param = "offset",
  limit = 5000
)
x$by
#> [1] "query_params"
```

link headers


```r
x <- can_paginate(
  by = "link_headers",
  limit = 5000
)
x$limit
#> [1] 5000
```

## paginate

using options set via `cp_init`

(alternatively, set options in the call)


```r
x <- can_paginate(
  by = "query_params",
  limit_param = "limit",
  offset_param = "offset",
  limit = 600
)
library(crul)
cli <- crul::HttpClient$new(url = "http://api.gbif.org")
res <- x$paginate(cli$get("v1/occurrence/search"))
```

## Inspect results


```r
res
res$status()
res$content()
res$parse()
res$as_df()
```

## Verbose curl output


```r
x$paginate(cli$get("get"), verbose = TRUE)
```

## http library

Determined by what you pass in to `paginate`

- only `crul` package will be supported, maybe others later

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/canpaginate/issues).
* License: MIT
* Get citation information for `canpaginate` in R doing `citation(package = 'canpaginate')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.
