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
/*

locals {
  env                           = "main"
}

resource "random_id" "random_num" {
  byte_length = 3
}

#### Create Additional Tier 1 Gateway for Segmentation(Policy API)
resource "nsxt_policy_tier1_gateway" "prd_tier1" {
  display_name              = "prd-tier1-${lower(random_id.random_num.hex)}"
  description               = "Tuier 1 Gateway created by TF"
  edge_cluster_path         = data.nsxt_policy_edge_cluster.edge_cluster.path
  failover_mode             = "PREEMPTIVE"
  default_rule_logging      = "false"
  enable_firewall           = "false"
  enable_standby_relocation = "false"
  tier0_path                = data.nsxt_policy_tier0_gateway.tier0_router.path
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
  pool_allocation           = "ROUTING"

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }
}

#### Create Segment 1(Policy API)
resource "nsxt_policy_segment" "segment_1" {
  display_name        = "segment1-policy-${lower(random_id.random_num.hex)}"
  description         = "Segment created by TF"
  connectivity_path   = nsxt_policy_tier1_gateway.prd_tier1.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  subnet {
    cidr = "${var.segment_1["gw"]}/${var.segment_1["mask"]}"
  }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

}


#### Create Segment 2(Policy API)
resource "nsxt_policy_segment" "segment_2" {
  display_name        = "segment2-policy-${lower(random_id.random_num.hex)}"
  description         = "Segment created by TF"
  connectivity_path   = nsxt_policy_tier1_gateway.prd_tier1.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  subnet {
    cidr = "${var.segment_2["gw"]}/${var.segment_2["mask"]}"
  }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

}

#### Create Segment 3(Policy API)
resource "nsxt_policy_segment" "segment_3" {
  display_name        = "segment3-policy-${lower(random_id.random_num.hex)}"
  description         = "Segment created by TF"
  connectivity_path   = nsxt_policy_tier1_gateway.prd_tier1.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  subnet {
    cidr = "${var.segment_3["gw"]}/${var.segment_3["mask"]}"
  }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

}
*/

