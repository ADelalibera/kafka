@echo off

@echo enviar mensagem para topico 'teste' sem informar particao...

kafka-console-producer.bat --broker-list localhost:9092 --topic teste