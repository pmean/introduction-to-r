# global-replace.R
# written by Steve Simon
library(stringr)

gsr <- function(dir_name, file_pattern, old_string, new_string="no replacement", replace_flag=FALSE) {
  file_list <- list.files(dir_name, file_pattern)
  print(file_list)
  for (i_file in file_list) {
    file_text <- readLines(paste(dir_name, i_file, sep="/"), warn=FALSE)
    line_text <- str_subset(file_text, old_string)
    if (length(line_text)==0) next
    print(i_file)
    print(line_text)
    if (new_string=="no replacement") next
    new_lines <- str_replace_all(line_text, old_string, new_string)
    print(new_lines)
    if (!replace_flag) next
    new_text <-  str_replace_all(file_text, old_string, new_string)
    print(paste0("Replacing ", length(new_lines), " lines."))
    writeLines(new_text, paste(dir_name, i_file, sep="/"))
  }
  return(file_text)
}

file_text <- gsr("src", "*.Rmd", fixed("/dat/"), "/data/")
