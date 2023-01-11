~~~ruby
module XML
  class SAXParser
    Module.nesting
  end
end

=begin
# => [XML::SAXParser, XML]

[0] XML::SAXParser < Object,
[1] XML
=end

class XML::SAXParser
  Module.nesting
end

=begin
# => [XML::SAXParser]

[0] XML::SAXParser < Object
=end
~~~



~~~ruby
module A
  module C
    module D
      Module.nesting
    end
  end
end
=begin
[0] A::C::D,
[1] A::C,
[2] A
=end
~~~
