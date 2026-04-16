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


devtools::load_all("/home/lheraut/Documents/INRAE/projects/dataverseuR_project/dataverseuR")
# library(dataverseuR)
library(dplyr)

dotenv::load_dot_env(file=".env-entrepot")
# dotenv::load_dot_env(file=".env-demo")


to_do = c(
    "search_datasets"
    # "get_metadata"
    # "list_files"
)


if ("search_datasets" %in% to_do) {

    dataverse = "explore2-rapports_techniques"
    query = "*"
    publication_status =
        "RELEASED"
        # "DRAFT"
    type = "dataset"
    n_search = 1000
    
    datasets =
        search_datasets(query=query,
                        publication_status=publication_status,
                        type=type,
                        dataverse=dataverse,
                        n_search=n_search)
    datasets = dplyr::arrange(datasets, name)
    ASHE::write_tibble(datasets,
                       "explore2-rapports_techniques_datasets.csv")
}



if ("get_metadata" %in% to_do) {
    dataset_DOI = "doi:10.57745/W0KO1G"
    metadata_json_path = "tmp.json"
    get_datasets_metadata(dataset_DOI, metadata_json_path,
                          overwrite=TRUE)
    convert_metadata_to_yml(metadata_json_path, overwrite=TRUE)
}


if ("list_files" %in% to_do) {
    files = list_datasets_files("doi:10.57745/QDCSBZ")
    get_base =
        "https://entrepot.recherche.data.gouv.fr/api/access/datafile/:persistentId/?persistentId="
    files$download_api_call = paste0(get_base, files$file_DOI)
    files = dplyr::select(files, file_DOI, label, download_api_call)
    ASHE::write_tibble(files, "dataverse_fiche_TRACC.csv")
}

