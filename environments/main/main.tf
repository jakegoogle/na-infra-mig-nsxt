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

########################### DNS Default Forwarding Zone & Service ###########################
resource "nsxt_policy_dns_forwarder_zone" "default" {
  display_name     = "default"
  description      = "Terraform provisioned Zone"
  upstream_servers = ["10.1.1.6"]
}

resource "nsxt_policy_gateway_dns_forwarder" "t0_gateway_service" {
  display_name = "dns-nsx"
  description  = "Terraform provisioned Zone"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_gateway.path
  listener_ip  = "10.200.0.6"
  enabled      = true
  log_level    = "INFO"

  default_forwarder_zone_path      = nsxt_policy_dns_forwarder_zone.default.path
}

########################### NAD Tier 1 Gateway Segmentation(Policy API) ###########################
module "nad_tier1_gw" {
  source             = "../../modules/nsxt-tier1-gateway"
  display_name       = "${var.nad_tier1_gw["display_name"]}-${var.environment}"
  edge_cluster_path  = data.nsxt_policy_edge_cluster.edge_cluster.path
  enable_firewall    = var.nad_tier1_gw["enable_firewall"]
  tier0_gateway_path = data.nsxt_policy_tier0_gateway.tier0_gateway.path
  tags               = var.nad_tier1_tags
}

module "nad_pci_dmz_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.nad_tier1_gw.path
  display_name        = var.nad_tier1_gw["pci_dmz_name"]
  segment_cidr        = var.nad_tier1_gw["pci_dmz_cidr"]
}

module "nad_pci_protected_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.nad_tier1_gw.path
  display_name        = var.nad_tier1_gw["pci_protected_name"]
  segment_cidr        = var.nad_tier1_gw["pci_protected_cidr"]
}

module "nad_nonpci_dmz_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.nad_tier1_gw.path
  display_name        = var.nad_tier1_gw["nonpci_dmz_name"]
  segment_cidr        = var.nad_tier1_gw["nonpci_dmz_cidr"]
}

module "nad_nonpci_protected_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.nad_tier1_gw.path
  display_name        = var.nad_tier1_gw["nonpci_protected_name"]
  segment_cidr        = var.nad_tier1_gw["nonpci_protected_cidr"]
}
########################### BRZ Tier 1 Gateway Segmentation(Policy API) ###########################
module "brz_tier1_gw" {
  source             = "../../modules/nsxt-tier1-gateway"
  display_name       = "${var.brz_tier1_gw["display_name"]}-${var.environment}"
  edge_cluster_path  = data.nsxt_policy_edge_cluster.edge_cluster.path
  enable_firewall    = var.brz_tier1_gw["enable_firewall"]
  tier0_gateway_path = data.nsxt_policy_tier0_gateway.tier0_gateway.path
  tags               = var.brz_tier1_tags
}

module "brz_pci_dmz_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.brz_tier1_gw.path
  display_name        = var.brz_tier1_gw["pci_dmz_name"]
  segment_cidr        = var.brz_tier1_gw["pci_dmz_cidr"]
}

module "brz_pci_protected_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.brz_tier1_gw.path
  display_name        = var.brz_tier1_gw["pci_protected_name"]
  segment_cidr        = var.brz_tier1_gw["pci_protected_cidr"]
}

module "brz_nonpci_dmz_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.brz_tier1_gw.path
  display_name        = var.brz_tier1_gw["nonpci_dmz_name"]
  segment_cidr        = var.brz_tier1_gw["nonpci_dmz_cidr"]
}

module "brz_nonpci_protected_segment" {
  source              = "../../modules/nsxt-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = module.brz_tier1_gw.path
  display_name        = var.brz_tier1_gw["nonpci_protected_name"]
  segment_cidr        = var.brz_tier1_gw["nonpci_protected_cidr"]
}
########################### NAD FW Manager Rule ###########################
/*
nsxt_dfw_section_description  = "New Section created using GCVE IaC Foundations"
nsxt_dfw_section_display_name = "GCVE IaC Foundations Section"
nsxt_dfw_insert_before_section= "Default Layer3 Section"
nsxt_dfw_section_type         = "LAYER3"
nsxt_dfw_section_applied_to   = {}

nsxt_dfw_rules = [
  {
    display_name             = "gcve-iac-rule1"
    description              = "gcve-iac-rule1-description"
    disabled                 = false
    action                   = "ALLOW"
    direction                = "IN"
    logged                   = false
    ip_protocol              = "IPV4"
    destinations_excluded    = false
    source_ip_set_names      = ["ip_set_source_1", "ip_set_source_2"]
    destination_ip_set_names = ["ip_set_dest_1"]
    services                 = ["ex-l4-service-1", "ex-l4-service-2"]
  },
  {
    display_name             = "gcve-iac-rule2"
    description              = "gcve-iac-rule2-description"
    disabled                 = true
    action                   = "ALLOW"
    direction                = "OUT"
    logged                   = true
    ip_protocol              = "IPV4"
    destinations_excluded    = false
    source_ip_set_names      = ["ip_set_source_2"]
    destination_ip_set_names = []
    services                 = []
  }
]

nsxt_dfw_ip_sets = {
  "ip_set_source_1" = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"],
  "ip_set_source_2" = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"],
  "ip_set_dest_1"   = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

nsxt_dfw_custom_l4_services = {
  "ex-l4-service-1" = {
    description       = "Sample TCP port 88"
    protocol          = "TCP"
    destination_ports = ["73", "8080", "81"]
    source_ports      = []
    tags              = { foo = "bar" }
  },
  "ex-l4-service-2" = {
    description       = "Sample TCP port 8888"
    protocol          = "TCP"
    destination_ports = ["8888"]
    source_ports      = ["1234"]
    tags              = { foo = "bar" }
  },
}

nsxt_dfw_section_tags = {
  environment_policy = "pci_protected"
}
*/