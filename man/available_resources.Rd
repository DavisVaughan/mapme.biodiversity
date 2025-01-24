% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resources_backlog.R
\name{available_resources}
\alias{available_resources}
\title{Backlog function for available resources}
\usage{
available_resources(resources = NULL)
}
\arguments{
\item{resources}{Defaults to NULL meaning that a list with all available
resources will be returned. If a character vector is specified only the
information about the requested resource will be returned.}
}
\value{
A list object.
}
\description{
This function returns a list of either all available resources and some
additional metadata or for one or more requested resources. It can be used
by users of the package to inform themselves about the available data sets
and to learn about potentially additional arguments that should be specified
when requesting the resource.
}
\examples{
names(available_resources())
}
\keyword{resource}
