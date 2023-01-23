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


variable "project" {
  type = string
  description = "The project ID to deploy to"
}

variable "region" {
  type = string
  description = "The region to use"
  default     = "eu-west6"
}

# configure some variables first 
variable "nsx" {
  type        = map(string)
  description = "NSX Login Details"
}

variable "nsx_data_vars" {
  type        = map(string)
  description = "Existing NSX vars for data sources"
}

variable "nsx_rs_vars" {
  type        = map(string)
  description = "NSX vars for the resources"
}

variable "nsx_tag_scope" {
  type        = string
  description = "Scope for the tag that will be applied to all resources"
}

variable "nsx_tag" {
  type        = string
  description = "Tag, the value for the scope above"
}

variable "segment_1" {
  type        = map(string)
  description = "NSX vars for the resources"
}

variable "segment_2" {
  type        = map(string)
  description = "NSX vars for the resources"
}
variable "segment_3" {
  type        = map(string)
  description = "NSX vars for the resources"
}

variable "dns_server_list" {
  type        = list(string)
  description = "DNS Servers"
}
