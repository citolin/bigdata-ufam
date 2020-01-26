.PHONY: build exec
SHELL := bash

exec: build
	hadoop jar target/pi1p1-1.0-SNAPSHOT-fatjar.jar br.edu.ufam.citolin.wordcount.WordCount -input Shakespeare.txt -output modified-wc -reducers 5

build:
	mvn clean package

