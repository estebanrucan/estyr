#' Paleta EstyR
#'
#' Paleta de colores
#'
#' Está función fue desarrollada con el fin tener colores habituales
#'
#' @author Esteban Rucán.
#'
#' @param n Valor numérico, cantidad de colores de la paleta, el máximo es 5.
#'
#' @return Paleta de colores
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{paleta_estyr()}
#'
#' @export
#'

paleta_estyr <- function(n = 5) {
    stopifnot(n <= 5 & n > 0)
    paleta <- c('#6a4c93', '#13b591', '#1982c4', '#990033', '#4b778d')
    paleta[1:n]
}
