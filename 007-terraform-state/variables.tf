variable "languages" {
    type = list

}

variable "lang_map" {
    type = map
    description = "(optional) describe your variable"

}

variable "lang_splat" {
    type = list
    description = "(optional) describe your variable"
}


variable "tuple_test" {
  type = tuple([string, number, string])
}

variable "object_test" {
    type = object({
        name = string
        age = number
        is_married = bool
        kids = list(string)
    })
    description = "(optional) describe your variable"
}