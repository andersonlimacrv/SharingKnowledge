```html
Mã hóa bao gồm các thành phần:

1. Thông tin trước khi mã hóa (Plaintext)
2. Sau tin sau khi mã hóa (Ciphertext)
3. Chìa khóa (Key)
4. Phương pháp giải mã (Encryption/Decryption)
```


#### các phương pháp giải mã
1. mã hoá cổ điển
	- ý tưởng của phương pháp này rất đơn giản, bên A mã hóa thông tin bằng thuật toán mã hóa cổ điển, và bên B giải mã thông tin, dựa vào thuật toán của bên A, mà không dùng đến bất kì key nào
2. mã hoá một chiều
	- chỉ có thể mã hoá chứ không thể giải mã
3. mã hoá đối xứng (Symmetric-key encryption)
	- là phương pháp mã hoá mà key mã hoá và key giải mã là như nhau
4. mã hoá bất đối xứng (Asymmetric encryption)
	- là phương pháp mã hoá mà key mã hoá và key giải mã khác
	- tất cả mọi người đều có thể biết được public key, và có thể dùng public key này để mã hóa thông tin. Nhưng chỉ có người nhận mới nắm giữ private key, nên chỉ có người nhận mới có thể giải mã được thông tin.

  * cách hoạt động
	  - Bên nhận sẽ tạo ra một gặp khóa (public key và private key).
	  Bên nhận sẽ dữ lại private key và truyền cho bên gửi public key.
	  Vì public key này là công khai nên có thể truyền tự do mà không cần bảo mật.

	  - Bên gửi trước khi gửi dữ liệu sẽ mã hóa dữ liệu bằng thuật toán mã hóa bất đối xứng với key là public key từ bên nhận.

	  - Bên nhận sẽ giải mã dữ liệu nhận được bằng thuật toán được sử dụng ở bên gửi, với key giải mã là private key.

	* nhược điểm:
	 	- tốn nhiều thời gian thực thi hơn mã hoá đối xứng

#### các thuật toán mã hoá đối xứng
1. DES (Data Encryption Standard)
2. AES-128, AES-192 và AES-256 (Advanced Encryption Standard)

#### các thuật toán mã hoá bất đối xứng
1. RSA (Rivest–Shamir–Adleman)

#### các thuật toán mã hoá một chiều
1. MD5 (Message Digest 5)
2. SHA (Secure Hash Algorithm)


#### Questions
1. mã hoá bất đối xứng có thể mã hoá bằng private key?
2. tại sao mã hoá bất đối xứng tốn nhiều thời gian thực thi hơn mã hoá đối xứng?
3. raibow table là gì? có liên quan gì đến các thuật toán SHA?
4. tại sao lại là "băm" chứ ko phải "mã hóa"?
 -> Mã hóa thì có khả năng sẽ bị giải mã, nhưng băm thì never, trừ khi bruteforce attack mà thôi!

### Notes
- [MD5](https://en.wikipedia.org/wiki/MD5#Collision_vulnerabilities) và [SHA-1](https://security.googleblog.com/2017/02/announcing-first-sha1-collision.html) được chứng minh có đụng độ, nghĩa là 2 password khác nhau, khi hash bằng MD5 hoặc SHA-1 có thể ra cùng một chuỗi.

### Attacks
1. hàm băm
- Dictionary Attacks
- Bruteforce
- Rainbow Tables (tạo ra sẵn các mật khẩu mã hóa trong một cơ sở dữ liệu và tiến hành tìm kiếm cho mỗi giá trị băm)

### các thuật toán băm an toàn hiện nay
- PBKDF2
- bcrypt
- scrypt


[source](https://securitybox.vn/4896/phan-loai-cac-phuong-phap-ma-hoa/)
[source](https://academy.binance.com/vi/articles/what-is-symmetric-key-cryptography)
[source](https://nsbvc.blogspot.com/2018/12/mat-khau-cung-can-uop-va-bam-voi-muoi.html)
