#!/bin/bash

if [ "$2" = "put" ]; then

  echo "Uploading sbapshot ..."
  aws s3 cp "$FOLDER/$FILE_NAME" "s3://$BUCKET/"
  echo "DONE";

elif [ "$2" = "get" ]; then

  echo "Get getting snapshot: s3://${BUCKET}/${FILE_NAME}"
  aws s3 cp "s3://${BUCKET}/${FILE_NAME}" /tmp

  echo "Unpacking snapshot data ..."
  tar -xf "/tmp/${FILE_NAME}" -C /

  echo "Done.";

elif [ "$2" = "migrate" ]; then

  echo "Getting liquibase changelogs"
  aws s3 cp "s3://liquibase-changelogs/changelogs.tar" /tmp

  echo "Unpacking changelogs"
  tar -xf "/tmp/changelogs.tar" -C /

  source /setup_liquibase.sh;

  echo "Updating database..."
  liquibase --changeLogFile="/changelogs/cb_changelog.xml" update
  echo "Done."

else
  echo "Invalid or no argument provided";
fi
