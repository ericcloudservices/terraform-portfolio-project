terraform {
	backend "s3" {
		bucket = "eric-big-bucket-beyond"
		key = "global/s3/terraform.tfstate"
		region = "us-west-1"
		use_lockfile = true

    }
}