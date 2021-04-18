#' Tema para echarts4r
#'
#' Tema de echarts4r con algunas configuraciones habituales
#'
#' Está función fue desarrollada con el fin de tener gráficos de un solo estilo
#'
#' @author Esteban Rucán.
#'
#' @param e Objeto de \code{echarts4r}.
#'
#' @return Tema de echarts4r.
#'
#' @import echarts4r
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{grafico %>% e_theme_estyr()}
#'
#' @export
#'

e_theme_estyr <- function(e) {
    echarts4r::e_theme_custom(e, "https://github.com/estebanrucan/estyr/raw/main/inst/chart_themes/theme_estyr.json")
}
