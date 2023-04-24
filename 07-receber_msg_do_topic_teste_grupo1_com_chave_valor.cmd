@echo off

@echo receber mensagem do topico 'teste' com chave-valor do grupo1

kafka-console-consumer --bootstrap-server localhost:9092 --topic teste --property "print.key=true" --property "key.separator=," --group grupo1