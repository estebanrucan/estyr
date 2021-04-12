#' Crear Proyecto de RStudio
#'
#' Función que crea un proyecto en el directorio indicdo
#'
#' Función que facilita la creación de un proyecto en RStudio
#'
#' @author Esteban Rucán.
#'
#' @return Proyecto
#'
#' @param estructura Valor lógico. Si es \code{TRUE}, indica que desea crear carpetas para estructurar el proyecto
#'
#' @encoding UTF-8
#'
#' @import remotes
#'
#' @importFrom usethis use_template
#' @importFrom rstudioapi selectDirectory
#' @importFrom usethis create_project
#'
#' @examples dontrun{crear_proyecto()}
#'
#' @export

crear_proyecto <- function(estructura = TRUE) {
    dir <- selectDirectory(caption = "Seleciona Carpeta para crear Proyecto",
                    label = "Seleccionar Carpeta",
                    path = getwd())

    is_a_project <- length(grep("\\.Rproj$", list.files(dir))) > 0

    stopifnot(!is_a_project)

    setwd(dir)

    if (estructura) {
        dir.create('datasets')
        dir.create('datasets//procesados')
        dir.create('datasets//sin-procesar')
        dir.create('codigo')
        dir.create('codigo//analsis-exploratorio')
        file.create('codigo//analsis-exploratorio//exploraciones.R')
        dir.create('figuras')
        dir.create('documentos')
        dir.create('resultados')

    }

    create_project('./', open = TRUE)

}




