@echo off

@echo receber mensagem do topico 'teste'...

kafka-console-consumer --bootstrap-server localhost:9092 --topic teste --from-beginning