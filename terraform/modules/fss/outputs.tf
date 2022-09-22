# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v1.0 as shown at https://oss.oracle.com/licenses/upl.

output "mount_target_id" {
  value = local.mount_target_id[0]
}

output "mount_export_id" {
  value = oci_file_storage_export.mount_export.id
}

output "fss_id" {
  value = var.existing_fss_id != "" ? var.existing_fss_id : join("", oci_file_storage_file_system.file_system.*.id)
}

output "export_path" {
  value = oci_file_storage_export.mount_export.path
}

output "mount_ip" {
  value = join("", data.oci_core_private_ip.mount_target_private_ip.*.ip_address)
}
