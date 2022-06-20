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

testthat::test_that("type is equal to Event", {
  testthat::expect_equal(unique(dwc_event$type), "Event")
})
