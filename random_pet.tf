# random_pet.tf
#
# The resource random_pet generates random pet names that are intended to be
# used as unique identifiers for other resources.
#
# This resource can be used in conjunction with resources that have the
# create_before_destroy lifecycle flag set, to avoid conflicts with unique names
# during the brief period where both the old and new resources exist
# concurrently.
#
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet

resource "random_pet" "pet" {
  keepers = {
    # (Map of String) Arbitrary map of values that, when changed, will trigger recreation of resource.
  }
}
