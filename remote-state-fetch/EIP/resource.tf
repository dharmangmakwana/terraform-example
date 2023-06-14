resource "aws_eip" "mobiview" { 
}

output "mobiview_ip" {
  value = aws_eip.mobiview.public_ip
}