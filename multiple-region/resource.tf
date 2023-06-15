resource "aws_eip" "mobiview" {
}

resource "aws_eip" "tableau" {
  provider = aws.region2
}

output "mobiview_ip" {
  value = aws_eip.mobiview.public_ip
}