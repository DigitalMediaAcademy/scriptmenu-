#menuOptionsNew
studentPath="/Users/student"
a=1
echo "--------------Menu Options-----------------"
while true; do
 optionsNew=("Create Student" "Delete Student" "Install Adobe" "Repair Wifi" "Fix Massive" "Fix Izotope" "Quit")
 select optN in "${optionsNew[@]}"
  do
      case $optN in
          "Create Student")
              if [ -d "$studentPath" ]; then
                echo "Student account already exists, you need to delete the student account first."
              else
                sudo sysadminctl -addUser student -fullName "Student" -password "" -home /Users/"student" -picture ~/Pictures/dmateen.tif
  	            sudo mkdir /Users/"student"
  	            sudo chown -R "student":staff /Users/"student"
  	            #add "staff" to developer wheel
  	            sudo /usr/sbin/dseditgroup -o edit -t group -a staff _developer
  	            #copy os x tempalte
  	            sudo cp -R /System/Library/User\ Template/English.lproj/ /Users/student/
  	            sudo cp -R /System/Library/User\ Template/Non_localized/ /Users/student/
  	            sudo chown -R "student":staff /Users/"student"
              fi
              break
              ;;
          "Delete Student")
              sudo sysadminctl -deleteUser student -secure
              break
              ;;
          "Install Adobe")
              osascript officialAdobeScript.scpt
              break
              ;;
          "Repair Wifi")
              osascript wyfifix.scpt
              break
              ;;
          "Fix Massive")
              osascript massiveRepair.scpt
              break
              ;;
          "Fix Izotope")
              osascript repairIzotope.scpt
              break
              ;;
          "Fix Arduino")
              osacript newArdhahfix.scpt
              break
              ;;
          "Quit")
              break
              ;;

      esac
  done
  read -p "Would you like to continue y/n" yn
    case $yn in
      [Yy]*) ;;
      [Nn]*) break;;
    esac
done
