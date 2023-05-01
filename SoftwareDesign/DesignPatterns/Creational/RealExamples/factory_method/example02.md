~~~ruby
class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def description
    raise NotImplementedError, "#{self.class} has not implemented method 'description'"
  end
end

class Book < Product
  attr_accessor :author

  def initialize(name, price, author)
    super(name, price)
    @author = author
  end

  def description
    "#{name} by #{author}"
  end
end

class Clothing < Product
  attr_accessor :size

  def initialize(name, price, size)
    super(name, price)
    @size = size
  end

  def description
    "#{name} in size #{size}"
  end
end

class Electronic < Product
  attr_accessor :brand

  def initialize(name, price, brand)
    super(name, price)
    @brand = brand
  end

  def description
    "#{name} by #{brand}"
  end
end

class ProductFactory
  def self.create_product(type, name, price, attributes = {})
    case type
    when :book
      Book.new(name, price, attributes[:author])
    when :clothing
      Clothing.new(name, price, attributes[:size])
    when :electronic
      Electronic.new(name, price, attributes[:brand])
    else
      raise ArgumentError, "Invalid product type: #{type}"
    end
  end
end

product1 = ProductFactory.create_product(:book, 'The Great Gatsby', 20.99, author: 'F. Scott Fitzgerald')
puts product1.description
# Output: The Great Gatsby by F. Scott Fitzgerald

product2 = ProductFactory.create_product(:clothing, 'T-Shirt', 9.99, size: 'L')
puts product2.description
# Output: T-Shirt in size L

product3 = ProductFactory.create_product(:electronic, 'iPhone', 599.99, brand: 'Apple')
puts product3.description
# Output: iPhone by Apple
~~~
