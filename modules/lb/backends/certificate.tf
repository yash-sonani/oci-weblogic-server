resource "tls_private_key" "ss_private_key" {
  count = var.add_load_balancer ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "tls_self_signed_cert" "demo_cert" {
  count = var.add_load_balancer ? 1 : 0

  private_key_pem = tls_private_key.ss_private_key[0].private_key_pem

  subject {
    common_name         = format("%s", var.service_name_prefix)
    organization        = "Demo"
    organizational_unit = "FOR TESTING ONLY"
  }

  #1 year validity
  validity_period_hours = 24 * 365

  allowed_uses = [
    "digital_signature",
    "cert_signing",
    "crl_signing",
  ]
}
