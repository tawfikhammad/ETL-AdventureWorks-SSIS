USE master
go

IF Db_id('EO_AdventureWorksDW2019') IS NOT NULL
  DROP DATABASE EO_AdventureWorksDW2019;

CREATE DATABASE EO_AdventureWorksDW2019
go 