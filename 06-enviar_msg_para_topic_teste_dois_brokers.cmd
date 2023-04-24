@echo off

@echo enviar mensagem para topico 'teste' para dois brokers (9092 e 9093)...

kafka-console-producer.bat --broker-list localhost:9092,localhost:9093 --topic teste