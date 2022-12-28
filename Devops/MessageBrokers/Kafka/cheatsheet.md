### message: Đơn vị dữ liệu trong Kafka
(Nếu bạn tiếp cận Kafka từ góc nhìn của nền tảng cơ sở dữ liệu, bạn có thể nghĩ về message tương tự như một row hoặc một record)
### batch: Để hiệu quả, message được viết vào Kafka theo đợt(Batche)
### topic: Ví dụ gần nhất với topic đó chính ra table trong db hay folder trong filesystem
### stream: là thuật ngữ thường được sử dụng khi nói về dữ liệu trong các hệ thống như Kafka
### producers: là thành phần tạo ra các message
### consumers: là thành phần đọc các message
### broker: máy chủ kafka
[source](https://viblo.asia/p/kafka-nhung-khai-niem-dau-tien-RQqKLPMNK7z)



### kafka commands

~~~bash
# check kafka version
kafka-dump-log --version # => 3.3.1 (Commit:e23c59d00e687ff5)
~~~
