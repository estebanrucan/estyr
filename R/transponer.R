#' Transponer
#'
#' Tranpone una base de datos de dimensión \code{n x m} a \code{m x n}.
#'
#' Útil para voltear tibbles, ya que requiere de un proceso más largo.
#'
#' @author Esteban Rucán
#'
#' @param data Data Frame. Base de datos a transponer.
#' @param ids Character. Nombre de la columna de ID's
#' @param nombres_a Character. Nombre para la columna que tendrá los nombres de las variables de la base de datos original.
#' @param prefijo Character. Prefijo de las variables para la función \code{pivot_wider}.
#' @param separador Character. Separador de las variables antes del \code{prefijo}.
#'
#' @import magrittr
#' @import tibble
#' @importFrom tidyr pivot_wider
#' @importFrom tidyr pivot_longer
#'
#' @return Tibble. Transpuesta de un \code{Data Frame}.
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{
#'      mtcars$row <- rownames(mtcars)
#'      rownames(mtcars) <- NULL
#'      mtcars %>% transponer(row)
#'      }
#'
#' @export
#'

transponer <- function(data,
                       ids,
                       nombres_a = " ",
                       prefijo   = "",
                       separador = "_") {
    data %>%
        pivot_longer(-!!enquo(ids),
                     names_to  = nombres_a,
                     values_to = ".tempvals") %>%
        pivot_wider(names_from   = !!enquo(ids),
                    values_from  = ".tempvals",
                    names_prefix = prefijo,
                    names_sep    = separador)
}
