docker stop tomcat
docker rm tomcat
docker rmi 192.168.1.179:8002/tomcat:0.0.0
docker build -t 192.168.1.179:8002/tomcat:0.0.0 .
docker push 192.168.1.179:8002/tomcat:0.0.0
docker run -idt -p 28080:8080 --name tomcat 192.168.1.179:8002/tomcat:0.0.0
