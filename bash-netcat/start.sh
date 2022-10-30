#!/bin/bash

(
  while true; do
  (
    echo -e 'HTTP/1.1 200 OK\r\n';
    cat index.html
  ) | nc -lp 8080
done
) &

while true; do
  (
    echo -e 'HTTP/1.1 200 OK\r\n';
    sh test.sh
  ) | nc -lp 8081
done

