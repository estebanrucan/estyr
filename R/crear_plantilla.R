#' Crear Plantilla de R Markdown.
#'
#' Crear una plantilla de R Markdown en el directorio seleccionado.
#'
#' Esta función proporciona una forma rápida de crear una plantilla de R Markdown.
#'
#' @author Esteban Rucám.
#'
#' @param titulo Character. Título de la plantilla.
#' @param color_fondo Character. Color de fondo de la plantilla
#' @param color_fuente Character. Color de fuente y lineas de la plantilla
#' @param resaltado Character. color de resaltado de la plantilla
#' @param tipo_fuente Character. Tipo de fuente (En Google Fonts) de la plantilla.
#' @param tipo_fuente_codigo Character. Tipo de fuente (En Google Fonts) del código de la plantilla.
#'
#' @return Plantilla de R Markdown.
#'
#' @importFrom rstudioapi navigateToFile
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{crear_plantilla("Analsis Exploratorio")}
#'
#' @export
#'
crear_plantilla <- function(titulo,
                            color_fondo        = '#202123',
                            color_fuente       = '#B8BCC2',
                            resaltado          = '#EA80FC',
                            tipo_fuente        = 'Patrick Hand',
                            tipo_fuente_codigo = 'Fira Code') {

    dir <- selectDirectory(caption = "Seleciona lugar para crear plantilla",
                           label = "Seleccionar Carpeta",
                           path = getwd())

    contenido_archivo <- c("---",
                 paste0("title: \"<center>", titulo, "</center>\""),
                 "subtitle: \"<center>Subt\u00EDtulo</center>\"",
                 "# autor: \"<center>Tu nombre</center>\"",
                 "date: \"<center>`r format(Sys.Date(), '%d de %B, %Y')`</center>\"",
                 "output:",
                 "  html_document:",
                 "    toc: true",
                 "    toc_float:",
                 "      collapsed: false",
                 "    code_folding: show",
                 "    code_download: true",
                 "    theme:",
                 paste0("      bg: \'", color_fondo,"\'      # Color de fondo."),
                 paste0("      fg: \'", color_fuente,"\'      # Color fuente y lineas."),
                 paste0("      primary: \'", resaltado,"\' # Resaltado."),
                 paste0("      base_font: !expr bslib::font_google(\'", tipo_fuente, "\')"),
                 paste0("      code_font: !expr bslib::font_google(\'", tipo_fuente_codigo, "\')"),
                 "---",
                 "",
                 "```{r setup, include=FALSE}",
                 "knitr::opts_chunk$set(echo      = TRUE,",
                 "                      message   = FALSE,",
                 "                      warning   = FALSE,",
                 "                      comment   = NA,",
                 "                      fig.align = 'center')",
                 "",
                 "# Tema de los gr\u00E1fico est\u00E1ticos",
                 "",
                 "ggplot2::theme_set(ggplot2::theme_dark())",
                 "",
                 "thematic::thematic_on(bg     = 'auto',",
                 "                      fg     = 'auto',",
                 "                      accent = 'auto')",
                 "",
                 "# Escribe los packages que usar\u00E1s aqu\u00ED:",
                 "",
                 "pacman::p_load(tidyverse,",
                 "               magrittr,",
                 "               echarts4r,",
                 "               estyr)",
                 "",
                 "#require(tidymodels)",
                 "#require(naniar)",
                 "#require(lubridate)",
                 "#require(reclin)",
                 "#require(fuzzyjoin)",
                 "#require(stringdist)",
                 "#require(plotly)",
                 "#require(janitor)",
                 "#require(readxl)",
                 "#require(skimr)",
                 "#require(ranger)",
                 "#require(broom)",
                 "#require(igraph)",
                 "#require(ggraph)",
                 "#require(datapasta)",
                 "require(ggExtra)",
                 "require(highcharter)",
                 "require(sqldf)",
                 "require(DT)",
                 "```",
                 "",
                 "## Pregunta 1",
                 "",
                 "### Pregunta 1.1",
                 "",
                 "```{r}",
                 "# Escribe tu c\u00F3digo aqu\u00ED",
                 "",
                 "",
                 "```",
                 "",
                 "## Pregunta 2",
                 "",
                 "### Pregunta 2.1",
                 "",
                 "```{r}",
                 "# Escribe tu c\u00F3digo aqu\u00ED",
                 "",
                 "",
                 "```",
                 "",
                 "## Pregunta 3",
                 "",
                 "### Pregunta 3.1",
                 "",
                 "```{r}",
                 "# Escribe tu c\u00F3digo aqu\u00ED",
                 "",
                 "",
                 "```")

    titulo_snake_case <- tolower(gsub(" ", "-", titulo))

    nombre_archivo <- paste0(dir, '//', format(Sys.Date(), format = "%Y-%m-%d"), '_', titulo_snake_case, '.Rmd')

    file.create(nombre_archivo)

    archivo <- file(nombre_archivo)

    writeLines(contenido_archivo, archivo)

    close(archivo)

    options("yaml.eval.expr" = TRUE)

    navigateToFile(nombre_archivo)

}
