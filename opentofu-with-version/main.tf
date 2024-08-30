terraform {
  required_version = "1.8.1"
}

module "this" {
    source = "../modules/random-pets"
    pets = [
        "first",
        "second",
        "third"
    ]
}
