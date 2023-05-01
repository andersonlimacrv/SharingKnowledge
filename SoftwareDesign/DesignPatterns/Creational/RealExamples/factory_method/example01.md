~~~ruby
# Define an abstract document class
class Document
  def initialize
    raise NotImplementedError, "#{self.class} is an abstract class."
  end

  def format
    raise NotImplementedError, "format method must be implemented"
  end
end

# Define concrete document classes that inherit from the abstract document class
class PDFDocument < Document
  def format
    "PDF"
  end
end

class WordDocument < Document
  def format
    "Word"
  end
end

# Define a factory class that creates objects of different document types
class DocumentFactory
  def self.create_document(type)
    case type
    when :pdf
      PDFDocument.new
    when :word
      WordDocument.new
    else
      raise ArgumentError, "Invalid document type: #{type}"
    end
  end
end

# Use the factory class to create objects of different document types
pdf_doc = DocumentFactory.create_document(:pdf)
puts pdf_doc.format #=> "PDF"

word_doc = DocumentFactory.create_document(:word)
puts word_doc.format #=> "Word"
~~~
