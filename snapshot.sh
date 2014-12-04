#!/bin/bash

if [ "$2" = "put" ]; then

  echo "Uploading snapshot ..."
  aws s3 cp "$FOLDER/$FILE_NAME" "s3://$BUCKET/"
  echo "Done.";

elif [ "$2" = "get" ]; then

  echo "Get getting snapshot: s3://${BUCKET}/${FILE_NAME}"
  aws s3 cp "s3://${BUCKET}/${FILE_NAME}" /tmp

  echo "Done.";
else
  echo "Invalid or no argument provided";
fi
