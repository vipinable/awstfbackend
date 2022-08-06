resource "aws_sns_topic" "emailTopic" {
  name                        = "emailTopic"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic_subscription" "emailTopicSubscription" {
  topic_arn = aws_sns_topic.emailTopic.arn
  protocol  = "email"
  endpoint  = "vipinable@gmail.com"
}
