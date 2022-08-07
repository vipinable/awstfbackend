resource "aws_sns_topic" "emailTopic" {
  name                        = "emailTopic"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic_subscription" "emailTopicSubscription" {
  topic_arn = aws_sns_topic.emailTopic.arn
  protocol  = "email"
  endpoint  = "vipinable@gmail.com"
}

resource "aws_iam_role" "iamahywheres3role" {
  name = "iamahywheres3role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["sts:AssumeRole","sts:SetSourceIdentity","sts:TagSession"]
        Effect = "Allow"
        Principal = {
          Service = "rolesanywhere.amazonaws.com"
        }
      },
    ]
  })
}
