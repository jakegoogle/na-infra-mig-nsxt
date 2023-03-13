########################### Environment Variables ###########################
project         = "rcb-gcve"
region          = "europe-west6"
environment     = "dev"
dns_server_list = ["ns2-159134.fad11561.europe-west6.gve.goog", "ns1-159133.fad11561.europe-west6.gve.goog"]

########################### NSX Manager Variables ###########################
nsx_provider = {
  ip          = "172.16.0.66"
  dns         = "nsx-159736.fad11561.europe-west6.gve.goog"
  user        = "admin"
  secret_id   = "nsxt-passwd"
}

nsx_data = {
  transport_zone = "TZ-OVERLAY"
  t0_router_name   = "Provider-LR"
  edge_cluster   = "edge-cluster"
}

########################### NAD Tier1 Variables ###########################
nad_tier1_gw = {
  display_name              = "nad"
  edge_cluster              = "edge-cluster"
  enable_firewall           = "true"
  pci_dmz_name              = "nad_pci_dmz"
  pci_dmz_cidr              = "10.100.10.1/24"
  pci_protected_name        = "nad_pci_protected"
  pci_protected_cidr        = "10.100.20.1/24"
  nonpci_dmz_name           = "nad_nonpci_dmz"
  nonpci_dmz_cidr           = "10.100.30.1/24"
  nonpci_protected_name     = "nad_nonpci_protected"
  nonpci_protected_cidr     = "10.100.40.1/24"
}

nad_tier1_tags         = { 
  region      = "nad"
  environment = "dev" 
}

########################### BRZ Tier1 Variables ###########################
brz_tier1_gw = {
  display_name              = "brz"
  edge_cluster              = "edge-cluster"
  enable_firewall           = "true"
  pci_dmz_name              = "brz_pci_dmz"
  pci_dmz_cidr              = "10.110.10.1/24"
  pci_protected_name        = "brz_pci_protected"
  pci_protected_cidr        = "10.110.20.1/24"
  nonpci_dmz_name           = "brz_nonpci_dmz"
  nonpci_dmz_cidr           = "10.110.30.1/24"
  nonpci_protected_name     = "brz_nonpci_protected"
  nonpci_protected_cidr     = "10.110.40.1/24"
}

brz_tier1_tags         = { 
  region      = "brz"
  environment = "dev" 
}
########################### YAH Tier1 Variables ###########################
yah_tier1_gw = {
  display_name              = "yah"
  edge_cluster              = "edge-cluster"
  enable_firewall           = "true"
  pci_dmz_name              = "yah_pci_dmz"
  pci_dmz_cidr              = "10.120.10.1/24"
  pci_protected_name        = "yah_pci_protected"
  pci_protected_cidr        = "10.120.20.1/24"
  nonpci_dmz_name           = "yah_nonpci_dmz"
  nonpci_dmz_cidr           = "10.120.30.1/24"
  nonpci_protected_name     = "yah_nonpci_protected"
  nonpci_protected_cidr     = "10.120.40.1/24"
}

yah_tier1_tags         = { 
  region      = "yah"
  environment = "dev" 
}
########################### ROSA Tier1 Variables ###########################
rosa_tier1_gw = {
  display_name              = "rosa"
  edge_cluster              = "edge-cluster"
  enable_firewall           = "true"
  pci_dmz_name              = "rosa_pci_dmz"
  pci_dmz_cidr              = "10.130.10.1/24"
  pci_protected_name        = "rosa_pci_protected"
  pci_protected_cidr        = "10.130.20.1/24"
  nonpci_dmz_name           = "rosa_nonpci_dmz"
  nonpci_dmz_cidr           = "10.130.30.1/24"
  nonpci_protected_name     = "rosa_nonpci_protected"
  nonpci_protected_cidr     = "10.130.40.1/24"
}

rosa_tier1_tags         = { 
  region      = "rosa"
  environment = "dev" 
}
########################### TEV Tier1 Variables ###########################
tev_tier1_gw = {
  display_name              = "tev"
  edge_cluster              = "edge-cluster"
  enable_firewall           = "true"
  pci_dmz_name              = "tev_pci_dmz"
  pci_dmz_cidr              = "10.140.10.1/24"
  pci_protected_name        = "tev_pci_protected"
  pci_protected_cidr        = "10.140.20.1/24"
  nonpci_dmz_name           = "tev_nonpci_dmz"
  nonpci_dmz_cidr           = "10.140.30.1/24"
  nonpci_protected_name     = "tev_nonpci_protected"
  nonpci_protected_cidr     = "10.140.40.1/24"
}

tev_tier1_tags         = { 
  region      = "tev"
  environment = "dev" 
}
########################### NAD Distributed FW Manger ###########################
