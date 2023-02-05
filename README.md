# assignment-simple-web

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

## Table of Contents

- [소개](#소개)
- [시작하기](#시작하기)
- [구현내용](#구현내용)
- [제작자](#제작자)

### 소개
IaC 도구를 사용해서 간단한 Web Application 아키텍처 구현  

### 시작하기
현재 생성된 web server는 아래 링크로 확인 가능합니다.  
- [결과물 링크](https://simple-web.emadam.shop)

새롭게 리소스를 구성하려면 아래와 같이 설정합니다.  
1. 자동화된 정적 코드 분석 및 유효성 검증을 위해 git pre-commit을 설정합니다.
```sh
# pre-commit 설치
$ brew insatall pre-commit

# tflint 설치
$ brew install tflint

# pre-commit 활성화
$ pre-commit install

# pre-commit에 등록된 스크립트 테스트
$ pre-commit run -a
Terraform fmt..................................Passed
Terraform validate.............................Passed
Terraform docs.................................Passed
Terraform validate with tflint.................Passed
```
pre-commit으로 수행할 스크립트 구성은 pre-commit-config.yaml에서 확인 가능합니다.

2. Backend 없이 terraform을 초기화 합니다.
```sh
$ terraform init -backend=false
```
3. backend module을 사용해 S3 Backend 용 bucket과 dynamodb table을 생성합니다.
```
$ terraform apply -target module.backend
```
4. S3 Backend를 적용합니다.
```
$ terraform init
```
5. 자격 증명 공급자에 Github OIDC Provider가 등록되어 있다면 Assume role을 생성합니다.
```
$ terraform apply -target module.oidc_role
```
6. 나머지 리소스들을 생성합니다. 
```
$ terraform apply
```

Github Actions로 리소스를 생성할 수 있습니다.  
(.github/workflows/terraform-ci.yaml)

### 구현내용
```
.
├── README.md
├── main.tf
├── module
│   ├── backend
│   ├── oidc
│   └── simple-web
│       └── scripts
├── outputs.tf
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
└── variables.tf
```
- /  
루트에는 루트 모듈과 여러 설정파일들이 구성되어 있습니다. module 디렉터리 하위에 구성되어 있는 서비스 모듈들을 사용합니다.

- /module  
서비스의 실제 구성이 포함된 하위 모듈 모음입니다.

- /module/backend  
S3 Backend를 위한 리소스가 구성되어 있습니다. tfstate용 bucket, tfstate 액세스 로그가 저장되는 log bucket, state lock을 관리하는 DynamoDB table이 구성되어 있습니다. 

- /module/oidc  
OIDC 설정관련 리소스가 구성되어 있는 모듈입니다. 자격 증명 공급자는 기존에 등록이 되어 있기 때문에 생략하였으며, OIDC 용 AssumeRole만 구성되어 있습니다. 이 OIDC AssumeRole은 Github Actions에서 Terraform이 AWS에 리소스를 구성할 때 사용됩니다. 

- /module/simple-web
nginx가 구동되는 간단한 Web Application 환경이 구성되어 있는 모듈입니다. 해당 모듈을 사용해 리소스를 생성하면 아래와 다이어그램과 같이 구성됩니다.
![architecture](https://user-images.githubusercontent.com/36755917/216800873-f3d4b72a-f430-48ec-a788-fecbf93a2593.png)

- /module/simple-web/scripts  
EC2 startup-script가 구성되어 있습니다. 해당 폴더 내의 run_nginx.sh는 docker 및 docker-compose 설치, nginx container 구동까지의 스크립트가 작성되어 있습니다.

### 제작자
이동열 / [ldy9037@naver.com](ldy9037@naver.com)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.52.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | ./module/backend | n/a |
| <a name="module_oidc_role"></a> [oidc\_role](#module\_oidc\_role) | ./module/oidc | n/a |
| <a name="module_simple_web"></a> [simple\_web](#module\_simple\_web) | ./module/simple-web | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
