resource "aws_kms_key" "vault_backend_key" {
  description = "Vault S3 bucket encryption key"
  deletion_window_in_days = 10

  tags = "${module.env.tags}"
}

resource "aws_s3_bucket" "vault_s3_bucket" {
  bucket = "${local.vault_bucket}"
  region = "${var.aws_region}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.vault_backend_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = "${module.env.tags}"

  lifecycle {
    create_before_destroy = true
  }
}
