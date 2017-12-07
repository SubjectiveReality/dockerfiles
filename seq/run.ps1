docker run -d --name seq --restart=always -p 5341:5341 cortside/seq
docker ps | select-string "seq"
