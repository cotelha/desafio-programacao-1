# Desafio de programação 1
O Sistema tem o objetivo de importar um arquivo texto pré definido para um banco de dados relacional.

## Ambiente de desenvolvimento utilizado
	Ruby 1.9.2
	Rails 3.2.12
	OS: Ubuntu 12.10
	DB: sqlite3

## Intalação usadas para o desenvolvimento 
	Instalar NODEJS para aplicações Rails 3.2.x: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
	Install RVM: https://rvm.beginrescueend.com/
	install Ruby: rvm install 1.9.2 && rvm use 1.9.2 --default	
	install Gemset: rvm gemset create desafio

## Rodar ambiente de desenvolvimento
	rvm use 1.9.2
	rvm gemset use desafio
	git clone https://github.com/cotelha/desafio-programacao-1.git
	bundle install
	rake db:create
	rails s