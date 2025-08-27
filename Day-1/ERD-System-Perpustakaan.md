# ERD SYSTEM PERPUSTAKAAN
## [dbdiagram.io](https://dbdiagram.io/d/System-Perpustakaan-68ad5b0c1e7a61196799bc42)
```
Table Kategori {
  id int [pk]
  nama varchar
}

Table Rak_Buku {
  id int [pk]
  id_kategori int [ref: < Kategori.id]
  nama varchar
}

Table Buku {
  id int [pk]
  judul varchar
  penulis varchar
  tahun_terbit int
  id_kategori int [ref: > Kategori.id]
  id_rak int [ref: > Rak_Buku.id]
}

Table Petugas {
  id int [pk]
  nama varchar
}

Table Peminjam {
  id int [pk]
  nama varchar
}

Table Daftar_Peminjaman {
  id int [pk]
  id_peminjam int [ref: > Peminjam.id]
  id_buku int [ref: > Buku.id]
  id_petugas int [ref: > Petugas.id]
  waktu_dipinjam timestamp
  waktu_pengembalian timestamp
}

```

## Preview
![preview](image.png)