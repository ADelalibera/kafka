@echo off

@echo listar informacao do topico 'teste'...

kafka-topics --bootstrap-server localhost:9092 --topic teste --describe