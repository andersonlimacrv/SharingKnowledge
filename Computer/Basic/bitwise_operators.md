1. & (bitwise AND)
```
0 & 0 = 0
1 & 1 = 1
0 & 1 = 0
1 & 0 = 0
```
2. | (bitwise OR)
```
0 | 0 = 0
1 | 1 = 1
0 | 1 = 1
1 | 0 = 1
```
3. ~ (bitwise NOT)
```
~ 0 = 1
~ 1 = 0
```
4. ^ (bitwise XOR)
```
0 ^ 0 = 0
1 ^ 1 = 0
0 ^ 1 = 1
1 ^ 0 = 1

Như vậy nếu 2 bit khác nhau sẽ cho ra kết quả 1 và ngược lại, 2 bit giống nhau sẽ cho ra kết quả 0
```
5. << (bitwise left shift)

```
6. >> (bitwise right shift)
```

```
- Phép dịch trái hay dịch phải được gọi chung là phép dịch bit.
- Khi dịch một dãy bit A được đánh số từ bit 0 đến bit n, chỉ số của các bit sẽ thay đổi còn giá trị của mỗi bit sẽ vẫn giữ nguyên. - Như vậy giá trị của A sẽ thay đổi
- Khi dịch dãy bit A sang phải n đơn vị tức là chỉ số của mỗi bit trong A sẽ bị trừ đi n đơn vị. Ngược lại, khi dịch sang trái n đơn vị tức là chỉ số của mỗi bit sẽ được cộng thêm n đơn vị
- Sau khi dịch bit, các bit có chỉ số âm sẽ bị bỏ đi.
```

```
7. >>> (bitwise unsigned right shift)
```
8. &= (bitwise AND assignment)
9. |= (bitwise OR assignment)
10. ^= (bitwise XOR assignment)
11. <<= (bitwise left shift and assignment)
```
12. >>= (bitwise right shift and assignment)
13. >>>= (bitwise unsigned right shift and assignment)
```

### examples:
1. bitwise OR assignment:
x |= y // x = x | y

### use cases:
1. Ứng dụng của nó trong việc giải quyết bài toán tập hợp

- Ví dụ trường hợp đặt hằng số đại diện 12 con giáp này trong lập trình:
1.1. Cách bình thường mọi người hay đặt:
(Tý: 1, Sửu: 2, Dần: 3, Mão: 4, …, Hợi:12)

1.2. Cách đặt để có thế ứng dụng phép bitwise:
(Tý: 1<<0, Sửu: 1<<1, Dần: 1<<2, Mão: 1<<3, …, Hợi: 1<<11)

Chú thích: đặt như vậy để xác định các tập hợp trên không hề giao nhau và đều khác 0 (tức là tập rỗng)

- Tập hợp nhiều con giáp:
Cách bình thường(1 mảng): [1,2,3,4,..,12]
Cách bitwise(1 số int): 1|2|4|8|…|2048 = 4095

2. Các phép toán tập hợp
2.1. Phép giao (Intersection)
2.2. Phép thuộc: (trường hợp con của phép giao bên trên)
2.3. Phép hợp (Union)
2.4. Phép Hiệu (Difference)

[source](https://text.relipasoft.com/2019/06/phep-toan-thao-tac-bit-bitwise-operation-va-ung-dung-trong-lap-trinh-thiet-ke-he-thong/)

=======================================================================================
[use cases](https://graphics.stanford.edu/~seander/bithacks.html)
[use cases](https://medium.ninja/techie-delight/top-bit-manipulation-hacks-a9a1c5536dc9)
