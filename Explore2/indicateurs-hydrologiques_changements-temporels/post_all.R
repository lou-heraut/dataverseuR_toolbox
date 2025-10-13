# Copyright 2025 Louis Héraut (louis.heraut@inrae.fr)*1
#
# *1   INRAE, France
#
# This file is part of dataverseur R package.
#
# dataverseur R package is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# dataverseur R package is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU xGeneral Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dataverseur R package.
# If not, see <https://www.gnu.org/licenses/>.


library(dataverseuR)
# devtools::load_all("/home/lheraut/Documents/INRAE/projects/dataverseuR_project/dataverseuR")
library(dplyr)

dotenv::load_dot_env(file=".env-entrepot")
# dotenv::load_dot_env(file=".env-demo")


to_do = c(
    # "get_metadata"
    "search_datasets",
    # "create_datasets"
    "modify_datasets"
    # "add_file"
    # "add_readme"
    # "rename_files"
    # "delete_files"
    # "delete_readme"
    # "delete_datasets"
    # "publish_datasets"
)

dataverse = "explore2-indicateurs_hydrologiques-changements_horizons"
path_to_data =
    "/media/lheraut/Explore2/hydrological-projections_indicators/hydrological-projections_indicators_changes-by-horizon-ref-1976-2005_by-chain_parquet"
metadata_template_dir = "metadata"
metadata_filename = "RDG_metadata"
datasets_info_file = "datasets_info.csv"
datasets_info = ASHE::read_tibble(file.path(metadata_template_dir,
                                            datasets_info_file))


if ("get_metadata" %in% to_do) {
    dataset_DOI = "doi:10.57745/ZZYYZQ"
    metadata = get_datasets_metadata(dataset_DOI=dataset_DOI)
    convert_metadata(metadata)
}


if ("search_datasets" %in% to_do) {
    
    query = 'title:"RCP"'
    publication_status =
        # "RELEASED"
        "DRAFT"
    type = "dataset"
    n_search = 1000
    
    datasets =
        search_datasets(query=query,
                        publication_status=publication_status,
                        type=type,
                        dataverse=dataverse,
                        n_search=n_search)
    datasets = dplyr::arrange(datasets, name)
    datasets
}


if ("create_datasets" %in% to_do |
    "modify_datasets" %in% to_do |
    "add_file" %in% to_do |
    "add_readme" %in% to_do) {

    stop_at_EXP =
        # TRUE
        FALSE
    nEXP_start = 1
    nHM_start = 1

    Dirpaths = list.dirs(path_to_data, recursive=FALSE)
    Dirpaths = Dirpaths[grepl("rcp", Dirpaths)]
    Dirs = gsub(".*[/]", "", Dirpaths)
    Info_Dirs = strsplit(Dirs, "_")
    
    EXP_all = sapply(Info_Dirs, "[[", 1) 
    EXP = c("RCP 2.6"="historical-rcp26",
            "RCP 4.5"="historical-rcp45",
            "RCP 8.5"="historical-rcp85")
    nEXP = length(EXP)
    
    HM_all = sapply(Info_Dirs, "[[", 2) 
    HM = unique(HM_all)
    HM = HM[HM != "all"]
    nHM = length(HM)
    
    for (i in nEXP_start:nEXP) {
        print(paste0("* ", i))
        exp = EXP[i]
        exp_name = names(EXP)[i]

        for (j in nHM_start:nHM) {
            print(paste0("** ", j))
            hm = HM[j]
            
            output_dirpath = Dirpaths[grepl(exp, Dirs) &
                                      grepl(hm, Dirs)]
            dataset_info = dplyr::filter(datasets_info,
                                         HM == hm &
                                         EXP == exp)

            if ("create_datasets" %in% to_do |
                "modify_datasets" %in% to_do) {
                metadata_template_path =
                    file.path(metadata_template_dir, "all.yml")
                metadata_file = readLines(metadata_template_path)
                metadata_file = gsub("[{]RCP[}]",
                                     exp_name, metadata_file)
                metadata_file = gsub("[{]HM[}]",
                                     hm, metadata_file)

                metadata_file = gsub("[{]citation1[}]",
                                     gsub("\"", "'",
                                          dataset_info$citation1),
                                     metadata_file)
                metadata_file = gsub("[{]DOI1[}]",
                                     dataset_info$doi1,
                                     metadata_file)
                metadata_file = gsub("[{]URL1[}]",
                                     dataset_info$url1,
                                     metadata_file)

                metadata_file = gsub("[{]citation2[}]",
                                     gsub("\"", "'",
                                          dataset_info$citation2),
                                     metadata_file)
                metadata_file = gsub("[{]DOI2[}]",
                                     dataset_info$doi2,
                                     metadata_file)
                metadata_file = gsub("[{]URL2[}]",
                                     dataset_info$url2,
                                     metadata_file)

                metadata_file = gsub("[{]country1[}]",
                                     "France",
                                     metadata_file)
                metadata_file = gsub("[{]coverage1[}]",
                                     dataset_info$coverage1,
                                     metadata_file)
                if (nchar(dataset_info$coverage2) == 0) {
                    Ok = !grepl("country2", metadata_file) &
                        !grepl("coverage2", metadata_file)
                    metadata_file = metadata_file[Ok]
                } else {
                    metadata_file = gsub("[{]country2[}]",
                                         "France",
                                         metadata_file)
                    metadata_file = gsub("[{]coverage2[}]",
                                         dataset_info$coverage2,
                                         metadata_file)
                }
                
                metadata_path = file.path(output_dirpath,
                                          paste0(metadata_filename,
                                                 ".yml"))
                writeLines(metadata_file, metadata_path)
                
                metadata_json_path =
                    generate_metadata_json(metadata_path,
                                           overwrite=TRUE)
            }

            # stop()
            
            if ("create_datasets" %in% to_do) {
                dataset_DOI =
                    create_datasets(dataverse=dataverse,
                                    metadata_json_path=
                                        metadata_json_path)
            }

            if ("modify_datasets" %in% to_do |
                "add_file" %in% to_do |
                "add_readme" %in% to_do) {
                dataset = filter(datasets, grepl(exp_name, name) &
                                           grepl(hm, name))
                dataset_DOI = dataset$dataset_DOI
                dataset_citation = gsub("Gouv.*", "Gouv",
                                        dataset$citation)
            }
            
            if ("modify_datasets" %in% to_do) {
                dataset_DOI =
                    modify_datasets(dataverse=dataverse,
                                    dataset_DOI=dataset_DOI,
                                    metadata_json_path=
                                        metadata_json_path)
            }
            if ("add_file" %in% to_do) {
                file_Paths = list.files(output_dirpath,
                                        pattern=".tar.gz",
                                        full.names=TRUE)
                add_datasets_files(dataset_DOI=dataset_DOI,
                                  file_paths=file_Paths)
            }
            if ("add_readme" %in% to_do) {
                README_template_path =
                    file.path(metadata_template_dir, "README.txt")
                
                README_file = readLines(README_template_path)
                id = which(grepl("[{]CITE[}]", README_file))
                README_file = c(README_file[1:(id-1)],
                                strwrap(dataset_citation, width=70),
                                README_file[(id+1):length(README_file)])
                README_file = gsub("[{]HM[}]",
                                   hm, README_file)
                README_file = gsub("[{]RCP[}]",
                                   exp_name, README_file)
                README_path = file.path(output_dirpath,
                                        "README.txt")
                writeLines(README_file, README_path)
                add_datasets_files(dataset_DOI=dataset_DOI,
                                   file_paths=README_path)
            }
        }
        if (stop_at_EXP) stop()
    }
}

if ("rename_files" %in% to_do) {
    datasets_DOI = datasets$dataset_DOI

    Paths_nc = list.files(path_to_data,
                          pattern=".nc",
                          full.names=TRUE,
                          recursive=TRUE)
    Paths_nc = Paths_nc[!grepl("SAFRAN", dirname(Paths_nc))]
    
    Files_nc = basename(Paths_nc)
    Files_nc_cut = sapply(lapply(strsplit(Files_nc, "_"),
                                 "[", 1:10), paste0,
                          collapse="_")
    
    for (dataset_DOI in datasets_DOI) {
        files = list_datasets_files(dataset_DOI)
        files = dplyr::filter(files,
                              gsub(".*[.]", "", label) == "nc")
        files$new_name = NA

        nFiles = nrow(files)
        for (i in 1:nFiles) {
            file = files[i, ]
            fID = file$id
            name = file$label
            name_cut =
                paste0(unlist(strsplit(name, "_"))[1:10],
                       collapse="_")
            path_nc = Paths_nc[Files_nc_cut == name_cut]
            
            NC = ncdf4::nc_open(path_nc)
            min_date = min(ncdf4::ncvar_get(NC, "time") +
                           as.Date("1950-01-01"))
            min_date = format(min_date, "%Y%m%d")
            ncdf4::nc_close(NC)

            new_name = unlist(strsplit(name, "_"))
            new_period =
                paste0(min_date,
                       gsub(".*[-]", "-",
                            new_name[11]))
            new_name[11] = new_period
            new_name = paste0(new_name, collapse="_")

            rename_datasets_files(file_DOI=fID,
                                  new_name=new_name,
                                  is_DOI_ID=TRUE)
            
            new_path_nc = file.path(dirname(path_nc),
                                    new_name)
            file.rename(from=path_nc, to=new_path_nc)
        }
    }
}


if ("delete_files" %in% to_do) {
    dataset_DOI = "doi:10.57745/UBCMZK"
    delete_all_datasets_files(dataset_DOI=dataset_DOI)
}


if ("delete_readme" %in% to_do) {
    files = list_datasets_files(datasets$dataset_DOI)
    readmes = dplyr::filter(files, grepl("README", label))
    delete_datasets_files(file_DOI=readmes$id,
                          is_DOI_ID=TRUE)
}


if ("delete_datasets" %in% to_do) {
    delete_datasets(dataset_DOI=datasets$dataset_DOI)
}

if ("publish_datasets" %in% to_do) {
    publish_datasets(dataset_DOI=datasets$dataset_DOI, type="minor")
}


