### What does enclosing a class in angle brackets "<>" mean in TypeScript?
- That's called Type Assertion or casting.

[source](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#type-assertions)
[source](https://yeulaptrinh.vn/bai-7-type-inference-type-assertion)


```javascript
// These are the same:
let square = <Square>{};
let square = {} as Square;
```

### Type Inference
- Chúng ta đã học về các type trong TypeScript, tuy nhiên việc khai báo type cho từng biến là không bắt buộc. TypeScript sẽ tự suy ra kiểu (infer type) của biến nếu chúng ta không khai báo kiểu cho chúng (type annotation) trong các trường hợp:

1. Khi các biến được khai báo

```js
let sum // Variable 'sum' implicitly has an 'any' type, but a better type may be inferred from usage
```

2. Khi các biến được gán với các giá trị cụ thể

```js
let sum = 14
console.log(typeof sum) //number
sum = 16
sum = true //error: Type 'boolean' is not assignable to type 'number'
```
Mặc dù không được khai báo kiểu nhưng biến sum đã được ngầm mặc định theo giá trị 14 là number, khi gán các giá trị với type khác vào thì sẽ bị lỗi

3. Các hàm trả về các giá trị cụ thể

```js
function sum (a: number, b: number) {
    return a + b
} //function sum(a: number, b: number): number

let class: string
class = sum(5,10) //Type 'number' is not assignable to type 'string'
```
Ta có thể thấy, hàm sum ở trên trả về kiểu number, nên khi gán một biến là string vào thì nó sẽ bị lỗi

### Type Assertion
- Type Assertion là một cơ chế logic của TypeScript, nó cho phép bạn đặt kiểu của biến và yêu cầu TypeScript không tự suy ra kiểu của biến đó. Lúc này chúng ta có thể tự quản lý được type của biến hoặc là type trả về từ một function. Tương tự như ép kiểu trong Java hay C#, tuy nhiên nó chỉ có mục đích là để TypeScript compiler biết kiểu của biến chứ không phải là check lúc runtime như các ngôn ngữ khác, các bạn có thể xem lại bài 2 trong list của chúng mình nhé.

- Chúng ta vào ví dụ cụ thể cho đỡ mơ hồ nhé:

- Để sử dụng type assertions chúng ta có thể sử dụng angle bracket “< >” hoặc là as syntax

```js
let sum: any
let total = <number>sum

total = 10
total = "Total" //Type 'string' is not assignable to type 'number'.
```
Ở ví dụ trên, cho dù sum là kiểu any nhưng total được gán là type number của sum, cho nên không thể nhận type nào khác

```js
let grade: number | string

let bobScore = grade as string

let trumpScore = <boolean>grade // Conversion of type 'string | number' to type 'boolean' may be a mistake because neither type sufficiently overlaps with the other. If this was intentional, convert the expression to 'unknown' first.

bobScore = 10 // Type 'number' is not assignable to type 'string'

bobScore = "A"
```
Ở ví dụ trên, grade được khai báo kiểu union của number và string. Cho nên không thể gán kiểu boolean cho grade. bobScore cũng được gán kiểu string của grade theo syntax as, cho nên không thể nhận type nào khác string.

Chúng ta đi vào một ví dụ khác với type mình tự định nghĩa nhé, phần này sẽ nói ở bài viết sau, mình mặc định là chúng ta đã biết về interface nhé


```js
interface Student {
    name: string;
    age: number;
}

let student = <Student> { }
student.name = "John" // OK
student.age = 123 // OK
```
Như vậy, chúng ta đã sử dụng type assertion để tạo student có cấu trúc theo Interface Student và gán giá trị cho các thuộc tính của nó. Tuy nhiên chúng ta cần chú ý một chút, TypeScript compiler sẽ không hiển thị compile time error nếu chúng ta quên thuộc tính cho biến của mình


```js
interface Student {
    name: string;
    age: number;
}

let student = <Student> { }
console.log(student.name) // undefined
```

Chúng ta cũng có thể sử dụng type assertion tương tự với function

```js
function sum (a: number, b: number): (number | string) {
    return a + b
}

let total = sum(5, 10) as number

total = "Total" //Type 'string' is not assignable to type 'number'
total = 50
```
