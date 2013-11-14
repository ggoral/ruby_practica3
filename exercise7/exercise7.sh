#!/bin/bash

curl -G http://echo.httpkit.com

curl --data "param1=value1&param2=value2" http://echo.httpkit.com

curl --data "param1=value1&param2=value2" http://echo.httpkit.com?"param1=value1&param2=value2"

curl --upload-file uploadfile http://www.example.com/receive.cgi
