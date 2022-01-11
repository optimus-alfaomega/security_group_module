variable region {
  type        = string
  default     = "us-east-1"
  description = "registra la región donde despliega el modulo"
}

variable  access_key {
    type = string
    description = "llave de acceso"
}

variable secret_key {
    type = string
    description = "llave secreta de acceso"
}

variable security_group_name {
   type = string
   description = "nombre del security group"
}

variable security_group_description {
    type = string
    description = "descripción del security group"
}

variable own_vpc{
    type = string
    description = "identificador unico en AWS del vpc"
    default = "vpc-e5b4dc98"
}
