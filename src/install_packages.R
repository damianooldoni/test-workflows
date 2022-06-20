# install needed packages
installed <- rownames(installed.packages())
required <- c("httr", "ows4R", "here", "readr", "dplyr", "testthat")
if (!all(required %in% installed)) {
  pkgs_to_install <- required[!required %in% installed]
  print(paste("Packages to install:", paste(pkgs_to_install, collapse = ", ")))
  install.packages(pkgs_to_install)
}
