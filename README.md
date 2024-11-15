
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NASAaccess

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/175226662.svg)](https://zenodo.org/badge/latestdoi/175226662)[![Anaconda-Server
Badge](https://anaconda.org/conda-forge/r-nasaaccess/badges/version.svg)](https://anaconda.org/conda-forge/r-nasaaccess)
[![Anaconda-Server
Badge](https://anaconda.org/conda-forge/r-nasaaccess/badges/downloads.svg)](https://anaconda.org/conda-forge/r-nasaaccess)
[![Anaconda-Server
Badge](https://anaconda.org/conda-forge/r-nasaaccess/badges/platforms.svg)](https://anaconda.org/conda-forge/r-nasaaccess)
[![NASAaccess
readthedocs](https://img.shields.io/readthedocs/nasaaccess?style=social)](https://nasaaccess.readthedocs.io/en/latest/index.html)
[![NASAaccess](https://img.shields.io/github/stars/nasa/nasaaccess?style=social)](https://github.com/nasa/NASAaccess)

<!-- ![lifecycle](https://img.shields.io/badge/lifecycle-stable-sucess.svg?style=plastic&logo=appveyor)
<!-- ![GitHub Downloads](https://img.shields.io/github/downloads/nasa/NASAaccess/total?style=plastic)
&#10;<!-- badges: end -->

[*Ibrahim N.
Mohammed*](https://www.ku.ac.ae/college-people/ibrahim-mohammed/ "Ibrahim N. Mohammed")

## **What is NASAaccess?**

*NASAaccess* is a software application in the form of a
[R](https://www.r-project.org/about.html) package, a
[conda](https://docs.conda.io/en/latest/) package, and a
[Tethys](https://www.tethysplatform.org/) web application. *NASAaccess*
software can generate gridded ascii tables of climate
[CMIP5](https://pcmdi.llnl.gov/mips/cmip5/ "Coupled Model Intercomparison Project Phase 5"),
[CMIP6](https://pcmdi.llnl.gov/CMIP6/ "Coupled Model Intercomparison Project Phase 6"),
and earth observation remote sensing data
([GPM](https://gpm.nasa.gov/data/directory "Global Precipitation Measurement"),
[TRMM](https://gpm.nasa.gov/missions/trmm "Tropical Rainfall Measuring Mission"),
[GLDAS](https://ldas.gsfc.nasa.gov/gldas "Global Land Data Assimilation System"))
needed to drive various hydrological models (e.g.,
[SWAT](https://swat.tamu.edu/ "Soil & Water Assessment Tool"),
[VIC](https://github.com/UW-Hydro/VIC "Variable Infiltration Capacity"),
[RHESSys](https://github.com/RHESSys/RHESSys "The Regional Hydro-Ecological Simulation System"),
…etc.). The *NASAaccess* Tethys web-based application can be used for
accessing, reformatting, and visualizing climate and earth observation
remote sensing gridded time series data as well.

## **Where to find the NASAaccess software?**

- R package can be downloaded from GitHub at
  <https://github.com/imohamme/NASAaccess>.

- Conda package can be installed directly from *Anaconda* by searching
  for `r-nasaaccess`.

- Tethys web-based application can directly installed from GitHub at
  <https://github.com/imohamme/tethys_nasaaccess>.

## **How NASAaccess software is distributed?**

*NASAaccess* is an open-source software package under [NASA Open Source
Agreement v1.3](https://opensource.org/license/nasa1-3-php).

## **What is needed to install the NASAaccess software on my local machine?**

### **R Library**

On a local machine the user should have installed the following programs
as well as setting up a user account. The list below gives a summary of
what is needed to be done prior to work with NASAaccess software on any
local machine:

- [Installing R software](https://www.r-project.org/)

- [Installing Rstudio software](https://posit.co/) (OPTIONAL)

- *NASAaccess* R package needs a user registration access with
  [Earthdata](https://www.earthdata.nasa.gov/). Users should set up a
  registration account(s) with
  [Earthdata](https://www.earthdata.nasa.gov/) login as well as well as
  authorizing
  [NASA](https://www.nasa.gov/ "The National Aeronautics and Space Administration")
  [GES DISC](https://disc.gsfc.nasa.gov/) data access. Please refer to
  <https://disc.gsfc.nasa.gov/information/documents> Data Access section
  for further details.

- [*curl*](https://curl.se/) software . Since Mac users have
  [*curl*](https://curl.se/) as part of macOS build, Windows users
  should make sure that their local machines build have
  [*curl*](https://curl.se/) installed properly.

  - Checking if you can run [*curl*](https://curl.se/) from your command
    prompt. Type `curl --help` and you should see the help pages for the
    [*curl*](https://curl.se/) program once everything is defined
    correctly.

- Within Rstudio or R terminal run the following commands to install
  *NASAaccess*:

  - `library(devtools)`

  - `install_github("imohamme/NASAaccess", build_vignettes = TRUE)`

  - `library(NASAaccess)`

Within the Rstudio help tab the user can verify that the package has
been installed and browse the help pages of the various functions of
*NASAaccess*. The [GES DISC](https://disc.gsfc.nasa.gov/) user
registration access logging information will be processed by masking
(i.e., not displaying the lieteral typed text as input) on most but not
all platforms. Without providing [GES DISC](https://disc.gsfc.nasa.gov/)
user registration access logging information, the user will receive
‘*You need to provide your Earthdata GES DISC login to proceed…*’
message.

### **Conda Package**

- *NASAaccess* conda package needs a user registration access with
  [Earthdata](https://www.earthdata.nasa.gov/). Users should set up a
  registration account(s) with
  [Earthdata](https://www.earthdata.nasa.gov/) login as well as well as
  authorizing
  [NASA](https://www.nasa.gov/ "The National Aeronautics and Space Administration")
  [GES DISC](https://disc.gsfc.nasa.gov/) data access. Please refer to
  <https://disc.gsfc.nasa.gov/information/documents> Data Access section
  for further details.

  - Creating the *.netrc* file at the user machine *Home* directory and
    storing the user
    [NASA](https://www.nasa.gov/ "The National Aeronautics and Space Administration")
    [GES DISC](https://disc.gsfc.nasa.gov/) logging information in it is
    done automatically to execute the *NASAaccess* package commands.
    Accessing data from NASA servers is further explained at
    [Here](https://urs.earthdata.nasa.gov/documentation/for_users/data_access/curl_and_wget).
    The [GES DISC](https://disc.gsfc.nasa.gov/) user registration access
    logging information will be processed by masking in the terminal on
    any major OS. Without providing [GES
    DISC](https://disc.gsfc.nasa.gov/) user registration access logging
    information, the user will receive ‘*You need to provide your
    Earthdata GES DISC login to proceed…*’ message.

- To install *NASAaccess* package in a conda environment run the
  following:

``` python
conda install -c conda-forge r-nasaaccess
```

### **Tethys web-based Application**

Full details on installing the web-based application of *NASAaccess* on
single machines and local servers can be found at
[readthedocs](https://nasaaccess.readthedocs.io/en/latest/nasaaccess_tethys.html).

## **Is there a walk through examples for NASAaccess software?**

Software users are encouraged to visit
(<https://imohamme.github.io/NASAaccess/>) to learn more on *NASAaccess*
functionality and capabilities.

## **How to cite NASAaccess Platform?**

### **R Package**

``` r
citation(package = 'NASAaccess')
#> To cite package 'NASAaccess' in publications use:
#> 
#>   Mohammed I (2024). _NASAaccess: Downloading and Reformatting Tool for
#>   NASA Earth Observation Data Products_. R package version 4.1.0,
#>   <https://github.com/imohamme/NASAaccess>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {{NASAaccess}: Downloading and Reformatting Tool for NASA Earth Observation Data Products},
#>     author = {Ibrahim Mohammed},
#>     year = {2024},
#>     institution = {Khalifa University, Civil and Environmental Engineering},
#>     address = {P. O. Box 127788, Abu Dhabi, UAE},
#>     note = {R package version 4.1.0},
#>     url = {https://github.com/imohamme/NASAaccess},
#>   }
```

### **Reference**

Mohammed, I.N., Bustamante, E.G.R., Bolten, J.D., Nelson, E.J., 2023.
Technical note: NASAaccess – a tool for access, reformatting, and
visualization of remotely sensed earth observation and climate data.
Hydrol. Earth Syst. Sci. 27, 3621-3642,
<https://doi.org/10.5194/hess-27-3621-2023>
