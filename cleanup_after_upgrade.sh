cho
docker ps -a -f status=running
echo
echo

while true; do
    read -p "Do you want to cleanup further garbage collected by Docker, please make sure all containers are up and running before cleaning your system by executing? y/n " yn
    case $yn in
        [Yy]* ) docker system prune; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
