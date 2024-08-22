terraform {
  required_version = "1.7.5"
}

module "this" {
    source = "../modules/random-pets"
    pets = [
        "first",
        "second",
        "third"
    ]
}
