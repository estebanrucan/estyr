#' [modeltime] Cargar packages de series de tiempo
#'
#' Función que carga packages de series de tiempo
#'
#' ggplot2, tsibble, feasts, fable, fable.prophet
#'
#' @author Esteban Rucán.
#'
#' @return Packages de series de tiempo cargados
#'
#' @encoding UTF-8
#'
#' @importFrom pacman p_load
#'
#' @examples \dontrun{pkg_series_modeltime()}
#'
#' @export

pkg_series_modeltime <- function() {

    pacman::p_load(tidymodels,
                   modeltime,
                   modeltime.ensemble)

    writeLines(c("Packages cargados:", sort(c("- tidymodels",
                                              "- modeltime",
                                              "- modeltime.ensemble"))))

}
