[source](https://kysumattien.com/the-ultimate-guide-about-useMemo-and-useCallback)

```html
Là hai hook của React, giúp tạo ra các memoized function và value,
nôm na là khi nào cần tạo mới thì mới tạo mới, không thì dùng lại giá trị
cũ, từ đó tránh được các vấn đề về re-render, performance.
```

```html
useCallback -> Trả ra một memoized function
useMemo -> Trả ra một memoized value
```


### useMemo
tập trung vào việc tránh lặp đi lặp lại các logic tính toán nặng nề.


### useCallback
thì tập trung giải quyết vấn đề về performance, khi mà các callback function
được tạo ở functional component cha pass xuống component con luôn bị tạo mới,
khiến cho con luôn bị re-render

