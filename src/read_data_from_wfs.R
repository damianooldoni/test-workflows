#' Download data from rato vzw's WFS as csv

# load libraries
library(httr) # generic webservice package
library(ows4R) # interface for OGC webservices
library(here) # to work with paths

# WFS link
wfs <- "https://geodiensten.oost-vlaanderen.be/arcgis/services/MIL/RATO_Public_Data/MapServer/WFSServer"

# create WFS client
rato_client <- ows4R::WFSClient$new(wfs, serviceVersion = "2.0.0")

# get overview of the layers available
layers <- rato_client$getFeatureTypes(pretty = TRUE)
print(layers)

# request data from layer RATO_Public_Data
url <- httr::parse_url(wfs)
url$query <- list(service = "wfs",
                  request = "GetFeature",
                  typename = "RATO_Public_Data",
                  outputFormat = "CSV"
)
request <- httr::build_url(url)

# Download requested data as csv file
file <- "./rato_data.csv"
httr::GET(url = request, write_disk(file, overwrite = TRUE))

# move to ./data/raw
new_filepath <- "./data/raw/rato_data.csv"
todir <- dirname(new_filepath)
if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
file.rename(from = file,  to = new_filepath)
