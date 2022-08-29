#curl http://localhost:8080/
#Goodbye, World!
#httperf --port=8080 --num-conns=10000
#Request rate: 1813.1 req/s (0.6 ms/req)
# httperf --port=8080 --num-conns=10000 --num-calls=10
#Request rate: 4869.1 req/s (0.2 ms/req)
httperf --port=8080 --num-conns=10000 --num-calls=100
#Request rate: 5689.0 req/s (0.2 ms/req)
