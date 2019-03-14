terraform {
  required_version = ">= 0.11.0"

  # partial configuration: this will get supplied by `-backend-config` CLI args
  backend "s3" {}
}
