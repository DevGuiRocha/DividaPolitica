ARG=

DOCKER_COMPOSE ?= $(shell \
		docker compose version >/dev/null 2>/dev/null \
	&& echo docker compose -f docker-compose.yml \
	|| echo docker-compose -f docker-compose.yml \
	)

# Acessar o terminal do container
bash:
	$(DOCKER_COMPOSE) exec web bash

# Iniciar o servidor Rails
start:
	$(DOCKER_COMPOSE) up -d

# Parar o servidor Rails
stop:
	$(DOCKER_COMPOSE) down

# Parar forçadamente o servidor Rails
stop-force:
	$(DOCKER_COMPOSE) down --remove-orphans --volumes

# Iniciar o servidor Rails dentro do container
server:
	$(DOCKER_COMPOSE) exec web bundle exec rails server -b 0.0.0.0 -p 3000

# Acessar o console do Rails
console:
	$(DOCKER_COMPOSE) exec web bundle exec rails console

# Executar testes
test:
	$(DOCKER_COMPOSE) exec web bundle exec rspec

# Executar migrações do banco de dados
migrate:
	$(DOCKER_COMPOSE) exec web bundle exec rails db:migrate

# Reverter a última migração
rollback:
	$(DOCKER_COMPOSE) exec web bundle exec rails db:rollback

# Popular o banco de dados com dados iniciais
seed:
	$(DOCKER_COMPOSE) exec web bundle exec rails db:seed

# Limpar o cache do Rails
cache-clear:
	$(DOCKER_COMPOSE) exec web bundle exec rails tmp:cache:clear

# Verificar dependências do projeto
check:
	$(DOCKER_COMPOSE) exec web bundle check

# Instalar dependências do projeto
install:
	$(DOCKER_COMPOSE) exec web bundle install

# Limpar e reconstruir o ambiente Docker
rebuild:
	$(DOCKER_COMPOSE) down --remove-orphans --volumes
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) up -d