FROM rocker/binder:3.6.0
LABEL maintainer='Jeffrey Perkel'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}
RUN wget https://github.com/jperkel/Mapping_tools_holepunch/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-08-15/')); devtools::install_deps()"


RUN wget -q -O al112017_5day_020.zip "https://nextjournal.com/data/QmNa8fB6hBLr4H6TLC1WvsEqKRPsJLi2hqSH45no7FEUS2?content-type=application%2Fzip&filename=al112017_5day_020.zip"
RUN wget -q -O NOAA_OISST_ncdf4.R "https://nextjournal.com/data/QmPSXES9jEU74tNnAXwXkWnu96pnaqTpK9atEA2opx2qUR?content-type=&filename=NOAA_OISST_ncdf4.R"
RUN wget -q -O sst.day.mean.2017.nc "https://nextjournal.com/data/QmVY4pW99tirkFsVh8DmDdkJXoE4e48SWEHYUgi1G78R6y?content-type=&filename=sst.day.mean.2017.nc"
RUN wget -q -O lsmask.oisst.v2.nc "https://nextjournal.com/data/QmY7ASN1T2PtVQZoh2915SiJnVQeLw41YdySXEjAE8WJ3w?content-type=&filename=lsmask.oisst.v2.nc"
