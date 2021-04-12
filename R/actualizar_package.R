#' Actualizar package
#'
#' Función que actualiza el package 'estyr'.
#'
#' Debido a lo complicado que puede ser desinstalar un package y reinstalarlo. Automatizamos ese procesimiento con esta función.
#'
#' @author Esteban Rucán.
#'
#' @return Package \code{estyr} actualizado a su versión más reciente.
#'
#' @encoding UTF-8
#'
#' @import remotes
#'
#' @examples actualizar_package()
#'
#' @export

actualizar_package <- function() {

    cargado <- FALSE

    if ('package:estyr' %in% search()) {

        detach(name   = package:estyr,
               unload = TRUE)

        cargado <- TRUE
    }

    utils::remove.packages(pkgs = 'estyr',
                           lib  = .libPaths()[1])

    remotes::install_github(repo  = 'estyr',
                            lib   = .libPaths()[1],
                            force = TRUE)

    if (cargado) suppressPackageStartupMessages(require(estyr))

}
