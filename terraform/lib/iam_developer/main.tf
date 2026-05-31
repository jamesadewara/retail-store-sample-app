# IAM User for developer access
resource "aws_iam_user" "dev_view" {
  name = "bedrock-dev-view"

  tags = {
    Project = "karatu-2025-capstone"
  }
}

# Console access password
resource "aws_iam_user_login_profile" "dev_view" {
  user                    = aws_iam_user.dev_view.name
  password_reset_required = false
}

# AWS ReadOnlyAccess policy
resource "aws_iam_user_policy_attachment" "dev_view_readonly" {
  user       = aws_iam_user.dev_view.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# S3 PutObject for assets bucket
resource "aws_iam_user_policy" "dev_view_s3" {
  name = "bedrock-dev-view-s3"
  user = aws_iam_user.dev_view.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "s3:PutObject"
      Resource = "arn:aws:s3:::bedrock-assets-altsoe0253359/*"
    }]
  })
}

# Access keys for programmatic access
resource "aws_iam_access_key" "dev_view" {
  user = aws_iam_user.dev_view.name
}

# Outputs for grading
output "dev_view_access_key_id" {
  value = aws_iam_access_key.dev_view.id
}

output "dev_view_secret_access_key" {
  value     = aws_iam_access_key.dev_view.secret
  sensitive = true
}

output "dev_view_console_password" {
  value     = aws_iam_user_login_profile.dev_view.password
  sensitive = true
}