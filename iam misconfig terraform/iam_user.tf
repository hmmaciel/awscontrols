#Overly permissive Policy
resource "aws_iam_access_key" "billy" {
  user = aws_iam_user.billy.name
}

resource "aws_iam_user" "billy" {
  name = "billy"
}

resource "aws_iam_user_policy_attachment" "iam-read-policy-attach" {
  user       = aws_iam_user.billy.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

resource "aws_iam_user_policy" "attach-user-policy" {
  name = "AttachUserPolicy"
  user = aws_iam_user.billy.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:AttachUserPolicy"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::*:user/*"
    }
  ]
}
EOF
}

/*
resource "aws_iam_role" "misconfig-role" {
  name               = "misconfig-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": "*"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
*/