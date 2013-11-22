#!/bin/bash

echo "GET method"
curl -G http://echo.httpkit.com

echo "POST method"
curl  http://echo.httpkit.com --data "param1=value1&param2=value2"

echo "PUT method"
curl http://echo.httpkit.com --upload-file uploadfile
