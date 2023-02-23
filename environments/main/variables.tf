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

### Environment Variables
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

### NSX Manager Variables 
variable "nsx_provider" {
  type        = map(string)
  description = "NSX Login Details"
}

variable "nsx_data" {
  type        = map(string)
  description = "Existing NSX vars for data sources"
}

### NAD Tier1 Variables
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







