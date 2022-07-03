# Mapping file

# load libraries
library(dplyr)
library(readr)

# read input data
input_data <-readr::read_csv("./data/raw/rato_data.csv")

# dummy mapping
event <- input_data
event <- event %>%
  dplyr::mutate(dwc_type = "Event") %>%
  dplyr::mutate(dwc_language = "en") %>%
  dplyr::mutate(dwc_license = "http://creativecommons.org/publicdomain/zero/1.0/") %>%
  dplyr::mutate(dwc_datasetName = "Test dataset") %>%
  dplyr::mutate(dwc_publisher = "rato vzw") %>%
  dplyr::select(starts_with("dwc_"))

colnames(event) <- gsub(pattern = "dwc_", replacement = "", x = colnames(event))
# save output
filename <- "./data/processed/event.csv"
todir <- dirname(filename)
if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
readr::write_csv(x = event, filename)

