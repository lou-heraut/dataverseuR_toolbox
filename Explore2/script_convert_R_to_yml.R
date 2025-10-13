

Paths = list.files(".", pattern=".R$", full.names=TRUE, recursive=TRUE)
Files = basename(Paths)

Paths = Paths[grepl("indicateurs", Paths) &
              (Files == "all.R" |
               Files == "ensemble.R" |
               Files == "narratifs.R" |
               Files == "SAFRAN.R")]

for (path in Paths) {
    path_yml = gsub("[.]R", ".yml", path)
    Lines = readLines(path)
    Lines = gsub("META[$]", "", Lines)
    Lines = gsub("[[:digit:]] [=]", " =", Lines)
    Lines = gsub(" [=]", ":", Lines)
    writeLines(Lines, path_yml)
}
