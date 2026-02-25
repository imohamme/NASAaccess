# Introduction

The *NASAaccess* package is a simple and needed tool for accessing and
processing remote sensing data. The *NASAaccess* package has multiple
functions that help the user to access and reformat hydrological data
for easy ingest into various hydrological models. Since the package
functions touch
[NASA](https://www.nasa.gov/ "The National Aeronautics and Space Administration")
data repositories to retrieve data, the user must set up a registration
account with [Earthdata](https://urs.earthdata.nasa.gov/users/new) as
well as authorizing [NASA GES
DISC](https://disc.gsfc.nasa.gov/information/documents?title=Data%20Access)
data access. The package user should make sure that his(her) local
machines has [curl](https://curl.se/) installed properly. Further
instructions on creating the “.netrc” and “.urs_cookies” files can be
accessed at [*How To Access Data NASA data With cURL And Wget wiki
page*](https://wiki.earthdata.nasa.gov/display/EL/How+To+Access+Data+With+cURL+And+Wget).
Creating the “.netrc” file at the user machine ‘Home’ directory and
storing the [NASA GES DISC](https://disc.gsfc.nasa.gov/) user logging
information in it is needed to execute the package commands.

Note: for Windows users the [NASA GES DISC](https://disc.gsfc.nasa.gov/)
logging information should be saved in a file named “\_netrc” beside the
“.netrc” one.

## Video Abstract

[Video abstract for “Technical note: NASAaccess – A tool for access,
reformatting, and visualization of remotely sensed earth observation and
climate data”](https://doi.org/10.5446/63008).

## Index

- [GPM](https://github.com/imohamme/NASAaccess/articles/GPM.md)
- [GLDAS](https://github.com/imohamme/NASAaccess/articles/GLDAS.md)
- [CMIP5
  Climate](https://github.com/imohamme/NASAaccess/articles/NEXGDDP.md)
- [CMIP6
  Climate](https://github.com/imohamme/NASAaccess/articles/NEXGDDP-CMIP6.md)

## Built with

``` r
sessionInfo()
#> R version 4.5.2 (2025-10-31)
#> Platform: aarch64-apple-darwin20
#> Running under: macOS Tahoe 26.3
#> 
#> Matrix products: default
#> BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
#> LAPACK: /Library/Frameworks/R.framework/Versions/4.5-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1
#> 
#> locale:
#> [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
#> 
#> time zone: Asia/Dubai
#> tzcode source: internal
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> loaded via a namespace (and not attached):
#>  [1] digest_0.6.39     desc_1.4.3        R6_2.6.1          fastmap_1.2.0    
#>  [5] xfun_0.56         cachem_1.1.0      knitr_1.51        htmltools_0.5.9  
#>  [9] rmarkdown_2.30    lifecycle_1.0.5   cli_3.6.5         sass_0.4.10      
#> [13] pkgdown_2.2.0     textshaping_1.0.4 jquerylib_0.1.4   systemfonts_1.3.1
#> [17] compiler_4.5.2    rstudioapi_0.18.0 tools_4.5.2       ragg_1.5.0       
#> [21] bslib_0.10.0      evaluate_1.0.5    yaml_2.3.12       otel_0.2.0       
#> [25] jsonlite_2.0.0    htmlwidgets_1.6.4 rlang_1.1.7       fs_1.6.6
```

## Reference

Mohammed, I.N., Bustamante, E.G.R., Bolten, J.D., Nelson, E.J., 2023.
Technical note: NASAaccess – a tool for access, reformatting, and
visualization of remotely sensed earth observation and climate data.
Hydrol. Earth Syst. Sci. 27, 3621-3642,
<https://doi.org/10.5194/hess-27-3621-2023>
