~~~html
Database đóng một vai trò vô cùng quan trọng trong các hệ thống hay ứng dụng ngày nay. Mặc dù không thể bỏ qua cách hoạt động của database, nhưng những vấn đề mà các dev thấy trước và trải nghiệm thường sẽ chỉ là phần nổi của tảng băng chìm. Trong bài viết này, tác giả chia sẻ một số thông tin chi tiết và hữu ích giúp cho việc làm việc với database.

1. Chúng ta rất may mắn nếu 99.999% network hoạt động tốt. Đó là một cuộc tranh luận mở về mức độ đáng tin cậy của mạng ngày nay và mức độ phổ biến của các hệ thống gặp phải thời gian ngừng hoạt động do mất kết nối mạng.

2. ACID có rất nhiều ý nghĩa. ACID bao gồm tính nguyên tử (atomicity), tính nhất quán (consistency), tính cô lập (isolation), độ bền (durability). ACID luôn được đảm bảo cho người dùng ngay cả trong trường hợp có sự cố, lỗi, lỗi phần cứng và tương tự. Không phải mỗi database đều hỗ trợ ACID, và kể cả với các database có hỗ trợ ACID thì ACID cũng có thể được hiểu khác nhau. Một trong những lý do tại sao ACID được triển khai khác nhau là những sự đánh đổi liên quan đến việc triển khai các khả năng của ACID.

3. Mỗi cơ sở dữ liệu có tính nhất quán (consistency) và khả năng cách ly (isolation) khác nhau. Khi chúng ta scale database theo chiều ngang bằng việc thêm nhiều máy, đảm bảo mức độ nhất quán cao có thể cực kỳ khó vì vì chúng ta phải đánh đổi availability hoặc khả năng chịu đựng network partitioning. Với isolation, các database thường cung cấp nhiều lớp cách ly khác nhau để các nhà phát triển ứng dụng có thể chọn lớp hiệu quả nhất về chi phí dựa trên sự cân bằng của chúng. Các mức độ isolation trong SQL: Serializable, Repeatable reads, Read commited, Read uncommitted.

4. Các exclusive lock có thể bị ảnh hưởng bởi các phân vùng mạng nhiều hơn và gây ra các deadlock khó xác định và giải quyết. Trong trường hợp không thể dễ dàng giữ được Exclusive locks, optimistic locking là một lựa chọn. Optimistic locking là một phương pháp khi bạn đọc một hàng, bạn ghi lại số phiên bản, dấu thời gian sửa đổi lần cuối hoặc checksum. Sau đó, bạn có thể kiểm tra phiên bản đã không thay đổi nguyên bản trước khi thực hiện thay đổi bản ghi.

5. Có những bất thường khác ngoài dirty reads và data loss. Một trong các ví dụ là write skew. Việc ghi sai xảy ra không do dirty read hay data loss, mà do các rằng buộc logic trên dữ liệu bị xâm phạm.

6. Bạn có thể không hiểu rõ về ordering trong database. Database có thể thực thi các transactions nhận được không theo thứ tự lập trình mà các nhà phát triển nhìn thấy. Thứ tự thực hiện transaction rất khó dự đoán, đặc biệt là trong các hệ thống có khối lượng lớn.

7. Cơ chế sharding cấp ứng dụng (application-level sharding) có thể được tách biệt. Khi có thể dự đoán cách dữ liệu sẽ được truy cập, bạn có thể tạo các phân vùng ngang thay vì ủy quyền công việc này cho cơ sở dữ liệu. Đây được gọi là sharding cấp ứng dụng.

8. Sử dụng AUTO INCREMENT có thể có hại, đặc biệt trong các hệ thống database phân tán.

9. Clock skew xảy ra giữa bất kỳ nguồn clock nào.

10. Latency có rất nhiều ý nghĩa. Latency có thể gây ra bởi database hoặc network.

11. Đánh giá các yêu cầu về hiệu suất trên mỗi transaction. Khi đánh giá một cơ sở dữ liệu mới về hiệu suất, một cách tiếp cận toàn diện hơn là đánh giá các hoạt động quan trọng (mỗi truy vấn và hoặc mỗi transaction) một cách riêng biệt.

12. Nested transaction có thể gây hại. Không phải database nào cũng hỗ trợ tính năng này, tuy nhiên với những databse có hỗ trợ, chúng có thể gây ra những lỗi rất khó debug cho người dùng.

13. Transactions không nên chứa trạng thái (state) của ứng dụng.

14. Query planners có thể nói nhiều điều về database.

15. Online migration rất phức tạp nhưng hoàn toàn khả thi.

16. Tăng khối lượng sử dụng lên database có thể gây ra những hệ quả khó lường trước được.
~~~
### things-i-wished-more-developers-knew-about-databases
https://rakyll.medium.com/things-i-wished-more-developers-knew-about-databases-2d0178464f78

[source](https://newsletter.grokking.org/p/139-nh-ng-di-u-chung-ta-nen-bi-t-nhi-u-h-n-v-database-277755)
