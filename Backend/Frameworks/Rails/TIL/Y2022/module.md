module XML
  class SAXParser
    Module.nesting
  end
end

=> [XML::SAXParser, XML]

class XML::SAXParser
  Module.nesting
end

=> [XML::SAXParser]






module A
  module C
    module D
      Module.nesting
    end
  end
end
