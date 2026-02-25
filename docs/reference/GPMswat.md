# SWAT rainfall data from NASA GPM

This function downloads rainfall remote sensing data of TRMM and IMERG
from NASA GSFC servers, extracts data from grids within a specified
watershed shapefile, and then generates tables in a format that SWAT
requires for rainfall data input. The function also generates the
rainfall stations file input (file with columns: ID, File NAME, LAT,
LONG, and ELEVATION) for those selected grids that fall within the
specified watershed.

## Usage

``` r
GPMswat(
  Dir = "./SWAT_INPUT/",
  watershed = "LowerMekong.shp",
  DEM = "LowerMekong_dem.tif",
  start = "2015-12-1",
  end = "2015-12-3"
)
```

## Arguments

- Dir:

  A directory name to store gridded rainfall and rain stations files.

- watershed:

  A study watershed shapefile spatially describing polygon(s) in a
  geographic projection crs='+proj=longlat +datum=WGS84'.

- DEM:

  A study watershed digital elevation model raster in a geographic
  projection crs='+proj=longlat +datum=WGS84'.

- start:

  Beginning date for gridded rainfall data.

- end:

  Ending date for gridded rainfall data.

## Value

A table that includes points ID, Point file name, Lat, Long, and
Elevation information formatted to be read with SWAT, and a scalar of
rainfall gridded data values at each point within the study watershed in
ascii format needed by SWAT model weather inputs will be stored at
`Dir`.

## Details

A user should visit <https://disc.gsfc.nasa.gov/information/documents>
Data Access document to register with the Earth Observing System Data
and Information System (NASA Earthdata) and then authorize NASA GESDISC
Data Access to successfully work with this function. The function
accesses NASA Goddard Space Flight Center server address for IMERG
remote sensing data products at
(<https://gpm1.gesdisc.eosdis.nasa.gov/data/GPM_L3/GPM_3IMERGDF.07/>),
and NASA Goddard Space Flight Center server address for TRMM remote
sensing data products
(<https://disc2.gesdisc.eosdis.nasa.gov/data/TRMM_RT/TRMM_3B42RT_Daily.7/>).
The function uses variable name ('precipitation') for rainfall in IMERG
data products and variable name ('precipitation') for TRMM rainfall data
products. Units for gridded rainfall data are 'mm'.

IMERG dataset is the GPM Level 3 IMERG \*Final\* Daily 0.1 x 0.1 deg
(GPM_3IMERGDF) derived from the half-hourly GPM_3IMERGHH. The derived
result represents the final estimate of the daily accumulated
precipitation. The dataset is produced at the NASA Goddard Earth
Sciences (GES) Data and Information Services Center (DISC) by simply
summing the valid precipitation retrievals for the day in GPM_3IMERGHH
and giving the result in (mm) <https://gpm.nasa.gov/data/directory>.

TRMM dataset is a daily 0.25 x 0.25 deg accumulated precipitation
product that is generated from the Near Real-Time 3-hourly TMPA
(3B42RT). It is produced at the NASA GES DISC, as a value added product.
Simple summation of valid retrievals in a grid cell is applied for the
data day. The result is given in (mm)
<https://gpm.nasa.gov/data/directory>.

Since IMERG data products are only available from 2000-June-1 to
present, then this function uses TRMM data products for time periods
earlier than 2000-June-1. Keep in mind that TRMM data products that are
compatible with IMERG data products are only available from
2000-March-01. The function outputs table and gridded data files that
match grid points resolution of IMERG data products (i.e., resolution of
0.1 deg). Since TRMM and IMERG data products do not have a similar
spatial resolution (i.e., 0.25 and 0.1 deg respectively), the function
assigns the nearest TRMM grid point to any missing IMERG data point as
an approximate (i.e. during 2000-March-01 to 2014-March-11 time period).

The `GPMswat` function relies on 'curl' tool to transfer data from NASA
servers to a user machine, using HTTPS supported protocol. The 'curl'
command embedded in this function to fetch precipitation IMERG/TRMM
netcdf daily global files is designed to work seamlessly given that
appropriate logging information are stored in the ".netrc" file and the
cookies file ".urs_cookies" as explained in registering with the Earth
Observing System Data and Information System. It is imperative to say
here that a user machine should have 'curl' installed as a prerequisite
to run `GPMswat`.

## Note

`start` should be equal to or greater than 2000-Mar-01.

## Author

Ibrahim Mohammed, <ibrahim.mohammed@ku.ac.ae>

## Examples

``` r
#Lower Mekong basin example
if (FALSE) GPMswat(Dir = "./SWAT_INPUT/", watershed = "LowerMekong.shp",
DEM = "LowerMekong_dem.tif", start = "2015-12-1", end = "2015-12-3") # \dontrun{}
```
