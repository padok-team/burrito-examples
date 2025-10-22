variable "name_prefix" {
  type = string
}

resource "random_pet" "app" {
  length = 2
}

# small setup trigger for the app - useful in examples
resource "null_resource" "app_setup" {
  count = 1
  triggers = {
    app    = random_pet.app.id
    prefix = var.name_prefix
  }
}

output "app_name" {
  value = "${var.name_prefix}-${random_pet.app.id}"
}

