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
    # "delete_readme"
)

dataverse = "explore2-indicateurs_hydrologiques-changements_TRACC"
path_to_data =
    "/media/lheraut/Explore2/hydrological-projections_indicators-TRACC/hydrological-projections_indicators-TRACC_changes-by-warming-level-ref-1976-2005_by-chain_parquet/narratifs_all"
metadata_template_dir = "metadata"
metadata_filename = "RDG_metadata"


if ("get_metadata" %in% to_do) {
    dataset_DOI = "doi:10.57745/VA7KHZ"
    metadata = get_datasets_metadata(dataset_DOI=dataset_DOI)
    convert_metadata(metadata)
}


if ("search_datasets" %in% to_do) {

    query = 'title:"ensemble" AND title:"narratifs" AND -title:"RCP"'
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
}

if ("create_datasets" %in% to_do |
    "modify_datasets" %in% to_do |
    "add_file" %in% to_do |
    "add_readme" %in% to_do) {
    
    metadata_template_path = file.path(metadata_template_dir,
                                       "narratifs.yml")
    metadata_path = file.path(path_to_data,
                              paste0(metadata_filename, ".yml"))

    if ("create_datasets" %in% to_do |
        "modify_datasets" %in% to_do) {
        file.copy(metadata_template_path, metadata_path, overwrite=TRUE)
        
        metadata_json_path =
            generate_metadata_json(metadata_path, overwrite=TRUE)
    }
        
    if ("create_datasets" %in% to_do) {
        dataset_DOI =
            create_datasets(dataverse=dataverse,
                            metadata_json_path=metadata_json_path)
    }
    if ("modify_datasets" %in% to_do) {
        dataset_DOI = datasets$dataset_DOI
        modify_datasets(dataverse=dataverse,
                        dataset_DOI=dataset_DOI,
                        metadata_json_path=metadata_json_path)
    }

    if ("add_file" %in% to_do) {
        dataset_DOI = datasets$dataset_DOI
        file_Paths = list.files(path_to_data,
                                pattern=".tar.gz",
                                full.names=TRUE)
        add_datasets_files(dataset_DOI=dataset_DOI,
                           file_paths=file_Paths)
    }

    if ("add_readme" %in% to_do) {
        dataset_DOI = datasets$dataset_DOI
        dataset_citation = gsub("Gouv.*", "Gouv",
                                datasets$citation)
        
        README_template_path =
            file.path(metadata_template_dir, "README_narratifs.txt")
        README_file = readLines(README_template_path)
        id = which(grepl("[{]CITE[}]", README_file))
        README_file = c(README_file[1:(id-1)],
                        strwrap(dataset_citation, width=70),
                        README_file[(id+1):length(README_file)])
        README_path = file.path(path_to_data, "README.txt")
        writeLines(README_file, README_path)
        not_added = add_datasets_files(dataset_DOI=dataset_DOI,
                                       file_paths=README_path)
        
    }
}

if ("delete_readme" %in% to_do) {
    files = list_datasets_files(datasets$dataset_DOI)
    readmes = dplyr::filter(files, grepl("README", label))
    delete_datasets_files(file_DOI=readmes$id,
                          is_DOI_ID=TRUE)
}




