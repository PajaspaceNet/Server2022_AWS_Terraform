provider "aws" {
  region = "eu-central-1"  # Změňte na svůj region (např. "us-east-1")
}

# Získání nejnovějšího Windows Server 2022 AMI
data "aws_ssm_parameter" "windows_server_2022" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2022-English-Full-Base"
}

# Vytvoření Spot Instance s Windows Serverem
resource "aws_spot_instance_request" "win_server_spot" {
  ami                   = "ami-0714e35e14bc8fff8"
  #ami                  = data.aws_ssm_parameter.windows_server_2022.value
  instance_type        = "t3.medium"  # Můžete změnit na jiný typ instance
  spot_price           = "0.05"  # Maximální cena za hodinu (může být nižší)
  wait_for_fulfillment = true
  key_name             = "tvuj.pem"  # Nahraďte svým SSH klíčem pro přístup
  security_groups      = [aws_security_group.rdp_access.name]

  tags = {
    Name = "Windows-Server-Spot"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Bezpečnostní skupina s otevřeným RDP (3389)
resource "aws_security_group" "rdp_access" {
  name        = "allow_rdp"
  description = "Povoleni RDP pro Windows Server"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Otevřeno pro všechny (doporučuji omezit na vaši IP)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
