#' @title make_project
#'
#' @description Load a package
#'
#' @details Will also download the package if it has not been previously downloaded by the user
#'
#' @param project The name of the project to set-up
#'
#' @param path The path where the project is to be set up. Default is the current working directory
#'
#' @param folders Folders to generate inside the project. Default are "figures", "documentation", "data", "reports" and "R"
#'
#' @param readme Name and format of the description file to be generated. Default is "README.md"
#'
#' @param git logical. TRUE if project is to be set up qith Git. Default is FALSE.
#'
#' @return This function will only return an error message when failing, otherwise not output will be returned
#'
#' @examples \dontrun{ make_project(project_name) }
#'
#' @export
#'
#' @import usethis


make_project <- function (project,
                  path = getwd(),
                  folders = c("figures", "documentation",
                              "data", "reports", "R"),
                  readme = "README.md",
                  git = FALSE) {


  # change to path location
  if(!dir.exists(path)) stop("No such path")
  setwd(path)

  # project directory
  if(!missing(project)) {
    dir.create(project)
    setwd(project)
  }

  # create subdirectories
  for (i in folders){
    dir.create(i)
  }


  # create README.md
  today <- Sys.Date()
  user  <- Sys.info()[["user"]]
  project <- basename(getwd())
  cat("# Project: ", project, "\n\n",
      "## Author: ", user, "\n\n",
      "## Date: ",   format(today, format="%B %d %Y"), "\n\n",
      "## Purpose: \n\n",
      "## Data Sources: \n\n",
      "## Stakeholders: \n\n",
      file = readme,
      sep = "")

  # create RStudio project
  usethis::create_project(".", open=FALSE)

  # add git
  if (git){
     usethis::use_git()
  }


  # activate project
  usethis::proj_activate(".")

}


