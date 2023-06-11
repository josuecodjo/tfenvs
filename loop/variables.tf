variable "mapcontainer" {
  description = "Définition d'un container"
  type = map(object({
    podname = string
    labels  = map(string)
    image   = string
    name    = string
    port    = number
  }))
}

variable "map_ns" {
  type = map(string)
}