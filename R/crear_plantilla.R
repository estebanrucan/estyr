#' Power Mean
#'
#' Calcular la Media Generalizada de un vector y potencia \code{m}.
#'
#' Las medias generalizadas, también conocidas como medias de Hölder, son una abstracción de las medias cuadráticas, aritméticas, geométricas y armónicas. Se definen y agrupan a través de la siguiente expresión:
#' (1 / n * sum(x ^ m)) ^ (1 / m).
#'
#' @author Esteban Rucán.
#'
#' @param dir Un vector con valores numéricos.
#' @param crear_proyecto Potencia de la media generalizada. Si es 0, hace referencia a la media geométrica.
#' @param na.rm Valor Lógico, si es \code{TRUE}, excluye \code{NA} de los cálulos.
#'
#' @return Media generalizada según la potencia \code{m}.
#' @encoding UTF-8
#'
#' @examples power_mean(x = c(1:100, NA), m = 2, na.rm = TRUE)
#' power_mean(3:10, 2, FALSE)
#' power_mean(50:60, 0, FALSE)
#'
crear_plantilla <- function(bg = '#202123',
                            fg = '#B8BCC2',
                            primary = '#EA80FC',
                            base_font = 'Patrick Hand',
                            code_font = 'Fira Code',
                            dir = getwd(),
                            crear_proyecto = FALSE) {

}
