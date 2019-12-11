

resource "aws_key_pair""my-key"{
key_name ="mykey"
public_key = "${file{"${var.PATH_TO_PUBLIC_KEY}}"
}


resource "aws_instance""example"{ 
ami = "${lookup{var.AMIs, var.AWS_REGION}}" 
instance_type = "t2.micro" 
key_name = "${aws_key_pair.mykey.key_name}"


provisioner "file"{
source = "script.sh"
destination = "/opt/script.sh"
}
provisioner "remote-exec"{
inline = [
"chmod +x/opt/script.sh",
"/opt/script.sh arguments"
]
}
}
connection {
user = "${var.instance_username}"
private_key = "${file{var.instance_password}}"
}
}