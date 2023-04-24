@echo off

@echo alterar numero de particoes do topico 'teste' para 10...

kafka-topics --bootstrap-server localhost:9092 --alter --topic teste --partitions 10