resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7tTi3WYuJGfKkT+DpfsqLr3zxuDb+lEzIToHHAfvBG7/s22QIP8lp/lOpQALgMj/oQh2MKWXguW62+iLzOvoe5xZTHzMTUN9j0DC5nQvhfbF39aa56UBQMLmxSlqfTCQ5hkTY5Nw6SWvPUqlOV9ZhBJGlmA/o5oV0Ok0+C/vdvH+bUPARk/deHAGhRKAX+B2ZPeqzxsuRbKAyl0/+CZCECPG3iGIF7RbsIhU7UWzpoZG6RwMPahBwlSGfTqW3xOVBUSR+3pzxJsipkNr2mMfGgkWgW0onmW7Oo1s5UEogpwxYuuAl3m8YsZ9TAFHtwIg2KJGHwRoGkef5TV3MMUGEWoFCir5YYZIDd00XW/1JgO/VSpxKFRoSf0GfIbUwY2HhGRZBsarnC8+qir74FW6RMxyYWgcfhuVSnWj4Nrpzeequt1vatCwczGVk3omhUsk4BLtDH0IlaVCRKDrpXTkH032g8G28fimRXLvBr0lGKoyd1Rp9cPHutCzMKbLwD+BGiSnQADA+yMYh+YqhrDii8Aq91BThdcT73X+/uI+ZS3wP8csy29jV9FwLYtba0hS2nK3wgpH8xygNcXds5MZ4Oj31VGSZyZxjbkEprmP+jmAx5Hi1TvsqTwcTnKpro9+5iedpeGXOe7dUwxMnnjynDd7V5zfHBxLNNqtYGngw4w== yousra@LAPTOP-7VRVLJ8H"
}

resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.main.key_name

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = { Name = "${var.project_name}-server" }
}