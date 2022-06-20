# Mapping file

# read input data
input_data <-readr::read_csv("./data/raw/rato_data.csv")

# mapping
event <- input_data
event <- event %>%
  dplyr::mutate(dwc_type = "Event") %>%
  dplyr::mutate(dwc_language = "en") %>%
  dplyr::mutate(dwc_license = "http://creativecommons.org/publicdomain/zero/1.0/") %>%
  dplyr::mutate(dwc_datasetName = "Test dataset") %>%
  dplyr::select(starts_with("dwc_"))

# save output
readr::write_csv("./data/processed/event.csv")

