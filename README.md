docker-s3upload
===============

###Build the image

```
docker build  -t sequenceiq/s3upload .
```

###Use the container

To upload a file to S3 run:

```
docker run 
  --rm 
  --name cbdata 
  -v $FOLDER/:/home/ubuntu/backups/ 
  -v /etc/localtime:/etc/localtime  
  -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" 
  -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY" 
  -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" 
  -e "BUCKET=$BUCKET" 
  -e "FILE_NAME=$FILE_NAME" 
sequenceiq/s3upload 
  -c "put"
```

Where:


| KEY                   | value                       | mandatory | description                                            |
|-----------------------|-----------------------------|-----------|--------------------------------------------------------|
| FOLDER                | /backup                     | yes       | the foldercontaining files to upload                   |
| AWS_ACCESS_KEY_ID     | 123456                      | yes       | your AWS access key                                    |
| AWS_SECRET_ACCESS_KEY | xcdfjkhfkjwehwfpoewufpo324  | yes       | your AWS secret key                                    |
| AWS_DEFAULT_REGION    | eu-west-1                   | yes       | the default AWS region to be used                      |
| FILE_NAME             | test.tar                    | yes       | the name of the file to be uploaded                    |
| BUCKET                | your-bucket                 | yes       | the bucket the file will be uploaded to                |


To download a tar and unpack it in the target folder run:

```
docker run -t 
  --name cbdata 
  -v $FOLDER 
  -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" 
  -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY" 
  -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" 
  -e "BUCKET=$BUCKET" 
  -e "FILE_NAME=$FILE_NAME" 
sequenceiq/s3upload 
  -c "get"
```

| KEY                   | value                       | mandatory | description                                            |
|-----------------------|-----------------------------|-----------|--------------------------------------------------------|
| FOLDER                | /backup                     | yes       | the volume (folder) the snapshot will be downloaded to |
| AWS_ACCESS_KEY_ID     | 123456                      | yes       | your AWS access key                                    |
| AWS_SECRET_ACCESS_KEY | xcdfjkhfkjwehwfpoewufpo324  | yes       | your AWS secret key                                    |
| AWS_DEFAULT_REGION    | eu-west-1                   | yes       | the default AWS region to be used                      |
| FILE_NAME             | test.tar                    | yes       | the file name of the snapshot to be downloaded         |
| BUCKET                | your-bucket                 | yes       | the bucket name the snapshot resides in                |


After the snapshot is downloaded into the specified volume, it can be used by another container as  a "data volume"
