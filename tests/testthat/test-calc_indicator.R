test_that("calc_indicator works", {
  aoi <- read_sf(
    system.file("extdata", "gfw_sample.gpkg",
                package = "mapme.biodiversity"
    )
  )

  temp_loc <- file.path(tempdir(), "mapme.biodiversity")
  dir.create(temp_loc, showWarnings = FALSE)
  resource_dir <- system.file("res", package = "mapme.biodiversity")
  file.copy(resource_dir, temp_loc, recursive = TRUE)
  outdir <- file.path(tempdir(), "mapme.biodiversity", "res")
  tmpdir <- tempdir()

  aoi <- suppressWarnings(st_cast(aoi, to = "POLYGON"))[1, ]
  portfolio <- init_portfolio(aoi,
                              years = 2000:2005,
                              cores = 1,
                              outdir = outdir,
                              tmpdir = tmpdir,
                              verbose = FALSE
  )

  portfolio <- get_resources(portfolio,
                             resources = c("gfw_treecover", "gfw_lossyear"),
                             vers_treecover = "GFC-2020-v1.8",
                             vers_lossyear = "GFC-2020-v1.8"
  )

  expect_message(
    calc_indicators(portfolio,
                    indicators = "treecover_area",
                    min_cover = 10
    ),
    "was not specified. Setting to default value"
  )

  stat <- calc_indicators(portfolio,
                          indicators = "treecover_area",
                          min_size = 5,
                          min_cover = 30
  )$treecover_area[[1]]

  expect_snapshot(stat)

  cores <- ifelse(Sys.info()["sysname"] == "Windows", 1, 2)

  portfolio <- init_portfolio(aoi,
                              years = 2000:2005,
                              cores = cores,
                              outdir = outdir,
                              tmpdir = tmpdir,
                              add_resources = TRUE,
                              verbose = FALSE
  )

  stat <- calc_indicators(portfolio,
                          indicators = "treecover_area",
                          min_size = 5,
                          min_cover = 30
  )$treecover_area[[1]]

  expect_snapshot(stat)

  expect_warning(
    calc_indicators(portfolio, "treecover")
  )
})


test_that(".bind_assets works correctly", {

  # Case 1: All assets return equally shaped tibble
  results <- list(
    tibble::tibble(
      year = c(2010, 2011),
      value = c(0.5, 1.0)
    ),
    tibble::tibble(
      year = c(2010, 2011),
      value = c(0.0, 0.5)
    )
  )

  expected_results <- tibble::tibble(
    .id = c("1","1","2","2"),
    year = c(2010, 2011, 2010, 2011),
    value = c(0.5, 1.0, 0.0, 0.5)
  )

  expect_equal(
    .bind_assets(results),
    expected_results
  )

  # Case 2: All assets return NA
  results <- list(
    NA,
    NA
  )

  expected_results <- tibble::tibble(
    .id = c("1","2"),
    value = c(NA, NA)
  )

  expect_equal(
    .bind_assets(results),
    expected_results
  )

  # Case 3: Some asset(s) return(s) NA
  results <- list(
    tibble::tibble(
      year = c(2010, 2011),
      value = c(0.5, 1.0)
    ),
    NA
  )

  expected_results <- tibble::tibble(
    .id = c("1","1","2"),
    year = c(2010, 2011, NA),
    value = c(0.5, 1.0, NA)
  )

  expect_equal(
    .bind_assets(results),
    expected_results
  )

})
