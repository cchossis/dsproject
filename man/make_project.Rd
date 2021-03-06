% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_project.R
\name{make_project}
\alias{make_project}
\title{make_project}
\usage{
make_project(
  project,
  path = getwd(),
  folders = c("figures", "documentation", "data", "reports", "R"),
  readme = "README.md",
  git = FALSE
)
}
\arguments{
\item{project}{The name of the project to set-up}

\item{path}{The path where the project is to be set up. Default is the current working directory}

\item{folders}{Folders to generate inside the project. Default are "figures", "documentation", "data", "reports" and "R"}

\item{readme}{Name and format of the description file to be generated. Default is "README.md"}

\item{git}{logical. TRUE if project is to be set up qith Git. Default is FALSE.}
}
\value{
This function will only return an error message when failing, otherwise not output will be returned
}
\description{
Load a package
}
\details{
Will also download the package if it has not been previously downloaded by the user
}
\examples{
\dontrun{ make_project(project_name) }

}
