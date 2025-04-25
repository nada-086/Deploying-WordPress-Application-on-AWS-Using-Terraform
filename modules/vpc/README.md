# 🛠️ VPC Terraform Module

هذا الموديول يقوم بإنشاء شبكة VPC متكاملة على AWS باستخدام Terraform. يشمل الآتي:

- VPC
- Subnets (Public & Private)
- Internet Gateway
- Route Tables & Associations

---

## 📦 الموارد التي يتم إنشاؤها:

- `aws_vpc`
- `aws_subnet` (2 Public + 2 Private)
- `aws_internet_gateway`
- `aws_route_table` + `aws_route_table_association`

---

## 🔧 المتغيرات (Variables)

| اسم المتغير                  | النوع     | الوصف                            |
|------------------------------|-----------|----------------------------------|
| `myvpc_cidr_block`           | `string`  | CIDR block لـ VPC                |
| `subnet1_cidr_block`         | `string`  | CIDR block لـ Public Subnet 1    |
| `subnet2_cidr_block`         | `string`  | CIDR block لـ Public Subnet 2    |
| `private_subnet1_cidr_block` | `string`  | CIDR block لـ Private Subnet 1   |
| `private_subnet2_cidr_block` | `string`  | CIDR block لـ Private Subnet 2   |

---

## 📤 المخرجات (Outputs)

| اسم المخرج            | الوصف                                    |
|------------------------|-------------------------------------------|
| `vpc_id`               | الـ ID الخاص بـ VPC                       |
| `public_subnet_ids`    | قائمة بـ IDs الخاصة بـ Public Subnets     |
| `private_subnet_ids`   | قائمة بـ IDs الخاصة بـ Private Subnets    |

---

## 🧪 مثال للاستخدام (Usage)

```hcl
module "network" {
  source                     = "./modules/network"
  myvpc_cidr_block           = var.myvpc_cidr_block
  subnet1_cidr_block         = var.subnet1_cidr_block
  subnet2_cidr_block         = var.subnet2_cidr_block
  private_subnet1_cidr_block = var.private_subnet1_cidr_block
  private_subnet2_cidr_block = var.private_subnet2_cidr_block
}
