all:
	@mkdir -p $(HOME)/muhcelik/data/wordpress
	@mkdir -p $(HOME)/muhcelik/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf $(HOME)/muhcelik/data/wordpress
	rm -rf $(HOME)/muhcelik/data/mariadb

.PHONY: all re down clean
