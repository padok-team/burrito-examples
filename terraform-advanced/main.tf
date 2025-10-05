locals {
  envs = ["dev", "stg", "prod", "qa"]
}

resource "time_static" "now" {}

resource "random_pet" "root" {
  length  = 2
  keepers = { ts = time_static.now.id }
}

resource "local_file" "greeting" {
  filename = "${path.module}/greeting.txt"
  content  = "hello ${random_pet.root.id}"
}

resource "local_file" "greeting2" {
  filename = "${path.module}/greeting.txt"
  content  = "hello !!!"
}

data "local_file" "greeting" {
  filename = local_file.greeting.filename
}

resource "null_resource" "notify" {
  triggers = {
    content_sha = data.local_file.greeting.content_sha256
  }
}

module "app" {
  source      = "./modules/app"
  name_prefix = random_pet.root.id
}

module "db" {
  source   = "./modules/db"
  app_name = format("%s-db", module.app.app_name)
}

// A for_each collection to generate multiple instances
resource "random_pet" "items" {
  for_each = toset(local.envs)
  length   = 1
}

resource "null_resource" "per_env" {
  for_each = toset(local.envs)
  triggers = {
    pet    = random_pet.items[each.key].id
    db_hex = module.db.db_id
  }
}

output "app_name" {
  value = module.app.app_name
}

output "db_id" {
  value = module.db.db_id
}

