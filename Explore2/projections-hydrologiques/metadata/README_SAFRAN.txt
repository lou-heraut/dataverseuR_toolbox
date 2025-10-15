 ___             _                 ___ 
| __|__ __ _ __ | | ___  _ _  ___ |_  )
| _| \ \ /| '_ \| |/ _ \| '_|/ -_) / / 
|___|/_\_\| .__/|_|\___/|_|  \___|/___|
          |_|

{CITE}


INFORMATIONS GENERALES _______________________________________________
Le projet Explore2, porté par INRAE et l'Office International de l'eau
(OiEau), s'inscrit dans la suite de l'étude Explore 2070 (2010-2012)
qui avait conduit à l'élaboration des premiers scénarios prospectifs
de disponibilités de la ressource en eau à l'échelle de la France
sous changement climatique.

Le projet Explore2 a officiellement été lancé en juillet 2021.
Co-financé par les partenaires du projet, le Ministère de la
Transition Écologique et de la Cohésion des Territoires (MTECT) et 
l'Office Français de la Biodiversité (OFB), le projet Explore2 a eu
pour objectifs d'actualiser les connaissances sur l'impact du
changement climatique sur l'hydrologie à partir des dernières
publications du GIEC, et aussi d'accompagner les acteurs des
territoires dans la compréhension et l'utilisation de ces résultats
pour adapter leurs stratégies de gestion de la ressource en eau.

Le volet scientifique est coordonné par Éric Sauquet (INRAE).


RESSOURCES ___________________________________________________________
- Rapports techniques sur le dataverse d’Explore2 :
  https://entrepot.recherche.data.gouv.fr/dataverse/explore2
- Retrouvez les messages et enseignements du projet Explore2 :
  https://doi.org/10.57745/J3XIPW
- Dossier INRAE / Appui aux Politiques Publiques :
  https://app.inrae.fr/expertise/dossier-le-projet-explore2-des-projections-hydrologiques-pour-adapter-la-gestion-de-la-ressource-en-eau/
- Accès aux données DRIAS climat pour les projections climatiques :
  https://www.drias-climat.fr/commande/
- Accès aux données DRIAS eau pour les projections hydrologiques :
  https://www.drias-eau.fr/commande/
- Accès aux données Recherche Data Gouv pour les projections
  hydrologiques :
  https://entrepot.recherche.data.gouv.fr/dataverse/explore2-projections_hydrologiques
- Visualisation des données : https://meandre.explore2.inrae.fr/
- Formation : https://e-learning.oieau.fr/enrol/index.php?id=3799
- Séminaire de restitution du 28 juin 2024 :
  https://www.seminaire-explore2-lifeeauclimat.oieau.fr/
- Recommandations pour mener une étude rétrospective et prospective
  sur la ressource en eau : https://livreec.inrae.fr/


CONTACT ______________________________________________________________
Privilégiez les contacts propres à chaque modèle indiqué dans les
fichiers NetCDF.


ATTENTIONS CONCERNANT LES PROJECTIONS ________________________________
L'approche multi-modèle doit être privilégiée :

 - Les événements temporels isolés ne sont pas des indicateurs
   robustes du changement hydro-climatique.

 - Isoler une trajectoire ne permet pas de conclure quant à la
   plausibilité de la réalisation de ce futur. Isoler un modèle
   hydrologique conduit à privilégier un modèle et à se concentrer
   sur un panel restreint des futurs possibles. 

 - La dispersion des résultats est inhérent aux dynamiques hydro-
   climatologiques et est un message en soi.

 - Rien n'indique que le futur qui va se réaliser est bien dans
   l'ensemble simulé.
   
 - Plus d'informations sur le diagnostic des modèles hydrologiques :
   https://doi.org/10.57745/S6PQXD et sur les bonnes pratiques
   d'exploitation des projections : https://livreec.inrae.fr/

En cas de doutes, retrouvez les messages et enseignements
du projet Explore2 : https://doi.org/10.57745/J3XIPW


DESCRIPTION DES DONNÉES ______________________________________________
Simulations de débits journaliers issus des 9 modèles hydrologiques
Explore2 pour la réanalyse SAFRAN. Ces fichiers NetCDF sont aussi
disponibles au téléchargement sur le portail Drias Eau
(https://www.drias-eau.fr/commande).

Ce dépôt regroupe un fichier NetCDF par modèles hydrologiques.
Retrouvez davantage d'information sur la chaîne de modélisation du
climat dans les métadonnées des fichiers NetCDF et le rapport
https://doi.org/10.57745/PUR7ML.

La description des modèles hydrologiques utilisés est disponible dans
les annexes du rapport https://doi.org/10.57745/S6PQXD. Retrouvez le
diagnostic des modèles hydrologiques résumé à l'échelle des régions
hydrologiques dans les fiches téléchargeables ici :
https://doi.org/10.57745/DMFUXW.

Métadonnées supplémentaires :
- Description de l'ensemble des chaînes de modélisations :
  https://doi.org/10.57745/R6HG5X
- Description de l'ensemble des points de simulation :
  https://doi.org/10.57745/UTKWR5
- Liste des chaînes de modélisation jugées aberrantes / horsains :
  https://doi.org/10.57745/YZNENQ

Décomposition des chaînes de caractères formant le nom des fichiers
NetCDF, séparées par des "_" :
{1}:  Variable : Nom de la variable (avec Adjust si les données sont
      corrigées)
{2}:  Domain : Couverture spatiale des données
{3}:  Reanalysis : Nom de la Réanalyse utilisée en entrée
{4}:  HYDRO-Inst-Model : Identifiant du HYDRO = Institut-Modèle
{5}:  TimeFrequency : Pas de temps du jeu de données
{6}:  Startyear-Endyear : Couverture temporelle des données sous forme
      YYYYMMDD-YYYYMMDD
