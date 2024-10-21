.PHONY: clear

up:
	@if [ ! -f .env ]; then \
		echo "An .env file was not found! Please create a .env file before proceeding." && exit 1; \
	fi

	docker compose up --build -d --remove-orphans
	@make check-url
	@echo "Docker Compose services are up and running successfully!"

check-url:
	until [ "$$(docker compose exec -it web curl -s -o /dev/null -w "%{http_code}" http://localhost)" -eq "200" ]; do \
		echo "Waiting for server to be ready..."; \
		sleep 5; \
	done;
	@echo "Success: Server is up and running."

clear:
	@echo "Clearing cache..."
	@php artisan cache:clear
	@echo "Clearing routes..."
	@php artisan route:clear
	@echo "Clearing config..."
	@php artisan config:clear
	@echo "All clear!"

ssh-web:
	@docker compose exec -it web bash
	
mysql:
	@docker compose exec -it db mysql -uroot -ppassword oci

down: 
	docker compose down --volumes