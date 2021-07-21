#' Cargar packages de modelamiento
#'
#' Función que carga packages de modelamiento
#'
#' Packages como tidymodels, broom, vip, usemodels, themis, etc.
#'
#' @author Esteban Rucán.
#'
#' @return Packages de modelamiento cargados
#'
#' @encoding UTF-8
#'
#' @importFrom pacman p_load
#'
#' @examples \dontrun{pkg_modelos()}
#'
#' @export

pkg_modelos <- function() {

    pacman::p_load(lmtest,
                   car,
                   caret,
                   MASS,
                   ggfortify,
                   gamlss,
                   tidymodels,
                   broom,
                   vip,
                   usemodels,
                   performance,
                   parameters,
                   themis)

    writeLines(c("Packages cargados: ", sort(c("- lmtest",
                  "- car",
                  "- caret",
                  "- MASS",
                  "- ggfortify",
                  "- gamlss",
                  "- tidymodels",
                  "- broom",
                  "- vip",
                  "- usemodels",
                  "- performance",
                  "- parameters",
                  "- themis"))))

}
