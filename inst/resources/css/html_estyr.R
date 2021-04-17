
## Directories for resources
css_dir  <- system.file("resources", "css",              package = "prettydoc")
tmpl_dir <- system.file("resources", "templates",        package = "prettydoc")

## Obtain theme CSS
avail_themes <- gsub("\\.css$", "", list.files(css_dir, "\\.css$"))
avail_themes <- grep("\\.min$", avail_themes, value = TRUE, invert = TRUE)
theme <- as.character(theme)
if (!isTRUE(theme %in% avail_themes)) {
    warning("theme not found, use default (cayman) instead")
    theme <- "cayman"
}
theme_css <- file.path(css_dir, sprintf("%s%s.css", theme,
                                        if (isTRUE(compressed_css)) ".min" else ""))

## Also theme template
avail_tmpl <- gsub("\\.html$", "", list.files(tmpl_dir, "\\.html$"))
if (!isTRUE(theme %in% avail_tmpl)) {
    theme <- "cayman"
}
theme_tmpl <- file.path(tmpl_dir, sprintf("%s.html", theme))

## Final CSS file
## We first save it to a temporary file, and then copy it to the appropriate
## directory in the pre_processor() hook
final_css <- tempfile(fileext = ".css")
file.copy(theme_css, final_css)

## Merge KaTeX CSS if math == "katex"
math <- 'mathjax'
if (math == "katex") {
    katex_css <- file.path(css_dir, "katex", "katex.min.css")
    file.append(final_css, katex_css)
}

## Merge syntax highlight CSS
if (!is.null(highlight)) {
    avail_hl <- gsub("\\.css$", "", list.files(hl_dir, "\\.css$"))
    if (!isTRUE(highlight %in% avail_hl)) {
        warning("highlight style not found, use default instead")
    } else {
        hl_css <- file.path(hl_dir, sprintf("%s.css", highlight))
        file.append(final_css, hl_css)
    }
}

## Merge user-supplied CSS file
if (!is.null(css)) {
    file.append(final_css, css)
}

## Borrowed from html_vignette()
pre_knit <- function(input, ...) {
    if (readme) {
        rmarkdown::render(input,
                          output_format = "github_document",
                          output_options = list(html_preview = FALSE),
                          output_file = "README.md",
                          output_dir = dirname(dirname(input)),
                          quiet = TRUE)
    }
}

## Hook function, invoked after document is knitted (so we know files_dir)
## and before Pandoc is called (so we can pass the `css` parameter)
pre_processor <- function(metadata, input_file, runtime, knit_meta,
                          files_dir, output_dir) {
    if (!file.exists(files_dir))
        dir.create(files_dir)

    pandoc_flags <- c()

    ## Copy CSS and resources to files_dir
    file.copy(img_dir,  files_dir, recursive = TRUE)
    if (math == "katex") {
        file.copy(font_dir, files_dir, recursive = TRUE)
        file.copy(js_dir, files_dir, recursive = TRUE)
        ## Pass files_dir to pandoc template
        pandoc_flags <- c(pandoc_flags,
                          "--variable", sprintf("resource-dir=%s", files_dir),
                          "--variable", "katex")
    } else {
        ## Create fonts folder
        out_font_dir <- file.path(files_dir, "fonts")
        if (!file.exists(out_font_dir))
            dir.create(out_font_dir)
        ## Exclude KaTeX fonts
        font_files <- grep("^KaTeX_.*", list.files(font_dir), value = TRUE, invert = TRUE)
        font_files <- file.path(font_dir, font_files)
        file.copy(font_files, out_font_dir)
    }
    doc_css <- file.path(files_dir, "style.css")
    file.copy(final_css, doc_css, overwrite = TRUE)

    ## Paremeters passed to Pandoc
    pandoc_flags <- c(pandoc_flags, "--css", doc_css)
    pandoc_flags
}

## `self_contained` needs to be explicitly specified, otherwise it will be
## set to TRUE
extra_args <- list(...)
self_contained <- extra_args$self_contained
clean_supporting <- if (!is.null(self_contained)) self_contained else TRUE

res <- rmarkdown::output_format(
    knitr = NULL,
    pandoc = NULL,
    keep_md = keep_md,
    clean_supporting = clean_supporting,
    pre_knit = pre_knit,
    pre_processor = pre_processor,
    ## Note that here `theme` and `highlight` are just parameters to make
    ## the HTML document tiny
    ## The real `theme` and `highlight` passed to html_pretty() are
    ## reflected in the final CSS file. Here `css` is set to NULL, but
    ## it will be set in the pre_processor() hook
    base_format = rmarkdown::html_document(fig_retina = fig_retina,
                                           css = NULL,
                                           theme = NULL,
                                           highlight = "pygments",
                                           ...)
)

## We have to do this hack, sadly. :-|
## html_document() disables certain features (including MathJax) when
## we are using a template file other than default. I guess this is to
## avoid the incompatibility between templates and options. However,
## our templates only add a few <section> wrappers around existing
## elements, so it should be safe to override this restriction.
pandoc_args <- res$pandoc$args
pandoc_args[grep("^--template$", pandoc_args) + 1] <- theme_tmpl
res$pandoc$args <- pandoc_args
res
