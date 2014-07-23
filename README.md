docker-s3upload
===============

Run with:
```
docker run -rm -v $FOLDER/:/home/ubuntu/backups/ -v /etc/localtime:/etc/localtime -e "AWS_ACCESS_KEY_ID=$aws_access_key_id" -e "AWS_SECRET_ACCESS_KEY=$aws_secret_access_key" -e "BUCKET=$BUCKET" -e "FOLDER=/home/ubuntu/backups" -e "FILE_NAME=$FILE_NAME"  s3up
```

| KEY  | value  | mandatory | description |
| :------------ |:---------------:| -----:| -----:|
| FOLDER      | /backup | yes | the mapped folder |
| AWS_ACCESS_KEY_ID      | 123456        | yes | your aws access key |
| AWS_SECRET_ACCESS_KEY | xcdfjkhfkjwehwfpoewufpo324        |    yes | your aws secret access key |
| FILE_NAME | test.tar        |    yes | the file name which you want to upload |
| BUCKET | seq-db        |    yes | the bucket name which is the target |
