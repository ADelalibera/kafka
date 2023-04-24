@echo off

@echo receber mensagem do topico 'teste' com valor apenas do grupo1

kafka-console-consumer --bootstrap-server localhost:9092 --topic teste --property "print.key=false" --property "key.separator=," --group grupo1