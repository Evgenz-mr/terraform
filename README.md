# Terraform Infrastructure Engineering Lab

Production-oriented Terraform examples demonstrating reusable modules, environment separation, validation and remote-state patterns.

## What this repository demonstrates

- reusable Terraform modules
- environment-specific composition
- remote state patterns
- variable and output design
- infrastructure validation in CI
- legacy AWS examples retained for reference

## Structure

```text
modules/
  app_stack/
environments/
  dev/
  stage/
  prod/
.github/workflows/
legacy examples: 1.WebServer-* ... 7.AWSVPC
```

## Modern example

The `modules/app_stack` module uses Terraform-native resources to demonstrate module composition without requiring cloud credentials. Each environment passes different service sizing/configuration and exposes outputs.

```bash
cd environments/dev
terraform init
terraform fmt -check -recursive ../..
terraform validate
terraform plan
```

## CI

Pull requests run `terraform fmt -check` and `terraform validate` across the modern environments.

## Production considerations

In a real cloud deployment, state should be remote and locked, credentials should come from workload identity/OIDC rather than static secrets, and plans should be reviewed before apply. Security scanning with tools such as Checkov/tfsec can be layered into CI depending on the provider and organization policy.

## Historical examples

The numbered directories are older AWS learning examples and are kept as reference material. The `modules/` and `environments/` layout represents the preferred portfolio structure going forward.
