#' Tema para ggplot2
#'
#' Tema de ggplot2 con algunas configuraciones habituales
#'
#' Está función fue desarrollada con el fin de tener gráficos de un solo estilo
#'
#' @author Esteban Rucán.
#'
#' @param base_size Valor numérico. Tamaño de la fuente en pts.
#' @param strip_text_size Valor numérico. Tamaño de fuente de los títulos de las facetas.
#' @param strip_text_margin Valor numérico. Margen de los títulos de las facetas.
#' @param subtitle_size Valor numérico. Tamaño de fuente del subtítulo en pts.
#' @param subtitle_margin Valor numérico. Margen del subtítulo.
#' @param plot_title_size Valor numérico. Tamaño de fuente del título en pts.
#' @param plot_title_margin Valor numérico. Margen del título.
#' @param legend_position Character. Posición de la leyenda.
#' @param ... Argumentos adicionales de \code{theme_minimal}
#'
#' @return Gráfico de ggplot2 configurado.
#'
#' @import ggplot2
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{grafico + theme_estyr()}
#'
#' @export
#'

theme_estyr <- function(base_size         = 11,
                        strip_text_size   = 12,
                        strip_text_margin =  5,
                        subtitle_size     = 13,
                        subtitle_margin   = 10,
                        plot_title_size   = 16,
                        plot_title_margin = 10,
                        legend_position   = 'bottom',
                        ...) {

    tema <- ggplot2::theme_minimal(base_size = base_size,...)

    tema$strip.text <- ggplot2::element_text(
        hjust = 0.5, size = strip_text_size,
        margin = ggplot2::margin(b = strip_text_margin)
    )

    tema$plot.subtitle <- ggplot2::element_text(
        hjust = 0.5, size = subtitle_size,
        margin = ggplot2::margin(b = subtitle_margin)
    )

    tema$plot.title <- ggplot2::element_text(
        hjust = 0.5, size = plot_title_size
    )

    tema$legend.position = legend_position

    tema
}
