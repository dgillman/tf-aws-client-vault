module "env" {
  source = "github.com/dgillman/tf-aws-env?ref=0.0.4"

  client = "etinerant"
  project = "clientvault"
  release_phase = "${var.release_phase}"
}
