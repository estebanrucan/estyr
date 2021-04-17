#' Crear Plantilla de R Markdown.
#'
#' Crear una plantilla de R Markdown en el directorio seleccionado.
#'
#' Esta función proporciona una forma rápida de crear una plantilla de R Markdown.
#'
#' @author Esteban Rucán.
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
crear_plantilla <- function(titulo             = 'Sin t\u00EDtulo',
                            color_fondo        = '#202123',
                            color_fuente       = '#B8BCC2',
                            resaltado          = '#FF8383',
                            tipo_fuente        = 'Patrick Hand',
                            tipo_fuente_codigo = 'Fira Code') {

    dir <- selectDirectory(caption = "Selecciona lugar para crear plantilla",
                           label = "Seleccionar Carpeta",
                           path = getwd())

    stopifnot(length(dir) > 0 & titulo != '')

    contenido_archivo <- c("---",
                 paste0("title: \"<center>", titulo, "</center>\""),
                 "subtitle: \"<center>Subt\u00EDtulo</center>\"",
                 "# autor: \"<center>Tu nombre</center>\"",
                 "date: \"<center>`r format(Sys.Date(), '%d-%m-%Y')`</center>\"",
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
                 "```{r include=FALSE, eval=FALSE}",
                 "#########################################",
                 "# Plantilla creada con el package estyr #",
                 "# Desarrollado por Esteban Ruc\u00E1n        #",
                 "#########################################",
                 "```",
                 "",
                 "```{r setup, include=FALSE}",
                 "knitr::opts_chunk$set(echo      = TRUE,",
                 "                      message   = FALSE,",
                 "                      warning   = FALSE,",
                 "                      comment   = NA,",
                 "                      fig.align = 'center')",
                 "",
                 "",
                 "# Tema de los gr\u00E1ficos",
                 "",
                 "thematic::thematic_on(bg     = 'auto',",
                 "                      fg     = 'auto',",
                 "                      accent = 'auto')",
                 "",
                 "ggplot2::theme_set(estyr::theme_estyr())",
                 "",
                 "# Escribe los packages que usar\u00E1s aqu\u00ED:",
                 "",
                 "pacman::p_load(tidyverse,",
                 "               magrittr,",
                 "               echarts4r,",
                 "               estyr,",
                 "               DT)",
                 "",
                 "require(Hmisc, include.only = 'Cs')",
                 "",
                 "# suppressPackageStartupMessages(require(broom))",
                 "# suppressPackageStartupMessages(require(dlookr))",
                 "# suppressPackageStartupMessages(require(GGally))",
                 "# suppressPackageStartupMessages(require(ggExtra))",
                 "# suppressPackageStartupMessages(require(ggpubr))",
                 "# suppressPackageStartupMessages(require(ggraph))",
                 "# suppressPackageStartupMessages(require(highcharter))",
                 "# suppressPackageStartupMessages(require(igraph))",
                 "# suppressPackageStartupMessages(require(janitor))",
                 "# suppressPackageStartupMessages(require(lubridate))",
                 "# suppressPackageStartupMessages(require(naniar))",
                 "# suppressPackageStartupMessages(require(ranger))",
                 "# suppressPackageStartupMessages(require(readxl))",
                 "# suppressPackageStartupMessages(require(skimr))",
                 "# suppressPackageStartupMessages(require(tidymodels))",
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

    titulo_snake_case <- iconv(tolower(gsub(" ", "-", titulo)), to = 'ASCII//TRANSLIT')

    nombre_archivo <- paste0(dir, '//', format(Sys.Date(), format = '%Y-%m-%d'), '_', titulo_snake_case, '.Rmd')

    file.create(nombre_archivo)

    archivo <- file(nombre_archivo)

    writeLines(contenido_archivo, archivo)

    options('yaml.eval.expr' = TRUE)

    close(archivo)

    navigateToFile(nombre_archivo)

}
