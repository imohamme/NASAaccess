==================================
NASAaccess Tethys Guide
==================================


.. image:: images/nasaaccess.png
   :scale: 20%
   :align: center



About
*****

The **NASAaccess** platform is available as software packages (i.e., R and conda packages) as well as an interactive format web-based environmental modeling application for earth observation data developed in the Tethys Platform framework (https://www.tethysplatform.org/). **NASAaccess** software can generate gridded ascii tables of climate `CMIP5 <https://pcmdi.llnl.gov/mips/cmip5/>`_, `CMIP6 <https://pcmdi.llnl.gov/CMIP6/>`_, and earth observation remote sensing data (`GPM <https://gpm.nasa.gov/data/directory>`_, `TRMM <https://gpm.nasa.gov/missions/trmm>`_, `GLDAS <https://ldas.gsfc.nasa.gov/gldas>`_) needed to drive various hydrological models (e.g., `VIC <https://github.com/UW-Hydro/VIC>`_, `RHESSys <https://github.com/RHESSys/RHESSys>`_, `SWAT <https://swat.tamu.edu/>`_ …etc.).  The NASAaccess has been envisioned to lower the technical barrier and simplify the process of accessing scalable distributed computing resources and leverage additional software for data and computationally intensive modeling frameworks. **NASAaccess** Tethys web-based application can be used for accessing, reformatting, and visualizing climate and earth observation remote sensing gridded time series data as well.



How it works
************

The **NASAaccess** Tethys Application is simply a user interface for passing arguments into the **NASAaccess**
functions by calling the `r-nasaaccess` conda package (https://anaconda.org/conda-forge/r-nasaaccess). Using a combination of dropdowns, datepickers, and checkboxes, the app allows the user to select a watershed boundary, DEM, date range, and NASAaccess function(s) to pass to the server for running the selected **NASAaccess** function(s).


Requirements
************

- Windows:
            Setup a VirtualBox Machine via https://www.virtualbox.org/wiki/Downloads   

- Windows/MacOS/Linux:
            Anaconda (https://docs.anaconda.com/anaconda/install/index.html)  or miniconda (https://docs.conda.io/en/latest/miniconda.html)


Source Code
***********

The NASAaccess source code is available on Github:

  - https://github.com/imohamme/tethys_nasaaccess
