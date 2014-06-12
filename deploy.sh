#!/bin/bash

# check si ruby et git sont installes
$ ruby -e 'puts "Welcome to Ruby"' Welcome to Ruby $ git --version git version 1.7.11.1

#Installation de ruby et git en tant qu'administrateur
sudo apt-get install ruby-full rubygems git-core

#Installation d'Openshift
sudo gem install rhc

#Connexion a Openshift (login : **********  mdp : **********)
rhc setup

#Creation d'une application PHP et ajout des extensions mysql et phpmyadmin pour gérer la base de données
rhc app create -a dossierOS -r /git/repo -t php-5.3 -t mysql-5.5 -t phpmyadmin

# Ajout manuel de la base de donnees et reglages des parametres dans le fichier const.php
#Ajout de la cle SSH pour lier Openshift a Github
set ssh://536a4da04382ecb232000018@dossieros-wkerrand.rhcloud.com/~/git/dossieros.git/ dossierOS admin71IshSFn 2ZyDK7anjqJy


#La suite de ce fichier bash permet soit de cloner, de 'commit' ou de 'pudh' les changements faits dans le repository 'github' du projet
#Notes :
#  - Verifier d'etre dans le bon directory avant de cloner
#  - Spécifier l'argument demandé avant de 'commit' (./deploy.sh file.txt ) 
#  - 'Push' le travail seulement apres avoir clone

PS3="Pick an option (1-6):" 
select i in Init Clone Add Commit Push Exit; do
	case $i in 
		Init) git init;;
		Clone) git clone https://github.com/wkerrand/Openshift-project.git; echo '<?php define("DB_HOST", "localhost"); define("DB_LOGIN", "'$2'"); define("DB_PASS", "'$3'"); define("DB_BDD", "'$1'");  ?>' > config.php;;
 		Add) git add $1;;
 		Commit) git commit -m "Some changes have been added to the project, please refer to the author for more details.";;
		Push) git push origin master;; 
		Exit) echo "Goodbye!"; break;;
		*) echo "Invalid option. Try another one."; continue;;
 	esac 
done
