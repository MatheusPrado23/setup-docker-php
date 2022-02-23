# Setup Docker Para Projetos com PHP 8.1

### Instruções de uso
Clone Repositório
```sh
git clone https://github.com/MatheusPrado23/setup-docker-php.git
```

Copie os arquivos docker-compose.yml e Dockerfile para a raiz de seu projeto
```sh
cp -rf setup-docker-php/* meu-projeto/
```
```sh
cd meu-projeto/
```

Configure as informações dos containers de acordo com sua preferência (nome do container, porta, etc)

Suba os containers do projeto
```sh
docker-compose up -d
```

Acesse o container
```sh
docker-compose exec app bash
```

Instale as dependências do projeto
```sh
composer install
```

Acessar o projeto no navegador
[http://localhost:8080](http://localhost:8080)