terraform {
    cloud {
      organization = "hcp-workspace"
      workspaces {
        name = "security-workspace"
      }
    }
}
# data "terraform_remote_state" "network" {
#   backend = "remote"
#   config = {
#     organization = "hcp-workspace"
#     workspaces = {
#       name = "network-workspace"
#     }
#   }
# }
# output "val" {
#   value = data.terraform_remote_state.network.outputs.ip_list
# }

data "tfe_outputs" "out" {
  organization = "hcp-workspace"
  workspace    = "network-workspace"
}

output "name" {
  value = data.tfe_outputs.out.nonsensitive_values.ip_list
}
