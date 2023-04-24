@echo off

@echo receber mensagem do topico 'teste' do grupo1

kafka-console-consumer --bootstrap-server localhost:9092 --topic teste --group grupo1