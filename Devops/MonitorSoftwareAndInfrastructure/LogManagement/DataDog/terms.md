### resource_name vs service vs hostname
In Datadog, the terms "resource name," "service," and "hostname" are all used to identify and organize data from different sources.

- Resource Name: The resource name is a user-defined label that represents an entity being monitored. This could be a server, an application, a container, or any other resource that is being monitored by Datadog. Resource names are typically used to filter and group data in the Datadog interface.

~~~html
Example: If you are monitoring multiple instances of a web application, you might use a resource name like "webapp-instance-1", "webapp-instance-2", etc.
~~~

- Service: A service is a logical grouping of resources that perform a similar function or belong to the same application. Services are typically defined in Datadog using tags and are used to aggregate and analyze metrics and traces across multiple resources.

~~~html
Example: If you have a microservices architecture, you might define a service tag for each microservice in your application (e.g. "payment-service", "user-service", etc.) and use these tags to group and analyze data across your entire application.
~~~

- Hostname: The hostname is the name of the physical or virtual machine where the resource is running. Hostnames are automatically assigned by the operating system and are used by Datadog to identify and group metrics and traces from the same machine.

~~~html
Example: If you are monitoring a cluster of servers, each server will have a unique hostname (e.g. "server-1", "server-2", etc.) that can be used to group and analyze metrics and logs from that machine.
~~~

In summary, resource name is a user-defined label that identifies a specific entity being monitored, service is a logical grouping of resources that perform a similar function, and hostname is the name of the machine where the resource is running. All three of these terms can be used to filter and group data in the Datadog interface, depending on your needs.
