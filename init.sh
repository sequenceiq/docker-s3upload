mkdir .aws

cat << EOF > /.aws/config
[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
region = eu-west-1
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
EOF
