# Getting started with NEXGDDP-CMIP5 data

*NASAaccess* has a handy tool to access, extract, and reformat climate
change data of rainfall and air temperature from [NASA Earth Exchange
Global Daily Downscaled Projections NEX-GDDP GSFC
servers](https://www.nccs.nasa.gov/services/climate-data-services) for
grids within a specified watershed.

[NEX-GDDP](https://www.nccs.nasa.gov/services/climate-data-services)
dataset is comprised of downscaled climate scenarios for the globe that
are derived from the General Circulation Model GCM runs conducted under
the Coupled Model Intercomparison Project Phase 5 CMIP5 (Taylor,
Stouffer, and Meehl 2012) and across two (RCP45 & RCP85) of the four
greenhouse gas emissions scenarios known as Representative Concentration
Pathways RCPs (Meinshausen et al. 2011). The CMIP5 GCM runs were
developed in support of the Fifth Assessment Report of the
Intergovernmental Panel on Climate Change IPCC AR5. This dataset
includes downscaled projections from the 21 models and scenarios for
which daily scenarios were produced and distributed under CMIP5.

The Bias-Correction Spatial Disaggregation BCSD method used in
generating the [NEX-GDDP
dataset](https://www.nccs.nasa.gov/services/climate-data-services) is a
statistical downscaling algorithm specifically developed to address the
current limitations of the global GCM outputs (Andrew W. Wood et al.
2002; A. W. Wood et al. 2004; Maurer and Hidalgo 2008; Thrasher et al.
2012). The NEX-GDDP climate projections is downscaled at a spatial
resolution of 0.25 degrees x 0.25 degrees (approximately 25 km x 25 km).
The NEX_GDDP_CMIP5 downscales the NEX-GDDP data to grid points of 0.1
degrees x 0.1 degrees following nearest point methods described by
Mohammed et al. (2018).

## Basic use

Let’s use the example watersheds that we introduced with `GPMswat` and
`GPMpolyCentroid`. Please visit *NASAaccess*
[GPM](https://github.com/imohamme/NASAaccess/articles/GPM.md) functions
for more information.

``` r
#Reading input data
dem_path <- system.file("extdata",
                        "DEM_TX.tif", 
                         package = "NASAaccess")

shape_path <- system.file("extdata", 
                          "basin.shp", 
                           package = "NASAaccess")


library(NASAaccess)

NEX_GDDP_CMIP5(Dir = "./NEX_GDDP_CMIP5/", 
              watershed = shape_path,
              DEM = dem_path, 
              start = "2060-12-1", 
              end = "2060-12-3",
              model = 'IPSL-CM5A-MR', 
              type = 'pr', 
              slice = 'rcp85')
```

Let’s examine the precipitation station file

``` r
NEX_GDDP.precipitationMaster <- system.file('extdata/NEX_GDDP_CMIP5',
                                         'prGrid_Master.txt', 
                                         package = 'NASAaccess')

NEX_GDDP_CMIP5.table<-read.csv(NEX_GDDP.precipitationMaster)

head(NEX_GDDP_CMIP5.table)
#>        ID             NAME      LAT      LONG ELEVATION
#> 1 2160842 prclimate2160842 29.93337 -95.82337  50.16166
#> 2 2160843 prclimate2160843 29.93337 -95.72340  46.68206
#> 3 2160844 prclimate2160844 29.93337 -95.62343  39.72196
#> 4 2160845 prclimate2160845 29.93337 -95.52346  35.58193
#> 5 2164442 prclimate2164442 29.83343 -95.82337  48.02116
#> 6 2164443 prclimate2164443 29.83343 -95.72340  40.47534

dim(NEX_GDDP_CMIP5.table)
#> [1] 11  5
```

Here we processed precipitation data from [Institut Pierre Simon Laplace
Model CM5A-MR](https://www.ipsl.fr/en/home-en/) under the Representative
Concentration Pathways (RCP85) for our example watershed during the
December 2060 (1st to 3rd).

Changing `type` parameter in the `NEX_GDDP_CMIP5` function from `pr` to
`tas` gives us minimum and maximum air temperatures.

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

## References

Maurer, E. P., and H. G. Hidalgo. 2008. “Utility of Daily Vs. Monthly
Large-Scale Climate Data: An Intercomparison of Two Statistical
Downscaling Methods.” Journal Article. *Hydrology and Earth System
Sciences* 12 (2): 551–63. <https://doi.org/10.5194/hess-12-551-2008>.

Meinshausen, Malte, S. J. Smith, K. Calvin, J. S. Daniel, M. L. T.
Kainuma, J-F. Lamarque, K. Matsumoto, et al. 2011. “The RCP Greenhouse
Gas Concentrations and Their Extensions from 1765 to 2300.” Journal
Article. *Climatic Change* 109 (1): 213.
<https://doi.org/10.1007/s10584-011-0156-z>.

Mohammed, Ibrahim Nourein, John Bolten, Raghavan Srinivasan, and Venkat
Lakshmi. 2018. “Improved Hydrological Decision Support System for the
Lower Mekong River Basin Using Satellite-Based Earth Observations.”
Journal Article. *Remote Sensing* 10 (6): 885.
<https://doi.org/10.3390/rs10060885>.

Taylor, Karl E., Ronald J. Stouffer, and Gerald A. Meehl. 2012. “An
Overview of CMIP5 and the Experiment Design.” Journal Article. *Bulletin
of the American Meteorological Society* 93 (4): 485–98.
<https://doi.org/10.1175/BAMS-D-11-00094.1>.

Thrasher, B., E. P. Maurer, C. McKellar, and P. B. Duffy. 2012.
“Technical Note: Bias Correcting Climate Model Simulated Daily
Temperature Extremes with Quantile Mapping.” Journal Article. *Hydrology
and Earth System Sciences* 16 (9): 3309–14.
<https://doi.org/10.5194/hess-16-3309-2012>.

Wood, A. W., L. R. Leung, V. Sridhar, and D. P. Lettenmaier. 2004.
“Hydrologic Implications of Dynamical and Statistical Approaches to
Downscaling Climate Model Outputs.” Journal Article. *Climatic Change*
62 (1): 189–216. <https://doi.org/10.1023/B:CLIM.0000013685.99609.9e>.

Wood, Andrew W., Edwin P. Maurer, Arun Kumar, and Dennis P. Lettenmaier.
2002. “Long-Range Experimental Hydrologic Forecasting for the Eastern
United States.” Journal Article. *Journal of Geophysical Research:
Atmospheres* 107 (D20): 4429.
