resource "random_pet" "this" {
  for_each = toset(var.pets)
  length = 1
}

# resource "random_pet" "default" {
#   length = 1
# }

# resource "random_pet" "default" {
#   length = 1
# }
