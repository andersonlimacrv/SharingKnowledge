[float vs double vs decimal](What is the difference between decimal, float and double?)

```html
Float - 7 digits (32 bit)
Double-15-16 digits (64 bit)
Decimal -28-29 significant digits (128 bit)
```

```html
Decimals have much higher precision and are usually used within financial applications that require a high degree of accuracy. Decimals are much slower (up to 20X times in some tests) than a double/float.

Decimals and Floats/Doubles cannot be compared without a cast whereas Floats and Doubles can. Decimals also allow the encoding or trailing zeros.
```

### notes
- precision: độ chính xác



```html
p: precision
s: scale

123.45 (p=5,s=2)
12.34 (p=4,s=2)
12345 (p=5,s=0)
123.4 (p=4,s=1)
0 (p=0,s=0)
```