.PHONY: fmt validate security

fmt:
	terraform fmt -recursive modules environments

validate:
	@for env in environments/dev environments/stage environments/prod; do \
		echo "==> $$env"; \
		terraform -chdir=$$env init -backend=false -input=false >/dev/null; \
		terraform -chdir=$$env validate; \
	done

security:
	checkov -d modules --quiet
	checkov -d environments --quiet
