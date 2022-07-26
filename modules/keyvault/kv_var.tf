variable "location" {
    description =  "(Required) Keyvault Location"
    default = "northeurope"  
}

variable "kv_name" {
    description =  "Name of the Keyvault"
    default = "techslate-ade-kv"  
}


variable "rg_name" {
    description =  "Name of the Resource Group"
    default = ""  
}

variable "tenant_id" {
    description =  "Tenant Id"
    default = ""  
}

variable "object_id" {
    description =  "Tenant Id"
    default = ""  
}
