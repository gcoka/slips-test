aws --region us-east-1 \
  --profile gemcook \
  cloudformation delete-stack \
  --stack-name gcoka-s3-with-sns
# スタックが削除完了まで待つ
aws --region us-east-1 \
  --profile gemcook \
  cloudformation wait stack-delete-complete \
  --stack-name gcoka-s3-with-sns
