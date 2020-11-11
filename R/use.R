#' @title use
#'
#' @description Load a package
#'
#' @details Will also download the package if it has not been previously downloaded by the user
#'
#' @param pkg A R package available on CRAN
#'
#' @return This function will only return an error message when failing, otherwise not output will be returned
#'
#' @examples \dontrun{ use(package_name) }
#'
#' @export
#'
#' @import utils

use <- function(pkg) {
  pkg <- as.character(substitute(pkg))
  if (!suppressWarnings(require(pkg, character.only = TRUE))) {
    msg <- paste("Install package", pkg, "(y/n)? ")
    answer <- readline(msg)
    answer <- substr(tolower(trimws(answer)), 1, 1)
    if (answer == "y") {
      install.packages(pkg)
      require(pkg, character.only = TRUE)
    } else {
      msg <- paste("Package", pkg, "not loaded.")
      message(msg)
    }
  }
}
