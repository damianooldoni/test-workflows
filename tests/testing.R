dwc_event <- readr::read_csv("./data/processed/event.csv", guess_max = 10000)

# tests
testthat::test_that("Right columns in right order", {
  columns <- c(
    "type",
    "language",
    "license",
    "datasetName"
  )
  testthat::expect_equal(names(dwc_event), columns)
})
