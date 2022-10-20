1. Optimistic Locking
```html
Với loại khóa này, nhiều user có thể truy cập vào cùng 1 object,
đọc dữ liệu từ nó nhưng khi có hai hoặc nhiều người cùng thực hiện
việc update trên object này thì chỉ một người có thể update được,
tiến trình của những người còn lại sẽ bắn ra exception.
```

```ruby
p1 = Person.find(1)
p2 = Person.find(1)

p1.first_name = "Michael"
p1.save

p2.first_name = "should fail"
p2.save # Raises a ActiveRecord::StaleObjectError
```

```html
Để kích hoạt Optimistic Locking trong Rails, chúng ta chỉ cần tạo 1 field lock_version trong table,
(lưu ý data type phải là integer và có default: 0)
Mỗi lần update thì Rails sẽ tự tăng giá trị của lock_version lên 1 đơn vị, vì vậy nếu update bị conflict
thì giá trị lock_version sẽ không khớp Rails sẽ raise exception StaleObjectError
```

2. Pessimistic Locking

```html
Với loại khóa này thì chỉ có người đầu tiên truy cập vào object
thì mới có thể update được nó. Tất cả những người dùng khác thậm
chí còn không thể đọc dữ liệu từ object đó. Đây là một điểm rất
khác với Optimistic Locking khi người dùng vẫn còn thể đọc được
dữ liệu từ object bị khóa.
```

```ruby
account = Account.find_by_user_id(5)
account.lock!
#no other users can read this account, they have to wait until the lock is released
account.save!
#lock is released, other users can read this account
```
