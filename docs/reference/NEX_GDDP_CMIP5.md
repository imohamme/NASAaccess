# CMIP5 climate data from NASA NEX-GDDP

This function downloads climate change data of rainfall and air
temperature from NASA Earth Exchange Global Daily Downscaled Projections
NEX-GDDP GSFC servers, extracts data from grids within a specified
watershed shapefile, and then generates tables in a format that any
hydrological model requires for rainfall or air temperature data input.
The function also generates the climate stations file input (file with
columns: ID, File NAME, LAT, LONG, and ELEVATION) for those selected
climatological grids that fall within the specified watershed. The NASA
Earth Exchange Global Daily Downscaled Projections NEX-GDDP dataset is
comprised of downscaled climate scenarios for the globe that are derived
from the General Circulation Model GCM runs conducted under the Coupled
Model Intercomparison Project Phase 5 CMIP5 and across two of the four
greenhouse gas emissions scenarios known as Representative Concentration
Pathways RCPs (rcp45, rcp85).

## Usage

``` r
NEX_GDDP_CMIP5(
  Dir = "./INPUT/",
  watershed = "LowerMekong.shp",
  DEM = "LowerMekong_dem.tif",
  start = "2060-12-1",
  end = "2060-12-3",
  model = "IPSL-CM5A-MR",
  type = "pr",
  slice = "rcp85"
)
```

## Arguments

- Dir:

  A directory name to store gridded climate data and stations files.

- watershed:

  A study watershed shapefile spatially describing polygon(s) in a
  geographic projection crs ='+proj=longlat +ellps=WGS84 +datum=WGS84
  +no_defs'.

- DEM:

  A study watershed digital elevation model raster in a geographic
  projection crs ='+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'.

- start:

  Beginning date for gridded climate data.

- end:

  Ending date for gridded climate data.

- model:

  A climate modeling center and name from the World Climate Research
  Programme WCRP global climate projections through the Coupled Model
  Intercomparison Project 5 CMIP5 (e.g., IPSL-CM5A-MR which is Institut
  Pierre-Simon Laplace CM5A-MR model).

- type:

  A flux data type. It's value can be 'pr' for precipitation or 'tas'
  for air temperature.

- slice:

  A scenario from the Representative Concentration Pathways. It's value
  can be 'rcp45' , 'rcp85', or 'historical'.

## Value

A table that includes points ID, Point file name, Lat, Long, and
Elevation information, and a scalar of climate change gridded data
values at each point within the study watershed in ascii format stored
at `Dir`.

## Details

A user should visit <https://disc.gsfc.nasa.gov/information/documents>
Data Access document to register with the Earth Observing System Data
and Information System (NASA Earthdata) and then authorize NASA GESDISC
Data Access to successfully work with this function. The function
accesses NASA Goddard Space Flight Center server for IMERG remote
sensing data products at
(<https://gpm1.gesdisc.eosdis.nasa.gov/data/GPM_L3/GPM_3IMERGDF.07/>),
and NASA Goddard Space Flight Center server for NEX-GDDP climate change
data products at
(<https://www.nccs.nasa.gov/services/climate-data-services>). The
function uses variable name ('pr') for rainfall in NEX-GDDP data
products and variable name ('tas') for NEX-GDDP minimum ('tasmin') and
maximum ('tasmax') air temperature data products. The `NEX-GDDP`
function outputs gridded rainfall data in 'mm' and gridded air
temperature (maximum and minimum) data in degrees 'C'.

NEX-GDDP dataset is comprised of downscaled climate scenarios for the
globe that are derived from the General Circulation Model GCM runs
conducted under the Coupled Model Intercomparison Project Phase 5 CMIP5
(Taylor et al. 2012) and across two of the four greenhouse gas emissions
scenarios known as Representative Concentration Pathways RCPs
(Meinshausen et al. 2011). The CMIP5 GCM runs were developed in support
of the Fifth Assessment Report of the Intergovernmental Panel on Climate
Change IPCC AR5. This dataset includes downscaled projections from the
21 models and scenarios for which daily scenarios were produced and
distributed under CMIP5. The Bias-Correction Spatial Disaggregation BCSD
method used in generating the NEX-GDDP dataset is a statistical
downscaling algorithm specifically developed to address the current
limitations of the global GCM outputs (Wood et al. 2002; Wood et al.
2004; Maurer et al. 2008; Thrasher et al. 2012). The NEX-GDDP climate
projections is downscaled at a spatial resolution of 0.25 degrees x 0.25
degrees (approximately 25 km x 25 km). The `NEX_GDDP_CMIP5` downscales
the NEX-GDDP data to grid points of 0.1 degrees x 0.1 degrees following
nearest point methods described by Mohammed et al. (2018).

The `NEX_GDDP_CMIP5` function relies on 'curl and 'netcdf' tools to
transfer data from NASA servers to a user machine, using HTTPS supported
protocol. The 'curl' command embedded in this function to fetch
precipitation/air temperature GPM IMERG/ netcdf annual global files is
designed to work seamlessly by appending appropriate logging information
to the ".netrc" file and the cookies file ".urs_cookies". The ".netrc"
and ".urs_cookies" files need to be stored at local directory before
running any function in this package. The 'nc_open' command embedded in
this function to fetch precipitation/air temperature NEX-GDDP/ netcdf
daily global files is designed to work seamlessly by appending
appropriate logging information and access dataset through OPeNDAP using
the DAP2 protocol <https://www.opendap.org/>. The accessed netcdf file
will be cached to a temporary location within a user machine. The
".netrc" and ".urs_cookies" files need to be stored at local directory
before running any function in this package. Instructions on creating
the ".netrc" and ".urs_cookies" files can be accessed at
<https://urs.earthdata.nasa.gov/documentation/for_users/data_access/curl_and_wget>.
It is imperative to say here that a user machine should have 'curl'
installed as a prerequisite to run `NEX_GDDP_CMIP5` or any other
function part of the this package (NASAaccess).

## Note

`start` should be equal to or greater than 2006-Jan-01 for 'rcp45' or
'rcp85' RCP climate scenario.

`start` should be equal to or greater than 1950-Jan-01 and `end` should
be equal to or less than 2005-Dec-31 for the 'historical' GCM
retrospective climate data.

## References

Maurer, E. P. and Hidalgo, H. G., 2008: Utility of daily vs. monthly
large-scale climate data: an intercomparison of two statistical
downscaling methods. Hydrology and Earth System Sciences, 12, 551-563,
doi:10.5194/hess-12-551-2008.

Meinshausen, M. S.J. Smith, K. Calvin, J.S. Daniel, M.L.T. Kainuma, and
et al., 2011: The RCP greenhouse gas concentrations and their extensions
from 1765 to 2300. Climatic Change, 109, 213-241,
doi:10.1007/s10584-011-0156-z.

Mohammed, I.N., J. Bolten, R. Srinivasan, and V. Lakshmi, 2018: Improved
Hydrological Decision Support System for the Lower Mekong River Basin
Using Satellite-Based Earth Observations. Remote Sensing, 10, 885,
doi:10.3390/rs10060885.

Taylor, Karl E., Ronald J. Stouffer, Gerald A. Meehl, 2012: An Overview
of CMIP5 and the Experiment Design. Bull. Amer. Meteor. Soc., 93,
485–498, doi:10.1175/BAMS-D-11-00094.1.

Thrasher, B., Maurer, E. P., McKellar, C., & Duffy, P. B., 2012:
Technical Note: Bias correcting climate model simulated daily
temperature extremes with quantile mapping. Hydrology and Earth System
Sciences, 16(9), 3309-3314, doi:10.5194/hess-16-3309-2012

Wood, A.W., E.P. Maurer, A. Kumar, and D.P. Lettenmaier, 2002:
Long-range experimental hydrologic forecasting for the eastern United
States. J. Geophysical Research-Atmospheres, 107, 4429,
doi:10.1029/2001JD000659.

Wood, A.W., L.R. Leung, V. Sridhar, and D.P. Lettenmaier, 2004:
Hydrologic implications of dynamical and statistical approaches to
downscaling climate model outputs. Climatic Change, 15,189-216, doi:
10.1023/B:CLIM.0000013685.99609.9e

## Author

Ibrahim Mohammed, <ibrahim.mohammed@ku.ac.ae>

## Examples

``` r
#Lower Mekong basin example
if (FALSE) NEX_GDDP_CMIP5(Dir = "./INPUT/", watershed = "LowerMekong.shp",
DEM = "LowerMekong_dem.tif", start = "2060-12-1", end = "2060-12-3",
model = 'IPSL-CM5A-MR', type = 'pr', slice = 'rcp85') # \dontrun{}
```
