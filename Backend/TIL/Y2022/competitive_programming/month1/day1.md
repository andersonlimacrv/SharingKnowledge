### vector
- vector là mảng động

#### khai báo vector
#include <vector>
vector <kieu du lieu> <ten vector>;

vd:
vector <double> a;

#### mot so ham

##### .resize(<kick thuoc>): tao ra so luong phan tu tuong ung voi kich thuoc truyen vao

vd: a.resize(10); //tao ra 10 phan tu kieu double, cac phan tu duoc danh so 0 ->9 (a[0], ...a[9])

##### .push_back(<gia tri>): them mot phan tu mang gia tri tuong ung vao trong vector

a={1, 2, 3}
a.push_back(10)
a= {1, 2, 3, 10}

##### .pop_back(): xoa phan tu cuoi vector: Luu y vector phai co phan tu

a.pop_back();
a={1, 2, 3}

##### .size(): lay kich thuoc vector
##### .empty(): tra ve true/false tuong ung vector rong/chua rong

##### truy xuat phan tu trong vector: <ten vector> [<chi so>];

a={1, 2, 3, 4, 5, 10}

count << a[4]; // xuat so 5

Luu y: khong the truy xuat phan tu co vi tri ngoai vector

================================
Thuat toan sap xep (sorting)

#include <algorithm>

- de su dung ham sort ta goi ham sort
  + luu y: ham sort se loi neu cac phan tu trong mang khong phan biet thu tu

vd:

# kieu du lieu do nguoi dung tu dinh nghia
struct fraction {
	int deno, num;
};

vector <fraction> a;


sort(a.begin(), a.end()); // bao loi vi khong biet thang nao be hon thang nao

vector <int> a;
a={5, 2, 1, 9, 10, 8}

sort(a.begin(), a.end());

a={1, 2, 5, 8, 9, 10}


#### cach de su dung ham sort:

- doi voi vector:
sort(a.begin(), a.end());

- doi voi mang tinh:
a=[1, 2, 3, 4]
sort(a, a + <so luong phan tu trong day a>);
sort(a, a + 4);
