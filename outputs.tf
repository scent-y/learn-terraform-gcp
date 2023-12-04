output "ip" {
    // Terraform が作成するインスタンスのIPアドレス出力を定義
    value = google_compute_instance.vm_instance.network_interface.0.network_ip
}