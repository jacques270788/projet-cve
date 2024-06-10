# cve-api

Ce programme (en thread daemon) récupère quotidiennement les données des CVE OpenCVE, CVEMaps et OSV dans une liste de service, via une API, afin de les stocker dans une base de données.
Cette base de données sera ensuite passée dans un visualiseur afin de créer des mails d'alerte et des bilans CVE pour les projets concernés.

cve-api utilise MySQL et Docker. Si vous voulez exécuter MySQL dans Visual Studio Code, [suivez cette procédure](https://www.geeksforgeeks.org/how-to-connect-to-mysql-server-using-vs-code-and-fix-errors/). 
