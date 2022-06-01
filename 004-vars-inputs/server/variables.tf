# variable "name" {
#     type = map(string)
#     description = "(optional) describe your variable"
#     default = {
#         key1 = "val1"
#         key2 = "val2"
#     }
# }


variable "instance_type" {
    type = string
    description = "(required) insert your instance type for the VM you want!"
    sensitive = true
    validation {
        condition = can(regex("^t2.", var.instance_type))
        error_message = "Instance type should be a t2 family!!!"
    }
    # default = "t2.micro"
}

