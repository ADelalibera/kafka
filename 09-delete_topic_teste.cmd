@echo off

@echo deletar topico 'teste' no kafka...

kafka-topics --bootstrap-server localhost:9092 --delete --topic teste