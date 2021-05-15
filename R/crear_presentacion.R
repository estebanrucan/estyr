#' Crear Presentación de R Xaringan.
#'
#' Crear una presentación de R Markdown en el directorio seleccionado.
#'
#' Esta función proporciona una forma rápida de crear una presentación en R Markdown.
#'
#' @author Esteban Rucán.
#'
#' @param titulo Character. Título de la presentación.
#'
#' @return Plantilla Xaringan en R Markdown.
#'
#' @importFrom rstudioapi navigateToFile
#' @importFrom utils osVersion
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{crear_presentacion("Analsis Exploratorio")}
#'
#' @export
#'
crear_presentacion <- function(titulo = 'Sin titulo') {

    dir <- selectDirectory(caption = "Selecciona lugar para crear presentacion",
                           label = "Seleccionar Carpeta",
                           path = iconv(getwd(), "UTF-8"))

    dir    <- iconv(dir, "UTF-8")
    titulo <- iconv(titulo, "UTF-8")

    stopifnot(length(dir) > 0)

    archivos_css <- system.file("xarigan-files", package = "estyr")
    default      <- file.path(archivos_css, 'default.css')
    nhsr         <- file.path(archivos_css, 'nhsr.css')
    rladies      <- file.path(archivos_css, 'rladies-fonts.css')

    lugar_archivos_css <- sprintf('%s/libs', dir)

    dir.create(lugar_archivos_css)

    file.copy(from = default,
              to = sprintf('%s/default.css', lugar_archivos_css))
    file.copy(from = nhsr,
              to = sprintf('%s/nhsr.css', lugar_archivos_css))
    file.copy(from = rladies,
              to = sprintf('%s/rladies-fonts.css', lugar_archivos_css))

    contenido_archivo <- c(
        "---",
        paste0("title: '", titulo, "'"),
        "subtitle: 'Subt\u00EDtulo'",
        "author: 'Autor'",
        "institute: 'Instituto'",
        "date: 'Fecha'",
        "output:",
        "    xaringan::moon_reader:",
        "        lib_dir: libs",
        "        css: ",
        "            - default",
        "            - nhsr",
        "            - rladies-fonts",
        "        seal: false",
        "        nature:",
        "        highlightStyle: github",
        "        highlightLines: true",
        "        countIncrementalSlides: false",
        "        ratio: '16:9'",
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
        "knitr::opts_chunk$set(",
        "    fig.retina = 3,",
        "    echo = TRUE,",
        "    message = FALSE, ",
        "    warning = FALSE,",
        "    error = FALSE,",
        "    comment = NA",
        ")",
        "",
        "# remotes::install_github('estebanrucan/estyr')",
        "",
        "# Tema de los gr\u00E1ficos",
        "",
        "thematic::thematic_on(bg          = 'auto',",
        "                      fg          = 'auto',",
        "                      accent      = 'auto',",
        "                      qualitative = estyr::paleta_estyr())",
        "",
        "ggplot2::theme_set(estyr::theme_estyr())",
        "",
        "# Escribe los packages que usar\u00E1s aqu\u00ED:",
        "",
        "pacman::p_load(tidyverse,",
        "               magrittr,",
        "               echarts4r,",
        "               roperators,",
        "               glue,",
        "               furrr,",
        "               estyr,",
        "               DT)",
        "",
        "future::plan(multiprocess)",
        "",
        "require(Hmisc, include.only = 'Cs')",
        "",
        "# suppressPackageStartupMessages(require(broom))",
        "# suppressPackageStartupMessages(require(corrmorant))",
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
        "# suppressPackageStartupMessages(require(tidymodels))",
        "```",
        "",
        "<!-- Imagen en Diapositivas -->",
        "<!-- .right[ -->",
        "<!-- <img src='ruta' width='300px' /> -->",
        "<!-- ]] -->",
        "",
        "<!-- Imagen Portada -->",
        "<!-- class: left, bottom, inverse -->",
        "<!-- background-image: url(ruta) -->",
        "<!-- background-position: 86% 10% -->",
        "<!-- background-size: 28% -->",
        "",
        "# `r rmarkdown::metadata$title`",
        "----",
        "## **`r rmarkdown::metadata$subtitle`**",
        "### `r rmarkdown::metadata$author`",
        "### `r rmarkdown::metadata$date`",
        "",
        "---",
        "class: inverse center middle",
        "",
        "# Insertar t\u00EDtulo",
        "",
        "---",
        "class: middle",
        "",
        "# Insertar t\u00EDtulo",
        "",
        "--",
        "* Inserte texto",
        "",
        "---",
        "class:  middle",
        "",
        "# Inserte t\u00EDtulo",
        "",
        ".pull-left[",
        "",
        "* Inserta texto aqu\u00ED",
        "",
        "```{r figura-1.1, fig.show = 'hide'}",
        "# Escribe c\u00F3digo aqu\u00ED  #<<",
        "```",
        "> Comentario",
        "",
        "]",
        ".pull-right[",
        "```{r ref.label = 'figura-1.1', echo = FALSE}",
        "",
        "```",
        "]",
        "",
        "---",
        "class: middle, inverse",
        "",
        ".middle[",
        ".center[",
        "Gracias",
        "]",
        "]",
        "",
        "## Nombre",
        "### Correo"
    )

    titulo_snake_case <- iconv(tolower(gsub(" ", "-", titulo)),
                               to = 'ASCII//TRANSLIT')
    nombre_archivo    <- paste0(dir,
                                '//',
                                format(Sys.Date(), format = '%Y-%m-%d'),
                                '_',
                                titulo_snake_case,
                                '.Rmd')

    file.create(nombre_archivo)

    archivo <- file(nombre_archivo)

    writeLines(contenido_archivo,
               archivo,
               useBytes = TRUE)

    options('yaml.eval.expr' = TRUE)

    close(archivo)

    navigateToFile(nombre_archivo)

}
