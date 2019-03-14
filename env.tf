# configures the project environment details

module "env" {
  source = "github.com/dgillman/tf-aws-env?ref=0.0.4"

  # internal eTinerant project
  client = "etinerant"
  project = "clientvault"
  release_phase = "${var.release_phase}"
}
