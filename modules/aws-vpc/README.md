## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 3.15 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.15 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN. | `string` | `"64512"` | no |
| assign\_ipv6\_address\_on\_creation | Assign IPv6 address on subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `false` | no |
| azs | A list of availability zones names or ids in the region | `list(string)` | `[]` | no |
| cidr | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `"0.0.0.0/0"` | no |
| create\_database\_internet\_gateway\_route | Controls if an internet gateway route for public database access should be created | `bool` | `false` | no |
| create\_database\_nat\_gateway\_route | Controls if a nat gateway route should be created to give internet access to the database subnets | `bool` | `false` | no |
| create\_database\_subnet\_group | Controls if database subnet group should be created (n.b. database\_subnets must also be set) | `bool` | `true` | no |
| create\_database\_subnet\_route\_table | Controls if separate route table for database should be created | `bool` | `false` | no |
| create\_egress\_only\_igw | Controls if an Egress Only Internet Gateway is created and its related routes. | `bool` | `true` | no |
| create\_elasticache\_subnet\_group | Controls if elasticache subnet group should be created | `bool` | `true` | no |
| create\_elasticache\_subnet\_route\_table | Controls if separate route table for elasticache should be created | `bool` | `false` | no |
| create\_flow\_log\_cloudwatch\_iam\_role | Whether to create IAM role for VPC Flow Logs | `bool` | `false` | no |
| create\_flow\_log\_cloudwatch\_log\_group | Whether to create CloudWatch log group for VPC Flow Logs | `bool` | `false` | no |
| create\_igw | Controls if an Internet Gateway is created for public subnets and the related routes that connect them. | `bool` | `true` | no |
| create\_redshift\_subnet\_group | Controls if redshift subnet group should be created | `bool` | `true` | no |
| create\_redshift\_subnet\_route\_table | Controls if separate route table for redshift should be created | `bool` | `false` | no |
| create\_vpc | Controls if VPC should be created (it affects almost all resources) | `bool` | `true` | no |
| customer\_gateway\_tags | Additional tags for the Customer Gateway | `map(string)` | `{}` | no |
| customer\_gateways | Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address) | `map(map(any))` | `{}` | no |
| database\_acl\_tags | Additional tags for the database subnets network ACL | `map(string)` | `{}` | no |
| database\_dedicated\_network\_acl | Whether to use dedicated network ACL (not default) and custom rules for database subnets | `bool` | `false` | no |
| database\_inbound\_acl\_rules | Database subnets inbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| database\_outbound\_acl\_rules | Database subnets outbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| database\_route\_table\_tags | Additional tags for the database route tables | `map(string)` | `{}` | no |
| database\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on database subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| database\_subnet\_group\_name | Name of database subnet group | `string` | `null` | no |
| database\_subnet\_group\_tags | Additional tags for the database subnet group | `map(string)` | `{}` | no |
| database\_subnet\_ipv6\_prefixes | Assigns IPv6 database subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list(string)` | `[]` | no |
| database\_subnet\_suffix | Suffix to append to database subnets name | `string` | `"db"` | no |
| database\_subnet\_tags | Additional tags for the database subnets | `map(string)` | `{}` | no |
| database\_subnets | A list of database subnets | `list(string)` | `[]` | no |
| default\_network\_acl\_egress | List of maps of egress rules to set on the Default Network ACL | `list(map(string))` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  },<br>  {<br>    "action": "allow",<br>    "from_port": 0,<br>    "ipv6_cidr_block": "::/0",<br>    "protocol": "-1",<br>    "rule_no": 101,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| default\_network\_acl\_ingress | List of maps of ingress rules to set on the Default Network ACL | `list(map(string))` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  },<br>  {<br>    "action": "allow",<br>    "from_port": 0,<br>    "ipv6_cidr_block": "::/0",<br>    "protocol": "-1",<br>    "rule_no": 101,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| default\_network\_acl\_name | Name to be used on the Default Network ACL | `string` | `""` | no |
| default\_network\_acl\_tags | Additional tags for the Default Network ACL | `map(string)` | `{}` | no |
| default\_route\_table\_propagating\_vgws | List of virtual gateways for propagation | `list(string)` | `[]` | no |
| default\_route\_table\_routes | Configuration block of routes. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table#route | `list(map(string))` | `[]` | no |
| default\_route\_table\_tags | Additional tags for the default route table | `map(string)` | `{}` | no |
| default\_security\_group\_egress | List of maps of egress rules to set on the default security group | `list(map(string))` | `null` | no |
| default\_security\_group\_ingress | List of maps of ingress rules to set on the default security group | `list(map(string))` | `null` | no |
| default\_security\_group\_name | Name to be used on the default security group | `string` | `"default"` | no |
| default\_security\_group\_tags | Additional tags for the default security group | `map(string)` | `{}` | no |
| default\_vpc\_enable\_classiclink | Should be true to enable ClassicLink in the Default VPC | `bool` | `false` | no |
| default\_vpc\_enable\_dns\_hostnames | Should be true to enable DNS hostnames in the Default VPC | `bool` | `false` | no |
| default\_vpc\_enable\_dns\_support | Should be true to enable DNS support in the Default VPC | `bool` | `true` | no |
| default\_vpc\_name | Name to be used on the Default VPC | `string` | `""` | no |
| default\_vpc\_tags | Additional tags for the Default VPC | `map(string)` | `{}` | no |
| dhcp\_options\_domain\_name | Specifies DNS name for DHCP options set (requires enable\_dhcp\_options set to true) | `string` | `""` | no |
| dhcp\_options\_domain\_name\_servers | Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable\_dhcp\_options set to true) | `list(string)` | <pre>[<br>  "AmazonProvidedDNS"<br>]</pre> | no |
| dhcp\_options\_netbios\_name\_servers | Specify a list of netbios servers for DHCP options set (requires enable\_dhcp\_options set to true) | `list(string)` | `[]` | no |
| dhcp\_options\_netbios\_node\_type | Specify netbios node\_type for DHCP options set (requires enable\_dhcp\_options set to true) | `string` | `""` | no |
| dhcp\_options\_ntp\_servers | Specify a list of NTP servers for DHCP options set (requires enable\_dhcp\_options set to true) | `list(string)` | `[]` | no |
| dhcp\_options\_tags | Additional tags for the DHCP option set (requires enable\_dhcp\_options set to true) | `map(string)` | `{}` | no |
| elasticache\_acl\_tags | Additional tags for the elasticache subnets network ACL | `map(string)` | `{}` | no |
| elasticache\_dedicated\_network\_acl | Whether to use dedicated network ACL (not default) and custom rules for elasticache subnets | `bool` | `false` | no |
| elasticache\_inbound\_acl\_rules | Elasticache subnets inbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| elasticache\_outbound\_acl\_rules | Elasticache subnets outbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| elasticache\_route\_table\_tags | Additional tags for the elasticache route tables | `map(string)` | `{}` | no |
| elasticache\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on elasticache subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| elasticache\_subnet\_ipv6\_prefixes | Assigns IPv6 elasticache subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list(string)` | `[]` | no |
| elasticache\_subnet\_suffix | Suffix to append to elasticache subnets name | `string` | `"elasticache"` | no |
| elasticache\_subnet\_tags | Additional tags for the elasticache subnets | `map(string)` | `{}` | no |
| elasticache\_subnets | A list of elasticache subnets | `list(string)` | `[]` | no |
| enable\_classiclink | Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic. | `bool` | `null` | no |
| enable\_classiclink\_dns\_support | Should be true to enable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic. | `bool` | `null` | no |
| enable\_dhcp\_options | Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type | `bool` | `false` | no |
| enable\_dns\_hostnames | Should be true to enable DNS hostnames in the VPC | `bool` | `false` | no |
| enable\_dns\_support | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| enable\_flow\_log | Whether or not to enable VPC Flow Logs | `bool` | `false` | no |
| enable\_ipv6 | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. | `bool` | `false` | no |
| enable\_nat\_gateway | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `false` | no |
| enable\_public\_redshift | Controls if redshift should have public routing table | `bool` | `false` | no |
| enable\_vpn\_gateway | Should be true if you want to create a new VPN Gateway resource and attach it to the VPC | `bool` | `false` | no |
| external\_nat\_ip\_ids | List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse\_nat\_ips) | `list(string)` | `[]` | no |
| external\_nat\_ips | List of EIPs to be used for `nat_public_ips` output (used in combination with reuse\_nat\_ips and external\_nat\_ip\_ids) | `list(string)` | `[]` | no |
| flow\_log\_cloudwatch\_iam\_role\_arn | The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow\_log\_destination\_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided. | `string` | `""` | no |
| flow\_log\_cloudwatch\_log\_group\_kms\_key\_id | The ARN of the KMS Key to use when encrypting log data for VPC flow logs. | `string` | `null` | no |
| flow\_log\_cloudwatch\_log\_group\_name\_prefix | Specifies the name prefix of CloudWatch Log Group for VPC flow logs. | `string` | `"/aws/vpc-flow-log/"` | no |
| flow\_log\_cloudwatch\_log\_group\_retention\_in\_days | Specifies the number of days you want to retain log events in the specified log group for VPC flow logs. | `number` | `null` | no |
| flow\_log\_destination\_arn | The ARN of the CloudWatch log group or S3 bucket where VPC Flow Logs will be pushed. If this ARN is a S3 bucket the appropriate permissions need to be set on that bucket's policy. When create\_flow\_log\_cloudwatch\_log\_group is set to false this argument must be provided. | `string` | `""` | no |
| flow\_log\_destination\_type | Type of flow log destination. Can be s3 or cloud-watch-logs. | `string` | `"cloud-watch-logs"` | no |
| flow\_log\_log\_format | The fields to include in the flow log record, in the order in which they should appear. | `string` | `null` | no |
| flow\_log\_max\_aggregation\_interval | The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds. | `number` | `600` | no |
| flow\_log\_traffic\_type | The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL. | `string` | `"ALL"` | no |
| igw\_tags | Additional tags for the internet gateway | `map(string)` | `{}` | no |
| instance\_tenancy | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| intra\_acl\_tags | Additional tags for the intra subnets network ACL | `map(string)` | `{}` | no |
| intra\_dedicated\_network\_acl | Whether to use dedicated network ACL (not default) and custom rules for intra subnets | `bool` | `false` | no |
| intra\_inbound\_acl\_rules | Intra subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| intra\_outbound\_acl\_rules | Intra subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| intra\_route\_table\_tags | Additional tags for the intra route tables | `map(string)` | `{}` | no |
| intra\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on intra subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| intra\_subnet\_ipv6\_prefixes | Assigns IPv6 intra subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list(string)` | `[]` | no |
| intra\_subnet\_suffix | Suffix to append to intra subnets name | `string` | `"intra"` | no |
| intra\_subnet\_tags | Additional tags for the intra subnets | `map(string)` | `{}` | no |
| intra\_subnets | A list of intra subnets | `list(string)` | `[]` | no |
| manage\_default\_network\_acl | Should be true to adopt and manage Default Network ACL | `bool` | `false` | no |
| manage\_default\_route\_table | Should be true to manage default route table | `bool` | `false` | no |
| manage\_default\_security\_group | Should be true to adopt and manage default security group | `bool` | `false` | no |
| manage\_default\_vpc | Should be true to adopt and manage Default VPC | `bool` | `false` | no |
| map\_public\_ip\_on\_launch | Should be false if you do not want to auto-assign public IP on launch | `bool` | `true` | no |
| name | Name to be used on all the resources as identifier | `string` | `""` | no |
| nat\_eip\_tags | Additional tags for the NAT EIP | `map(string)` | `{}` | no |
| nat\_gateway\_tags | Additional tags for the NAT gateways | `map(string)` | `{}` | no |
| one\_nat\_gateway\_per\_az | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`. | `bool` | `false` | no |
| outpost\_acl\_tags | Additional tags for the outpost subnets network ACL | `map(string)` | `{}` | no |
| outpost\_arn | ARN of Outpost you want to create a subnet in. | `string` | `null` | no |
| outpost\_az | AZ where Outpost is anchored. | `string` | `null` | no |
| outpost\_dedicated\_network\_acl | Whether to use dedicated network ACL (not default) and custom rules for outpost subnets | `bool` | `false` | no |
| outpost\_inbound\_acl\_rules | Outpost subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| outpost\_outbound\_acl\_rules | Outpost subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| outpost\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on outpost subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| outpost\_subnet\_ipv6\_prefixes | Assigns IPv6 outpost subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list(string)` | `[]` | no |
| outpost\_subnet\_suffix | Suffix to append to outpost subnets name | `string` | `"outpost"` | no |
| outpost\_subnet\_tags | Additional tags for the outpost subnets | `map(string)` | `{}` | no |
| outpost\_subnets | A list of outpost subnets inside the VPC | `list(string)` | `[]` | no |
| private\_acl\_tags | Additional tags for the private subnets network ACL | `map(string)` | `{}` | no |
| private\_dedicated\_network\_acl | Whether to use dedicated network ACL (not default) and custom rules for private subnets | `bool` | `false` | no |
| private\_inbound\_acl\_rules | Private subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| private\_outbound\_acl\_rules | Private subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| private\_route\_table\_tags | Additional tags for the private route tables | `map(string)` | `{}` | no |
| private\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on private subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| private\_subnet\_ipv6\_prefixes | Assigns IPv6 private subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list(string)` | `[]` | no |
| private\_subnet\_suffix | Suffix to append to private subnets name | `string` | `"private"` | no |
| private\_subnet\_tags | Additional tags for the private subnets | `map(string)` | `{}` | no |
| private\_subnets | A list of private subnets inside the VPC | `list(string)` | `[]` | no |
| propagate\_intra\_route\_tables\_vgw | Should be true if you want route table propagation | `bool` | `false` | no |
| propagate\_private\_route\_tables\_vgw | Should be true if you want route table propagation | `bool` | `false` | no |
| propagate\_public\_route\_tables\_vgw | Should be true if you want route table propagation | `bool` | `false` | no |
| public\_acl\_tags | Additional tags for the public subnets network ACL | `map(string)` | `{}` | no |
| public\_dedicated\_network\_acl | Whether to use dedicated network ACL (not default) and custom rules for public subnets | `bool` | `false` | no |
| public\_inbound\_acl\_rules | Public subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| public\_outbound\_acl\_rules | Public subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| public\_route\_table\_tags | Additional tags for the public route tables | `map(string)` | `{}` | no |
| public\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on public subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| public\_subnet\_ipv6\_prefixes | Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list(string)` | `[]` | no |
| public\_subnet\_suffix | Suffix to append to public subnets name | `string` | `"public"` | no |
| public\_subnet\_tags | Additional tags for the public subnets | `map(string)` | `{}` | no |
| public\_subnets | A list of public subnets inside the VPC | `list(string)` | `[]` | no |
| redshift\_acl\_tags | Additional tags for the redshift subnets network ACL | `map(string)` | `{}` | no |
| redshift\_dedicated\_network\_acl | Whether to use dedicated network ACL (not default) and custom rules for redshift subnets | `bool` | `false` | no |
| redshift\_inbound\_acl\_rules | Redshift subnets inbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| redshift\_outbound\_acl\_rules | Redshift subnets outbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| redshift\_route\_table\_tags | Additional tags for the redshift route tables | `map(string)` | `{}` | no |
| redshift\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on redshift subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| redshift\_subnet\_group\_tags | Additional tags for the redshift subnet group | `map(string)` | `{}` | no |
| redshift\_subnet\_ipv6\_prefixes | Assigns IPv6 redshift subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list(string)` | `[]` | no |
| redshift\_subnet\_suffix | Suffix to append to redshift subnets name | `string` | `"redshift"` | no |
| redshift\_subnet\_tags | Additional tags for the redshift subnets | `map(string)` | `{}` | no |
| redshift\_subnets | A list of redshift subnets | `list(string)` | `[]` | no |
| reuse\_nat\_ips | Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external\_nat\_ip\_ids' variable | `bool` | `false` | no |
| secondary\_cidr\_blocks | List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool | `list(string)` | `[]` | no |
| single\_nat\_gateway | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `false` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_flow\_log\_permissions\_boundary | The ARN of the Permissions Boundary for the VPC Flow Log IAM Role | `string` | `null` | no |
| vpc\_flow\_log\_tags | Additional tags for the VPC Flow Logs | `map(string)` | `{}` | no |
| vpc\_tags | Additional tags for the VPC | `map(string)` | `{}` | no |
| vpn\_gateway\_az | The Availability Zone for the VPN Gateway | `string` | `null` | no |
| vpn\_gateway\_id | ID of VPN Gateway to attach to the VPC | `string` | `""` | no |
| vpn\_gateway\_tags | Additional tags for the VPN gateway | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| azs | A list of availability zones specified as argument to this module |
| cgw\_arns | List of ARNs of Customer Gateway |
| cgw\_ids | List of IDs of Customer Gateway |
| database\_internet\_gateway\_route\_id | ID of the database internet gateway route. |
| database\_ipv6\_egress\_route\_id | ID of the database IPv6 egress route. |
| database\_nat\_gateway\_route\_ids | List of IDs of the database nat gateway route. |
| database\_network\_acl\_arn | ARN of the database network ACL |
| database\_network\_acl\_id | ID of the database network ACL |
| database\_route\_table\_association\_ids | List of IDs of the database route table association |
| database\_route\_table\_ids | List of IDs of database route tables |
| database\_subnet\_arns | List of ARNs of database subnets |
| database\_subnet\_group | ID of database subnet group |
| database\_subnet\_group\_name | Name of database subnet group |
| database\_subnets | List of IDs of database subnets |
| database\_subnets\_cidr\_blocks | List of cidr\_blocks of database subnets |
| database\_subnets\_ipv6\_cidr\_blocks | List of IPv6 cidr\_blocks of database subnets in an IPv6 enabled VPC |
| default\_network\_acl\_id | The ID of the default network ACL |
| default\_route\_table\_id | The ID of the default route table |
| default\_security\_group\_id | The ID of the security group created by default on VPC creation |
| default\_vpc\_arn | The ARN of the Default VPC |
| default\_vpc\_cidr\_block | The CIDR block of the Default VPC |
| default\_vpc\_default\_network\_acl\_id | The ID of the default network ACL of the Default VPC |
| default\_vpc\_default\_route\_table\_id | The ID of the default route table of the Default VPC |
| default\_vpc\_default\_security\_group\_id | The ID of the security group created by default on Default VPC creation |
| default\_vpc\_enable\_dns\_hostnames | Whether or not the Default VPC has DNS hostname support |
| default\_vpc\_enable\_dns\_support | Whether or not the Default VPC has DNS support |
| default\_vpc\_id | The ID of the Default VPC |
| default\_vpc\_instance\_tenancy | Tenancy of instances spin up within Default VPC |
| default\_vpc\_main\_route\_table\_id | The ID of the main route table associated with the Default VPC |
| egress\_only\_internet\_gateway\_id | The ID of the egress only Internet Gateway |
| elasticache\_network\_acl\_arn | ARN of the elasticache network ACL |
| elasticache\_network\_acl\_id | ID of the elasticache network ACL |
| elasticache\_route\_table\_association\_ids | List of IDs of the elasticache route table association |
| elasticache\_route\_table\_ids | List of IDs of elasticache route tables |
| elasticache\_subnet\_arns | List of ARNs of elasticache subnets |
| elasticache\_subnet\_group | ID of elasticache subnet group |
| elasticache\_subnet\_group\_name | Name of elasticache subnet group |
| elasticache\_subnets | List of IDs of elasticache subnets |
| elasticache\_subnets\_cidr\_blocks | List of cidr\_blocks of elasticache subnets |
| elasticache\_subnets\_ipv6\_cidr\_blocks | List of IPv6 cidr\_blocks of elasticache subnets in an IPv6 enabled VPC |
| igw\_arn | The ARN of the Internet Gateway |
| igw\_id | The ID of the Internet Gateway |
| intra\_network\_acl\_arn | ARN of the intra network ACL |
| intra\_network\_acl\_id | ID of the intra network ACL |
| intra\_route\_table\_association\_ids | List of IDs of the intra route table association |
| intra\_route\_table\_ids | List of IDs of intra route tables |
| intra\_subnet\_arns | List of ARNs of intra subnets |
| intra\_subnets | List of IDs of intra subnets |
| intra\_subnets\_cidr\_blocks | List of cidr\_blocks of intra subnets |
| intra\_subnets\_ipv6\_cidr\_blocks | List of IPv6 cidr\_blocks of intra subnets in an IPv6 enabled VPC |
| name | The name of the VPC specified as argument to this module |
| nat\_ids | List of allocation ID of Elastic IPs created for AWS NAT Gateway |
| nat\_public\_ips | List of public Elastic IPs created for AWS NAT Gateway |
| natgw\_ids | List of NAT Gateway IDs |
| outpost\_network\_acl\_arn | ARN of the outpost network ACL |
| outpost\_network\_acl\_id | ID of the outpost network ACL |
| outpost\_subnet\_arns | List of ARNs of outpost subnets |
| outpost\_subnets | List of IDs of outpost subnets |
| outpost\_subnets\_cidr\_blocks | List of cidr\_blocks of outpost subnets |
| outpost\_subnets\_ipv6\_cidr\_blocks | List of IPv6 cidr\_blocks of outpost subnets in an IPv6 enabled VPC |
| private\_ipv6\_egress\_route\_ids | List of IDs of the ipv6 egress route. |
| private\_nat\_gateway\_route\_ids | List of IDs of the private nat gateway route. |
| private\_network\_acl\_arn | ARN of the private network ACL |
| private\_network\_acl\_id | ID of the private network ACL |
| private\_route\_table\_association\_ids | List of IDs of the private route table association |
| private\_route\_table\_ids | List of IDs of private route tables |
| private\_subnet\_arns | List of ARNs of private subnets |
| private\_subnets | List of IDs of private subnets |
| private\_subnets\_cidr\_blocks | List of cidr\_blocks of private subnets |
| private\_subnets\_ipv6\_cidr\_blocks | List of IPv6 cidr\_blocks of private subnets in an IPv6 enabled VPC |
| public\_internet\_gateway\_ipv6\_route\_id | ID of the IPv6 internet gateway route. |
| public\_internet\_gateway\_route\_id | ID of the internet gateway route. |
| public\_network\_acl\_arn | ARN of the public network ACL |
| public\_network\_acl\_id | ID of the public network ACL |
| public\_route\_table\_association\_ids | List of IDs of the public route table association |
| public\_route\_table\_ids | List of IDs of public route tables |
| public\_subnet\_arns | List of ARNs of public subnets |
| public\_subnets | List of IDs of public subnets |
| public\_subnets\_cidr\_blocks | List of cidr\_blocks of public subnets |
| public\_subnets\_ipv6\_cidr\_blocks | List of IPv6 cidr\_blocks of public subnets in an IPv6 enabled VPC |
| redshift\_network\_acl\_arn | ARN of the redshift network ACL |
| redshift\_network\_acl\_id | ID of the redshift network ACL |
| redshift\_public\_route\_table\_association\_ids | List of IDs of the public redshidt route table association |
| redshift\_route\_table\_association\_ids | List of IDs of the redshift route table association |
| redshift\_route\_table\_ids | List of IDs of redshift route tables |
| redshift\_subnet\_arns | List of ARNs of redshift subnets |
| redshift\_subnet\_group | ID of redshift subnet group |
| redshift\_subnets | List of IDs of redshift subnets |
| redshift\_subnets\_cidr\_blocks | List of cidr\_blocks of redshift subnets |
| redshift\_subnets\_ipv6\_cidr\_blocks | List of IPv6 cidr\_blocks of redshift subnets in an IPv6 enabled VPC |
| this\_customer\_gateway | Map of Customer Gateway attributes |
| vgw\_arn | The ARN of the VPN Gateway |
| vgw\_id | The ID of the VPN Gateway |
| vpc\_arn | The ARN of the VPC |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_enable\_dns\_hostnames | Whether or not the VPC has DNS hostname support |
| vpc\_enable\_dns\_support | Whether or not the VPC has DNS support |
| vpc\_flow\_log\_cloudwatch\_iam\_role\_arn | The ARN of the IAM role used when pushing logs to Cloudwatch log group |
| vpc\_flow\_log\_destination\_arn | The ARN of the destination for VPC Flow Logs |
| vpc\_flow\_log\_destination\_type | The type of the destination for VPC Flow Logs |
| vpc\_flow\_log\_id | The ID of the Flow Log resource |
| vpc\_id | The ID of the VPC |
| vpc\_instance\_tenancy | Tenancy of instances spin up within VPC |
| vpc\_ipv6\_association\_id | The association ID for the IPv6 CIDR block |
| vpc\_ipv6\_cidr\_block | The IPv6 CIDR block |
| vpc\_main\_route\_table\_id | The ID of the main route table associated with this VPC |
| vpc\_owner\_id | The ID of the AWS account that owns the VPC |
| vpc\_secondary\_cidr\_blocks | List of secondary CIDR blocks of the VPC |

