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

output "nsx_tier1_gateway_id" {
  description = "The NSX resource ID for the created Tier1 gateway."
  value       = module.nad_tier1_gw.id
}

output "nsx_tier1_gateway_path" {
  description = "The NSX resource path for the created Tier1 gateway."
  value       = module.nad_tier1_gw.path
}

output "nsx_tier1_gateway_revision" {
  description = "The NSX object revision path for the created Tier1 gateway."
  value       = module.nad_tier1_gw.revision
}