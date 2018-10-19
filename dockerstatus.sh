runsdefault="16"
runs=$(docker ps -a -f status=running |egrep -v ^CONTAINER |wc -l)
docker ps -a -f status=running
echo

if [ "$runs" -lt "$runsdefault" ]; then

  echo "Services running: $runs from: $runsdefault"
  echo
  echo "one or more services are stopped! please verify that!"

elif [ "$runs" -gt "$runsdefault" ]; then

  echo "Services running: $runs from: $runsdefault"
  echo
  echo "found one service more then default: $runsdefault maybe new services after upgrade? please check that"

else

  echo "Services running: $runs from: $runsdefault"

fi
