terraform {
  required_version = "~> 1.7"
}

module "this" {
    source = "../modules/random-pets"
    pets = [
        "first",
        "second",
        "third"
    ]
}
