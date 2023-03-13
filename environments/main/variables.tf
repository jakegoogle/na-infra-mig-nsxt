# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

########################### Environment Variables ###########################
variable "project" {
  type = string
  description = "The project ID to deploy to"
}

variable "region" {
  type = string
  description = "The region to use"
  default     = "eu-west6"
}

variable "environment" {
  type = string
  description = "The environment resources are being deployed in"
  default     = "dev"
}

variable "dns_server_list" {
  type        = list(string)
  description = "DNS Servers"
}

########################### NSX Manager Variables ###########################
variable "nsx_provider" {
  type        = map(string)
  description = "NSX Login Details"
}

variable "nsx_data" {
  type        = map(string)
  description = "Existing NSX vars for data sources"
}

########################### NAD Tier1 Variables ###########################
variable "nad_tier1_gw" {
  description = "A map of tier1 gateway variables"
  type        = map(string)
  default     = {}
}

variable "nad_tier1_tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}
########################### BRZ Tier1 Variables ###########################
variable "brz_tier1_gw" {
  description = "A map of tier1 gateway variables"
  type        = map(string)
  default     = {}
}

variable "brz_tier1_tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}
########################### YAH Tier1 Variables ###########################
variable "yah_tier1_gw" {
  description = "A map of tier1 gateway variables"
  type        = map(string)
  default     = {}
}

variable "yah_tier1_tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}
########################### ROSA Tier1 Variables ###########################
variable "rosa_tier1_gw" {
  description = "A map of tier1 gateway variables"
  type        = map(string)
  default     = {}
}

variable "rosa_tier1_tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}
########################### TEV Tier1 Variables ###########################
/*variable "tev_tier1_gw" {
  description = "A map of tier1 gateway variables"
  type        = map(string)
  default     = {}
}

variable "tev_tier1_tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}*/
/*
########################### NAD Distributed FW Manger ###########################
variable "nsxt_dfw_resource_description" {
  description = "A string added to the description field of all created resources"
  type        = string
  default     = "Terraform provisioned"
}

variable "nsxt_dfw_section_description" {
  type        = string
  description = "Description of the DFW Section to be created."
}

variable "nsxt_dfw_section_display_name" {
  type        = string
  description = "Display Name of the DFW Section to be created."
}

variable "nsxt_dfw_insert_before_section" {
  type        = string
  description = "Firewall section name that should come immediately after the one created."
}

variable "nsxt_dfw_section_type" {
  type        = string
  description = "Firewall section for DFW rules"
  default     = "LAYER3"
}

variable "nsxt_dfw_section_tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}

variable "nsxt_dfw_section_applied_to" {
  description = "A map of NSX-T target_type:target_id pairs"
  type        = map(string)
  default     = {}
}

variable "nsxt_dfw_rules" {
  description = "A list of objects which describe firewall rules. Rule objects allow all properties in the Terraform nsxt_policy_gateway_policy rule object."
  type = list(object({
    display_name             = string
    description              = optional(string)
    disabled                 = optional(bool)
    action                   = optional(string)
    direction                = optional(string)
    logged                   = optional(bool)
    ip_protocol              = optional(string)
    destinations_excluded    = optional(bool)
    source_ip_set_names      = optional(list(string))
    destination_ip_set_names = optional(list(string))
    services                 = optional(list(string))
    tags                     = optional(map(string))
  }))
  default = []
}

variable "nsxt_dfw_ip_sets" {
  type        = map(list(string))
  description = "IP sets as key value pairs"
  default = {
    "ip_set_source_1" = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"],
    "ip_set_source_2" = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"],
    "ip_set_dest_1"   = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  }
}

variable "nsxt_dfw_custom_l4_services" {
  description = <<EOT
A map of objects which is used to define custom TCP/UDP services which can be
added to firewall rules. Service objects allow all properties in the Terraform
[nsxt_policy_service l4_port_set_entry object]
(https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_service#l4_port_set_entry)
EOT
  type = map(object({
    description       = string
    protocol          = optional(string)
    destination_ports = optional(list(number))
    source_ports      = optional(list(number))
    tags              = optional(map(string))
  }))
  default = {}
}
*/



