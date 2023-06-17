~~~html
In computer programming, a race condition occurs when two or more threads or processes access a shared resource or variable concurrently, and the final outcome of the program depends on the order in which the threads or processes execute.

Race conditions can lead to unpredictable behavior in programs and are a common source of bugs. This is because the order in which the threads or processes execute is often non-deterministic and can vary from run to run, depending on factors such as the operating system scheduler, the timing of input/output operations, and the speed of the CPU.
~~~

~~~ruby
# Define a shared variable
shared_variable = 0

# Define two threads that increment the shared variable
Thread.new do
  1000.times do
    shared_variable += 1
  end
end

Thread.new do
  1000.times do
    shared_variable += 1
  end
end

# Wait for both threads to finish
sleep 1

# Output the value of the shared variable
puts shared_variable

=begin
In this example, we define a shared variable shared_variable and two threads that increment it 1000 times each. However, because the threads access the shared variable concurrently, the final value of the variable is dependent on the order in which the threads execute, which is non-deterministic. Therefore, the output of the program is unpredictable and can vary from run to run, depending on the timing of the threads. This is an example of a race condition.
=end
~~~

~~~html
Race condition là một tình huống xảy ra khi nhiều threads cùng truy cập và cùng lúc muốn thay đổi dữ liệu
~~~

### how to prevent race condition
~~~html
1. Use locks: Locks, such as mutex locks and semaphore locks, can be used to ensure that only one thread or process can access a shared resource at a time. By ensuring exclusive access to shared resources, locks can prevent race conditions.

2. Use atomic operations: Atomic operations, such as compare-and-swap (CAS), are operations that are guaranteed to execute atomically, without interruption. By using atomic operations to modify shared variables, you can ensure that the variable is modified atomically, without any other thread or process modifying it concurrently.

3. Use thread-safe data structures: Thread-safe data structures, such as synchronized queues and synchronized maps, are data structures that are designed to be used concurrently by multiple threads or processes. By using thread-safe data structures, you can avoid race conditions that might occur when multiple threads or processes access the same data structure concurrently.

4. Use message passing: Message passing is a programming model where communication between threads or processes is performed by sending and receiving messages. By using message passing to communicate between threads or processes, you can avoid race conditions that might occur when multiple threads or processes access the same shared memory concurrently.
~~~

[source](https://www.honeybadger.io/blog/avoid-race-condition-in-rails/)
