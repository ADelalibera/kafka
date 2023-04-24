@echo off

@echo enviar mensagem para topico 'teste' com chave-valor...

kafka-console-producer.bat --broker-list localhost:9092 --topic teste --property "parse.key=true" --property "key.separator=,"