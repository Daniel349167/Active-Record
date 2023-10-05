# Introducción a ActiveRecord

## Descripción

Esta actividad consiste en aprender y practicar consultas básicas de ActiveRecord. Se creó una base de datos de 30 clientes falsos con nombres, direcciones de correo electrónico y fechas de nacimiento generadas aleatoriamente.

![image](https://github.com/Daniel349167/Active-Record/assets/62466867/63340ede-9b85-4bbb-a844-722e62c878eb)


## Características

- Base de datos de 30 clientes falsos generados con la gema `Faker`.
- Pruebas automatizadas con RSpec.
- Uso de la herramienta `Guard` para re-ejecución automática de pruebas.

## Preparación

1. Clona este repositorio.
2. Ejecuta `bundle install` para instalar las gemas necesarias.
3. Para iniciar las pruebas de forma automática, utiliza el comando `guard`.

## Uso

Para probar las consultas de ActiveRecord:

1. Inicia el intérprete de Ruby con `bundle exec irb`.
2. Dentro del intérprete de Ruby, escribe `load 'activerecord_practica.rb'`.
3. Prueba las consultas, por ejemplo: `Customer.where(...)`.

## Información Adicional

Aunque ActiveRecord es una parte esencial de Rails, en esta actividad se utiliza fuera de un contexto de aplicación Rails. Se enfoca en el uso directo y puro de ActiveRecord para la manipulación y consulta de bases de datos.




