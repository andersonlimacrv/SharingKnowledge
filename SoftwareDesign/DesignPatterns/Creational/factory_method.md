![factory method 1](../Assets/factory-pattern-structure.png)
![factory method 2](../Assets/factorymethod.jpg)
![factory method 3](../Assets/factory_pattern_uml_diagram.jpg)

```ruby
  # The Product interface declares the operation that all
  # concrete products must implement
  class Product
    def operation
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}"
    end
  end

  # Concrete Prodcuts provide various implementations of
  # the Product interface
  class ConcreteProduct1 < Product
    def operation
      '{Result of the ConcreteProduct1}'
    end
  end

  class ConcreteProduc2 < Product
    def operation
      '{Result of the ConcreteProduc2}'
    end
  end

  class ProductFactory
    def make_product(type)
      case type
      when 'ConcreteProduct1' then ConcreteProduct1.new
      when 'ConcreteProduct2' then ConcreteProduct2.new
      end
    end
  end

  class Client
    def ask
      product_factory = ProductFactory.new

      concrete_product1 = product_factory.make_product('ConcreteProduct1')
      concrete_product1.operation

      concrete_product2 = product_factory.make_product('ConcreteProduct2')
      concrete_product2.operation
    end
  end
```

```html
### when to use:
- đưa toàn bộ logic của việc tạo mới object vào trong factory, che giấu logic của việc khởi tạo
- giảm sự phụ thuộc nhằm tăng tính mở rộng

=> thường được sử dụng trong các thư viện (người sử dụng đạt được mục đích
  tạo mới object mà không cần quan tâm đến cách nó được tạo ra)
  
[source](https://codelearn.io/sharing/factory-method-pattern-trong-java)  
```

```html
Factory Pattern xác định một interface để tạo một đối tượng, nhưng cho phép các lớp con quyết định lớp nào sẽ khởi tạo.  Factory Pattern giao việc khởi tạo một đối tượng cụ thể cho lớp con
```
