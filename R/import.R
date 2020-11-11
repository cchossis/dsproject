#' @title import
#'
#' @description Import a data frame from a selected file
#'
#' @details Extensions supported include .sas7bdat, .dta, .sav, .xlsx, .xls, and most delimited files
#'
#' @param file A path to the file to be imported into the R Global Environment
#'
#' @param ... Additional argument used by the import function, optional
#'
#' @return A data frame or a tibble depending on the file's extension.
#'
#' @examples \dontrun{ df <- import(file) }
#'
#' @export
#'
#' @import tools haven readxl vroom


import <- function(file, ...){

  # if no file specified, prompt user

  if(missing(file))
    file <- file.choose()


  # get file info

  file <- tolower(file)
  basename <- basename(file)
  extension <- tools::file_ext(file)


  # import dataset

  df <- switch(extension,
           "sas7bdat" = haven::read_sas(file, ...),
           "dta" = haven::read_stata(file, ...),
           "sav" = haven::read_spss(file, ...),
           "xlsx" = readxl::read_excel(file, ...),
           "xls" = readxl::read_excel(file, ...),
           vroom::vroom(file, ...)
           )

  # return data frame
  return(df)
}

