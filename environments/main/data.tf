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

data "google_project" "project" {
  project_id = var.project
}


data "google_secret_manager_secret" "eu_west6_nsx_passwd" {
  secret_id = var.nsx["secret_id"]
}

data "google_secret_manager_secret_version" "eu_west6_nsx_passwd_data" {
  secret = data.google_secret_manager_secret.eu_west6_nsx_passwd.secret_id
}
/*
data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = var.nsx_data_vars["transport_zone"]
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = var.nsx_data_vars["t0_router_name"]
}

data "nsxt_policy_edge_cluster" "edge_cluster" {
  display_name = var.nsx_data_vars["edge_cluster"]
}
*/