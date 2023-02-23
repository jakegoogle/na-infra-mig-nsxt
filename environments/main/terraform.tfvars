### Environment Variables
project         = "rcb-gcve"
region          = "europe-west6"
environment     = "dev"
dns_server_list = ["ns2-159134.fad11561.europe-west6.gve.goog", "ns1-159133.fad11561.europe-west6.gve.goog"]

### NSX Manager Variables
nsx_provider = {
  ip          = "172.16.0.66"
  dns         = "nsx-159736.fad11561.europe-west6.gve.goog"
  user        = "admin"
  secret_id   = "nsxt-passwd"
}

nsx_data = {
  transport_zone = "TZ-OVERLAY"
  edge_cluster   = "edge-cluster"
}

### NAD Tier1 Variables
nad_tier1_gw = {
  display_name     = "nad"
  t0_router_name   = "Provider-LR"
  edge_cluster     = "edge-cluster"
  enable_firewall  = "true"
}

nad_tier1_tags         = { 
  region      = "nad"
  environment = "dev" 
}

