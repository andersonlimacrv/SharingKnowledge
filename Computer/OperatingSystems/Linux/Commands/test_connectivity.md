### Ping Command
> It is used to check the source host reachability to the destination host.

~~~bash
# ping <IP>
ping google.com # OR ping 10.10.0.21

# PING google.com (172.217.31.14): 56 data bytes
# 64 bytes from 172.217.31.14: icmp_seq=0 ttl=116 time=51.106 ms
# 64 bytes from 172.217.31.14: icmp_seq=1 ttl=116 time=47.733 ms
# 64 bytes from 172.217.31.14: icmp_seq=2 ttl=116 time=49.845 ms
# 64 bytes from 172.217.31.14: icmp_seq=3 ttl=116 time=49.502 ms
# 64 bytes from 172.217.31.14: icmp_seq=4 ttl=116 time=54.792 ms
# 64 bytes from 172.217.31.14: icmp_seq=5 ttl=116 time=49.484 ms
~~~

### Traceroute Command
> It is used to see all the hops in between the source and destination hosts

~~~bash
# Unix: traceroute <ip> OR traceroute -p <destination_port> <destination_ip>
# Windows: tracert <ip>

traceroute 10.10.0.21
# traceroute - p 10.10.0.21 3868

# traceroute to 10.10.0.21 (10.10.0.21), 64 hops max, 52 byte packets
#  1  172.16.0.1 (172.16.0.1)  8.967 ms  2.226 ms  2.119 ms
#  2  adsl.hnpt.com.vn (203.210.144.219)  4.839 ms  3.245 ms  5.631 ms
#  3  172.17.5.73 (172.17.5.73)  8.775 ms
#     172.17.5.77 (172.17.5.77)  5.899 ms
#     172.17.5.73 (172.17.5.73)  6.060 ms
#  4  *^C
~~~

### Nslookup command
>  It is used to get information from the Domain Name System (DNS) server. Its helpful to obtain the domain name or IP address mapping or any specific DNS record.

~~~bash
# nslookup <domain/IP>
nslookup techCruds.com # OR nslookup 10.10.0.21

# Server:		8.8.8.8
# Address:	8.8.8.8#53

# Non-authoritative answer:
# Name:	techCruds.com
# Address: 162.214.80.49
~~~

### Telnet command
> It is used to check if your host is able to connect to destination host using telnet protocol which is part of TCP/IP protocol suite.

~~~bash
# telnet -s <src_ip> <dest_ip> <dest_port>  OR telnet <dest_ip> <dest_port>
# telnet -s 10.10.0.21 12.34.12.21 3868 OR telnet 12.34.12.21 3868

telnet 127.0.0.1 9092

# Trying 127.0.0.1...
# Connected to localhost.
# Escape character is '^]'.
~~~

### Curl Command
> It is used as a tool to retrieve information from Uniform Resource Locator (URL) or an IP. This tool is not by default installed in your linux machines but need to install externally using below command:

~~~bash
# curl --insecure <dest_ip/domain>:<dest_port>
curl --insecure google.com # OR curl --insecure 172.10.x.x:8080

# <HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
# <TITLE>301 Moved</TITLE></HEAD><BODY>
# <H1>301 Moved</H1>
# The document has moved
# <A HREF="http://www.google.com/">here</A>.
# </BODY></HTML>
~~~
