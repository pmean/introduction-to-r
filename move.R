# move.R
# written by Steve Simon

display_info <- function(x_list, x_name) {
  n <- length(x_list)
  if (n==0) {return(0)}
  cat(length(x_list))
  cat(" ")
  cat(x_name)
  cat(" file(s) moved: ")
  cat(paste(x_list, collapse=", "))
  cat("\n")
}

src_path <- "src"
res_path <- "results"

html_list <- list.files(src_path, pattern="*.html")
pdf_list <- list.files(src_path, pattern="*.pdf")
pptx_list <- list.files(src_path, pattern="*.pptx")
for (i in c(html_list, pdf_list, pptx_list)) {
  fn <- paste(src_path, i, sep="/")
  file.copy(fn, res_path, overwrite=TRUE)
  file.remove(fn)
}
display_info(pdf_list,  "pdf")
display_info(html_list, "html")
display_info(pptx_list, "pptx")

