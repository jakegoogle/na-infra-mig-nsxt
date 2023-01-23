# Environment Variables
project                         = "rcb-gcve"
region                          = "europe-west6"

nsx = {
  ip          = "172.16.0.11"
  user        = "admin"
  secret_id  = "nsxt-passwd"
}
nsx_data_vars = {
  transport_zone = "TZ-OVERLAY"
  t0_router_name = "Provider-LR"
  edge_cluster   = "edge-cluster"
  t1_router_name = "Tier1`"
}
nsx_rs_vars = {
  t1_router_name = "prd-tier1-router"
}

nsx_tag_scope = "prd-segments"
nsx_tag       = "prd-terraform-segment-policy"

dns_server_list = ["172.16.0.8", "172.16.0.9"]

segment_1 = {
  gw      = "172.24.16.1"
  mask    = "24"
}

segment_2 = {
  gw      = "172.24.17.1"
  mask    = "24"

}

segment_3 = {
  gw      = "172.24.18.1"
  mask    = "24"
}