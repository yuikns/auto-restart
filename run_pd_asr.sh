#!/usr/bin/env bash
PID=$$
echo "Current PID:$PID"
LOG_FILE=./as-log-$PID

while true; do
  if [ -f $LOG_FILE ]; then
    echo "Processing LOG_FILE:$LOG_FILE"
    LAST_MST=$(tail -n 100 $LOG_FILE | grep "recognizing" | tail -n1 )
    echo "MSG:$LAST_MST"
    ID=$(echo $LAST_MST |  sed 's/[^O]*\(ObjectId('.*')\).*/\1/' | cut -d "'" -f 2)
    echo "Please Remove It by id: $ID"
  fi
  python main.py | tee $LOG_FILE
  echo "Crashed!!"
  sleep 2 # wait a moment, restart
done


