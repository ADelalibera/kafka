@echo off

@echo criar topico 'teste' no kafka sem informar quantidade de particao...

kafka-topics --bootstrap-server localhost:9092 --create --topic teste