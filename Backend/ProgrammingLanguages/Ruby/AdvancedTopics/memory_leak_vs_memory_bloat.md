### Memory Leak:
~~~html
Unreleased memory that accumulates over time, causing increased memory usage and potential application crashes.
~~~

### Memory bloat:
~~~html
Excessive memory usage due to inefficient data structures or algorithms, leading to increased garbage collection overhead and reduced performance.
~~~


### example

~~~ruby
class LeakyClass
  @@leaky_array = []

  def add_to_leaky_array
    @@leaky_array << "leaky" * 1000
  end
end

while true
  leaky_instance = LeakyClass.new
  leaky_instance.add_to_leaky_array
  sleep(1)
end
=begin
In this example, the LeakyClass has a class variable @@leaky_array that stores large strings. The add_to_leaky_array method adds a new string to the array every time it's called. The while loop creates new instances of LeakyClass and keeps adding strings to @@leaky_array, causing a memory leak as the memory is never released.
=end
~~~


~~~ruby
def read_large_file(file_path)
  lines = []
  File.open(file_path, "r") do |file|
    file.each_line do |line|
      lines << line.chomp
    end
  end
  lines
end

large_file_path = "large_file.txt"
lines = read_large_file(large_file_path)

=begin
In this example, the read_large_file method reads a large file line by line and stores each line in an array lines. This can cause memory bloat if the file is very large, as the entire file content is loaded into memory at once. A more efficient approach would be to process the file line by line without storing the entire content in memory.
=end
~~~

### tool
https://github.com/SamSaffron/memory_profiler
