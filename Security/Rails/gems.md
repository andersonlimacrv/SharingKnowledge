[attr-encrypted](https://github.com/attr-encrypted/)

### issues

```ruby
- OpenSSL::Cipher::CipherError:
from /Users/hoasung01/.rvm/gems/ruby-2.6.9/gems/encryptor-3.0.0/lib/encryptor.rb:98:in `final'
```
=> fixed

```html
Backwards compatibility is supported by providing a special option that is passed to encryptor, namely, :insecure_mode:
```

```ruby
class User
  attr_encrypted :email, key: 'a secret key', algorithm: 'aes-256-cbc', mode: :single_iv_and_salt, insecure_mode: true
end
```
