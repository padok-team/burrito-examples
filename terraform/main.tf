terraform {
  required_version = "~> 1.7.0"
}

module "this" {
    source = "../modules/random-pets"
    pets = [
        "first",
        "second",
        "third"
    ]
}
