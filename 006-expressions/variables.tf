variable "languages" {
    type = list

}

variable "lang_map" {
    type = map(string)
    description = "(optional) describe your variable"

}

variable "lang_splat" {
    type = list
    description = "(optional) describe your variable"
}