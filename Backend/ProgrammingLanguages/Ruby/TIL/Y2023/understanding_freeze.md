~~~ruby
arr = ['a', 'b', 'c']
arr.freeze

arr << 'd' #=> FrozenError (can't modify frozen Array)
arr[0] = 'd' #=> FrozenError (can't modify frozen Array)

# The array is frozen, but its elements (strings) are still mutable
arr[1].replace('e') #=> ["a", "e", "c"]

=begin
# If you wanted to prevent modifications to the strings within the array, you could freeze each of them as well:
arr = ['a', 'b', 'c'].map(&:freeze)
arr.freeze
# Now the array and its elements are frozen
arr[1].replace('e') #=> FrozenError (can't modify frozen String)
=end

arr.frozen? #=> true
~~~


~~~ruby
a = 'source'.freeze
=begin
In the given case a = 'source'.freeze, the string 'source' is frozen, making it immutable.
Let's explore an example of a case where you can modify the string indirectly and
a case where you cannot modify the string directly.

------------------------------------------
Case 1: Can modify indirectly
You can create a new string with modified content by using non-destructive operations
on the frozen string. This doesn't modify the original string but rather
creates a new string object with the desired modifications:

a = 'source'.freeze
b = a.gsub('source', 'destination')
puts b #=> "destination"

In this example, we used the gsub method to create a new string with the content 'destination'.
The original frozen string a remains unchanged.
------------------------------------------

Case 2: Cannot modify directly
Since the string object is frozen, any attempt to modify it directly using destructive
operations will result in a FrozenError:

a = 'source'.freeze
a.gsub!('source', 'destination') #=> FrozenError (can't modify frozen String)

Here, we tried to use the gsub! method, which is a destructive operation that attempts to modify the original string object. Since the string is frozen, it raises an error.

In summary, you can indirectly modify a frozen string by creating a new string with the desired modifications, but you cannot directly modify the original frozen string.
=end
~~~
