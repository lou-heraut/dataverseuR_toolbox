
META$title = "Ensemble des indicateurs de changements par niveaux de réchauffement TRACC issus des narratifs des projections hydrologiques Explore2 du débit (référence 1976-2005)"

META$alternativeURL = "https://www.drias-eau.fr/commande"


META$datasetContactName1 = "Héraut, Louis"
META$datasetContactAffiliation1 = "INRAE, UR RiverLy, Villeurbanne, France"
META$datasetContactEmail1 = "louis.heraut@inrae.fr"

META$datasetContactName2 = "Sauquet, Éric"
META$datasetContactAffiliation2 = "INRAE, UR RiverLy, Villeurbanne, France"
META$datasetContactEmail2 = "eric.sauquet@inrae.fr"

META$authorName1 = "Héraut, Louis"
META$authorAffiliation1 = "INRAE, UR RiverLy, Villeurbanne, France"
META$authorIdentifierScheme1 = "ORCID"
META$authorIdentifier1 = "0009-0006-4372-0923"

META$contributorType1 = "Project Manager"
META$contributorName1 = "Sauquet, Éric"
META$contributorAffiliation1 = "INRAE, UR RiverLy, Villeurbanne, France"
META$contributorIdentifierScheme1 = "ORCID"
META$contributorIdentifier1 = "0000-0001-9539-7730"

META$contributorType2 = "Researcher"
META$contributorName2 = "Vidal, Jean-Philippe"
META$contributorAffiliation2 = "INRAE, UR RiverLy, Villeurbanne, France"
META$contributorIdentifierScheme2 = "ORCID"
META$contributorIdentifier2 = "0000-0002-3748-6150"


META$producerName = "Explore2"
META$producerURL = "https://professionnels.ofb.fr/fr/node/1244"
META$producerLogoURL = "https://entrepot.recherche.data.gouv.fr/logos/202158/LogoExplore2.png"

META$distributorName = "Entrepôt-Catalogue Recherche Data Gouv"
META$distributorURL = "https://entrepot.recherche.data.gouv.fr"
META$distributorLogoURL = "https://s3.fr-par.scw.cloud/rdg-portal/logos-macarons/Macarons%20Recherche%20Data%20Gouv_Entrep%C3%B4t.png"


META$dsDescriptionValue = "Ensemble des indicateurs de changements par niveaux de réchauffement TRACC associés aux chaînes de simulations de débits journaliers issus de 9 modèles hydrologiques pour la sélection des narratifs hydrologiques Explore2 sous RCP 8.5 par niveau de réchauffement et secteur hydrographique. Ces fichiers résultent de l'agrégation temporelle des simulations hydrologiques sous runs historiques (avant 2005) et des projections hydrologiques (post 2005), fichiers NetCDF disponibles au téléchargement dans la collection <a href='https://entrepot.recherche.data.gouv.fr/dataverse/explore2-projections_hydrologiques'>Explore2 - Projections hydrologiques</a>.<br><br>

Ce dépôt regroupe un tableau 2D par indicateur et chaîne de simulation par narratif pour chaque modèle hydrologique, c'est-à-dire, scénario d'émission RCP, couple GCM/RCM, correction de biais BC et modèle hydrologique HM. Ces données sont brutes et contiennent donc des chaînes de projections jugées aberrantes / horsains qu'il est possible de filter grâce à des <a href='https://doi.org/10.57745/YZNENQ'>métadonnées supplémentaires</a>. Pour des raisons techniques, ces indicateurs sont regroupés par dossiers compressés selon les différentes parties du régime hydrologique. Retrouvez davantage d'informations sur la chaîne de modélisation du climat dans le rapport <a href='https://doi.org/10.57745/PUR7ML'>https://doi.org/10.57745/PUR7ML</a>.<br><br>

La description des modèles hydrologiques utilisés est disponible dans les annexes du rapport <a href='https://doi.org/10.57745/S6PQXD'>https://doi.org/10.57745/S6PQXD</a>. Retrouvez le diagnostic des modèles hydrologiques résumé à l'échelle des régions hydrologiques dans les fiches téléchargeables ici : <a href='https://doi.org/10.57745/DMFUXW'>https://doi.org/10.57745/DMFUXW</a>.<br><br>

<b>Définition des narratifs hydrologiques</b> :<br>
L'ensemble des descriptions des narratifs hydrologique définit dans le cadre de la TRACC par niveau de réchauffement et secteur hydrographique est défini ici : <a href='https://doi.org/10.57745/KAHIWJ'>https://doi.org/10.57745/KAHIWJ</a>.<br><br>

<b>Métadonnées supplémentaires</b> : <ul>
<li>Récapitulatif de l'ensemble des indicateurs hydrologiques : <a href='https://doi.org/10.57745/JVNHQL'>https://doi.org/10.57745/JVNHQL</a></li>
<li>Récapitulatif de l'ensemble des chaînes de simulation : <a href='https://doi.org/10.57745/R6HG5X'>https://doi.org/10.57745/R6HG5X</a></li>
<li>Description de l'ensemble des points de simulation : <a href='https://doi.org/10.57745/UTKWR5'>https://doi.org/10.57745/UTKWR5</a></li>
<li>Liste des simulations des chaînes de projections jugées aberrantes / horsains : <a href='https://doi.org/10.57745/YZNENQ'>https://doi.org/10.57745/YZNENQ</a></li>
<li>Récapitulatif des années pivots utilisées pour la TRACC : <a href='https://doi.org/10.57745/DCOQM6'>https://doi.org/10.57745/DCOQM6</a></li></ul>

<b>Décomposition des chaînes de caractères formant le nom des fichiers parquet, séparées par des \"_\"</b> :<br>
{1} <i>Indicateur</i> : Le nom de l’indicateur, du type de statistique observée<br>
{2} <i>Échantillonnage</i> : Échantillonnage temporel sur laquelle est calculé l’indicateur<br>
&#8594; {1}_{2} <i>Variable</i> : Variable résultante d'un indicateur temporellement contextualisé<br>
{3} <i>RWL</i> : Horizon TRACC (RWL-(20|27|40))<br>
&#8594; {1}_{2}_{3} <i>Changement</i> : Changement d'une variable pour un horizon TRACC par rapport à une période de référence, défini dans le <a href='https://doi.org/10.57745/JVNHQL'>récapitulatif des indicateurs hydrologiques</a><br>
{4} <i>EXP</i> : Identifiant de l’expérience historique ou future via le scénario<br>
{5} <i>GCM</i> : Identifiant du GCM forçeur<br>
{6} <i>RCM</i> : Identifiant du RCM<br>
{7} <i>BC</i> : Identifiant de la méthode de correction de biais statistique<br>
{8} <i>HM</i> : Identifiant du modèle hydrologique<br>
{9} <i>Référence</i> : Période de référence (ref-YYYYMMDD-YYYYMMDD)<br><br>

<b>Les colonnes des fichiers parquet sont</b> : <ul>
<li><i>EXP</i> : Voir ci-dessus</li>
<li><i>GCM</i> : Voir ci-dessus</li>
<li><i>RCM</i> : Voir ci-dessus</li>
<li><i>BC</i> : Voir ci-dessus</li>
<li><i>HM</i> : Voir ci-dessus</li>
<li><i>SH</i> : Secteur hydrographique qui contient le point de simulation fourni dans la <a href='https://doi.org/10.57745/VPIIYJ'>description des régions et secteurs hydrographiques</a></li>
<li><i>code</i> : Code à 10 caractère du point de simulation fourni dans la <a href='https://doi.org/10.57745/UTKWR5'>description des points de simualtion</a></li>
<li><i>*Changement*</i> : Voir ci-dessus</li></ul>"

META$dsDescriptionLanguage = "French"
META$language = "French"
META$subject = "Earth and Environmental Sciences"


META$keywordValue1 = "hydrology"
META$keywordTermURL1 = "http://opendata.inrae.fr/thesaurusINRAE/c_11593"
META$keywordVocabulary1 = "INRAETHES"
META$keywordVocabularyURI1 = "http://opendata.inrae.fr/thesaurusINRAE/thesaurusINRAE"

META$keywordValue2 = "indicator"
META$keywordTermURL2 = "http://opendata.inrae.fr/thesaurusINRAE/c_16171"
META$keywordVocabulary2 = "INRAETHES"
META$keywordVocabularyURI2 = "http://opendata.inrae.fr/thesaurusINRAE/thesaurusINRAE"

META$keywordValue3 = "temporal aggregation"

META$keywordValue4 = "hydrological model"
META$keywordTermURL4 = "http://opendata.inrae.fr/thesaurusINRAE/c_1352"
META$keywordVocabulary4 = "INRAETHES"
META$keywordVocabularyURI4 = "http://opendata.inrae.fr/thesaurusINRAE/thesaurusINRAE"

META$keywordValue5 = "hydrological projection"

META$keywordValue6 = "climate change impacts"
META$keywordTermURL6 = "http://aims.fao.org/aos/agrovoc/c_13fb5a08"
META$keywordVocabulary6 = "AGROVOC"
META$keywordVocabularyURI6 = "http://aims.fao.org/aos/agrovoc/"

META$keywordValue7 = "niveau de réchauffement"


META$topicClassValue = "Hydrologie"
META$topicClassVocab = "INRAE Thésaurus"
META$topicClassVocabURI = "http://opendata.inrae.fr/thesaurusINRAE/c_1108"

META$kindOfData = "Dataset"
META$kindOfDataOther = "Changements par niveaux de réchauffement TRACC (débit) - Narratifs"
META$dataOrigin = "simulation data"


META$softwareName1 = "CTRIP"
META$softwareVersion1 = "x"

META$softwareName2 = "EROS"
META$softwareVersion2 = "x"

META$softwareName3 = "GRSD"
META$softwareVersion3 = "x"

META$softwareName4 = "J2000"
META$softwareVersion4 = "x"

META$softwareName5 = "MORDOR-SD"
META$softwareVersion5 = "x"

META$softwareName6 = "MORDOR-TS"
META$softwareVersion6 = "x"

META$softwareName7 = "ORCHIDEE"
META$softwareVersion7 = "x"

META$softwareName8 = "SIM2"
META$softwareVersion8 = "x"

META$softwareName9 = "SMASH"
META$softwareVersion9 = "x"

META$seriesName = "TRACC"


META$relatedDatasetCitation = "Sauquet, Éric; Evin, Guillaume; Siauve, Sonia; Ryma, Aissat; Patrick, Arnaud; Bérel, Maud; Bonneau, Jérémie; Branger, Flora; Caballero, Yvan; Colléoni, François; Ducharne, Agnès; Gailhard, Joël; Garambois, Pierre-André; Habets, Florence; Hendrickx, Frédéric; Héraut, Louis; Hingray, Benoît; Huang, Peng; Jaouen, Tristan; Jeantet, Alexis; Lanini, Sandra; Le Lay, Matthieu; Magand, Claire; Mimeau, Louise; Monteil, Céline; Munier, Simon; Perrin, Charles; Robelin, Olivier; Rousset, Fabienne; Soubeyroux, Jean-Michel; Strohmenger, Laurent; Thirel, Guillaume; Tocquer, Flore; Tramblay, Yves; Vergnes, Jean-Pierre; Vidal, Jean-Philippe, 2025, \"Ensemble des narratifs des projections hydrologiques Explore2 du débit\""
META$relatedDatasetIDType = "doi"
META$relatedDatasetIDNumber = "10.57745/X7THUO"
META$relatedDatasetURL = "https://doi.org/10.57745/X7THUO"

META$relatedDatasetCitation2 = "Héraut, Louis, 2025, \"Ensemble des indicateurs de séries annuelles issus des narratifs des projections hydrologiques Explore2 du débit\""
META$relatedDatasetIDType2 = "doi"
META$relatedDatasetIDNumber2 = "10.57745/RAJEZW"
META$relatedDatasetURL2 = "https://doi.org/10.57745/RAJEZW"


META$projectAcronym = "Explore2"
META$projectTitle = "Explore2 : Des futurs de l'eau"
META$projectURL = "https://app.inrae.fr/expertise/dossier-le-projet-explore2-des-projections-hydrologiques-pour-adapter-la-gestion-de-la-ressource-en-eau/"


META$timePeriodCoveredStart1 = "1976-01-01"
META$timePeriodCoveredEnd1 = "2005-08-31"
META$timePeriodCoveredStart2 = "2030-01-01"
META$timePeriodCoveredEnd2 = ""
META$timePeriodCoveredStart3 = "2050-01-01"
META$timePeriodCoveredEnd3 = ""
META$timePeriodCoveredStart4 = "2100-01-01"
META$timePeriodCoveredEnd4 = ""

META$country = "France"

META$depositor = "HERAUT, LOUIS"
