resource "aws_s3_bucket" "website_bucket" {

  bucket = "devops-project-website-bucket"

  tags = {
    Name = "devops-website"
  }

}
resource "aws_s3_bucket_website_configuration" "website_config" {

  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

}