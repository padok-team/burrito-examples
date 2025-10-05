resource "random_id" "db" {
  byte_length = 2
  prefix      = var.app_name
}

resource "null_resource" "db_migrate" {
  triggers = {
    db  = random_id.db.hex
    app = var.app_name
  }
}

output "db_id" {
  value = random_id.db.hex
}

