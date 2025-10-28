---
layout: post
title: "Memulai Perjalanan Mendokumentasi Pekerjaan Dengan Jekyll"
date: 2025-10-28 21:22:00 +0700
categories: jekyll
tags: [jekyll, blog]
---



Ini adalah post pertamakali saya untuk mendokumentasikan pekerjaan yang sedang atau akan saya lakukan,
adapun tujuan website ini adalah untuk mempermudah pencatatan dan pengingat untuk saya sendiri, jika memungkinakan juga bisa berguna untuk orang banyak.

**kenapa menggunakan jekyll?**


karena gampang dan bisa langsung dipakai di-github sebagai website, penggunanya sendiri tinggal mengikuti dokumentasi pada websitenya
[https://jekyllrb.com/docs](https://jekyllrb.com/docs)

---------------------------

### Pemasangan Peralatan
karena saya menggunakan Linux Fedora jadi yang harus saya lakukan adalah memasang peralatan yang dibutuhkan seperti berikut:
```
sudo dnf install ruby ruby-devel openssl-devel redhat-rpm-config gcc-c++ @development-tools
```

kemudian menjalankan perintah untuk memasang jekyll beserta paketnya
```
gem install jekyll bundler
```


---------------------------
### Membuat Proyek
jika jekyll sudah terpasang pada Sistem Operasi (punya saya adalah Linux Fedora) maka selanjutnya adalah membuat proyek menggunakan jekyll dengan perintah:
```
jekyll new nama_proyeknya
```

---------------------------

### Menjalankan Proyek Jekyll
jika proyek sudah dibuat silahkan buka menggunakan editor teks, disini saya menggunakan [vscode](https://code.visualstudio.com), jika sudah kita dapat menjalankan perintah berikut:
```
bundle exec jekyll serve
```

kemudian buka browser http://localhost:4000

---------------------------

### Perintah - Perintah Penting
berikut ini adalah perintah perintah penting yang digunakan pada saat pengembangan proyek jekyll ini
#### Memasang Paket *Bundle*
perintah ini digunakan jika kita menambah sesuatu pada file **Gemfile** seperti menambahkan kebutuhan tertentu untuk proyek
```
bundle install 
```

#### Membersihkan Proyek
jika merasa website tidak ada perubahan bisa jalan kan perintah dibawah untuk membersihkan *cache*
```
bundle exec jekyll clean
```

#### Membangun Proyek
digunakan untuk membangun proyek jekyll, yang nantinya akan membuat folder **_site**
```
bundle exec jekyll build
```