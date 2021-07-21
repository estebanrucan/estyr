#' Cargar packages de análisis exploratorio
#'
#' Función que carga packages de análisis exploratorio
#'
#' tidymodels, broom, vip, usemodels, themis
#'
#' @author Esteban Rucán.
#'
#' @return Packages de análisis exploratorio cargados
#'
#' @encoding UTF-8
#'
#' @importFrom pacman p_load
#'
#' @examples \dontrun{pkg_analisis()}
#'
#' @export

pkg_analisis <- function() {

    pacman::p_load(glue,
                   lubridate,
                   janitor,
                   psych,
                   slider,
                   correlation,
                   rstatix,
                   ggtatsplot,
                   widyr,
                   dlookr,
                   DataExplorer,
                   tidyverse)

    writeLines(c("Packages cargados:", sort(c("- glue",
                                              "- lubridate",
                                              "- psych",
                                              "- janitor",
                                              "- slider",
                                              "- correlation",
                                              "- rstatix",
                                              "- ggtatsplot",
                                              "- widyr",
                                              "- dlookr",
                                              "- DataExplorer",
                                              "- tidyverse"))))

}
