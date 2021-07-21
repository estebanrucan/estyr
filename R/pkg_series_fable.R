#' [fable] Cargar packages de series de tiempo
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
#' @examples \dontrun{pkg_series_fable()}
#'
#' @export

pkg_series_fable <- function() {

    pacman::p_load(c("ggplot2",
                   "tsibble",
                   "feasts",
                   "fable",
                   "fable.prophet"),
                   character.only = TRUE)

    writeLines(c("Packages cargados:", sort(c("- ggplot2",
                  "- tsibble",
                  "- feasts",
                  "- fable",
                  "- fable.prophet"))))

}
