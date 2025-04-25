resource "tls_private_key" "example" {
    algorithm = "RSA"
    rsa_bits  = 4096
}
# Upload the public key to AWS
resource "aws_key_pair" "mykey" {
    key_name   = "my-key"             # Name of the key pair in AWS
    public_key = tls_private_key.example.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key" {
    content  = tls_private_key.example.private_key_pem
    filename = "${path.module}/my-key.pem"  # Saves as my-key.pem
    file_permission = "0400"  
}