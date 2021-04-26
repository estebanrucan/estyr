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
#' @import magrittr
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{grafico %>% e_theme_estyr()}
#'
#' @export
#'

e_theme_estyr <- function(e) {
    url <- "https://github.com/estebanrucan/estyr/raw/main/inst/chart_themes/theme_estyr.json"

    echarts4r::e_theme_custom(e, url) %>%
        echarts4r::e_x_axis(nameLocation = "center",
                            splitArea = list(show = FALSE),
                            axisLabel = list(margin = 0)) %>%
        echarts4r::e_y_axis(nameLocation = "center",
                            splitArea = list(show = FALSE),
                            axisLabel = list(margin = 0))
}
