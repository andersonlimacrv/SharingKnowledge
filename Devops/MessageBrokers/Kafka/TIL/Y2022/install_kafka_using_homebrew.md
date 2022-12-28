[source](https://medium.ninja/@Ankitthakur/apache-kafka-installation-on-mac-using-homebrew-a367cdefd273)


~~~bash
$ brew cask install java
$ brew install kafka
~~~

#### Start Zookeeper:

~~~bash
# use this command will raise an issue: The broker is trying to join the wrong cluster. Configured zookeeper.connect may be wrong.
$ zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties

# use this command below
$ zookeeper-server-start /usr/local/etc/zookeeper/zoo.cfg
~~~

#### Start Kafka server:

~~~bash
$ kafka-server-start /usr/local/etc/kafka/server.properties
~~~


#### WARNING:

> During server start, you might be facing connection broken issue.

~~~bash
[2018-08-28 16:24:41,166] WARN [Controller id=0, targetBrokerId=0] Connection to node 0 could not be established. Broker may not be available. (org.apache.kafka.clients.NetworkClient)
[2018-08-28 16:24:41,268] WARN [Controller id=0, targetBrokerId=0] Connection to node 0 could not be established. Broker may not be available. (org.apache.kafka.clients.NetworkClient)
~~~

#### To fix this issue, we need to change the server.properties file.

~~~bash
$ vim /usr/local/etc/kafka/server.properties
~~~

#### Here uncomment the server settings and update the value from

~~~bash
listeners=PLAINTEXT://:9092
~~~

#### to

~~~bash
############################# Socket Server Settings #############################
# The address the socket server listens on. It will get the value returned from
# java.net.InetAddress.getCanonicalHostName() if not configured.
#   FORMAT:
#     listeners = listener_name://host_name:port
#   EXAMPLE:
#     listeners = PLAINTEXT://your.host.name:9092
listeners=PLAINTEXT://localhost:9092
~~~

#### and restart the server and it will work great.


#### Create Kafka Topic:

~~~bash
$ kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test
~~~

#### Initialize Producer console:

~~~bash
$ kafka-console-producer --broker-list localhost:9092 --topic test
>send first message
>send second message
>wow it is working
~~~

#### Initialize Consumer console:
> Now we will initialize the Kafka consumer console, which will listen to bootstrap server localhost at port 9092 at topic test from beginning:

~~~bash
$ kafka-console-consumer --bootstrap-server localhost:9092 --topic test --from-beginning
send first message
send second message
wow it is working
~~~
