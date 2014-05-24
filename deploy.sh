#!/bin/bash

#This bash file can be used to either clone, commit or push changes into the github repository of the project
#Notes :
#  - Please make sure to be in the desired directory before cloning
#  - Please specify the argument required before commiting (./deploy.sh file.txt ) 
#  - Push works only after cloning

PS3="Pick an option (1-4):" 
select i in Clone Commit Push Exit; do
	case $i in 
		Clone) git clone https://github.com/wkerrand/Openshift-project.git;;
 		Commit) git add $1 git commit -m "Some changes have been added to the project, please refer to the author for more details.";;
		Push) git push origin master;; 
		Exit) echo "Goodbye!"; break;;
		*) echo "Invalid option. Try another one."; continue;;
 	esac 
done
