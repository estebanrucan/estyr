#' Base de Datos Covid
#'
#' Función que que importa la base de datos del covid
#'
#' Útil para no meterse a la página a cada rato.
#'
#' @author Esteban Rucán.
#'
#' @return Tibble. Base de datos sobre el coronavirus extraida de Our World in Data
#'
#' @encoding UTF-8
#'
#' @importFrom vroom vroom
#'
#' @examples \dontrun{owid_covid_data()}
#'
#' @export

owid_covid_data <- function() {
    vroom('https://github.com/owid/covid-19-data/raw/master/public/data/owid-covid-data.csv')
}
