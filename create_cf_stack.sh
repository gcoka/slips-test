aws --region us-east-1 \
  --profile gemcook \
  cloudformation create-stack \
  --stack-name gcoka-s3-with-sns \
  --template-body file://./cf/S3withSNS.cf.yml \
  --parameters \
    ParameterKey=AppName,ParameterValue=slips-log-bucket \
    ParameterKey=Stage,ParameterValue=develop
# スタックが出来上がるまで待つ
aws --region us-east-1 \
  --profile gemcook \
  cloudformation wait stack-create-complete \
  --stack-name gcoka-s3-with-sns
# スタックのイベントを表示
aws --region us-east-1 \
  --profile gemcook \
  cloudformation describe-stack-events \
  --stack-name gcoka-s3-with-sns \
  | egrep "(FAILED|CREATE_COMPLETE)"