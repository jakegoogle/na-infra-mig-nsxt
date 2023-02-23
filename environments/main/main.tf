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

locals {
  env                           = "main"
}

resource "random_id" "random_num" {
  byte_length = 3
}

#### Create Additional Tier 1 Gateway for NAD Segmentation(Policy API)
module "nad_tier1_gw" {
  source             = "../../modules/nsxt-tier1-gateway"
  display_name       = "${var.nad_tier1_gw["display_name"]}-${var.environment}"
  edge_cluster_path  = data.nsxt_policy_edge_cluster.edge_cluster.path
  enable_firewall    = var.enable_firewall
  tier0_gateway_path = data.nsxt_policy_tier0_gateway.tier0_gateway.path
  tags               = var.nad_tier1_tags
}

