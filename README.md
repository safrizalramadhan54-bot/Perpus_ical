# HW 2 — Computational Thinking dengan Dart



# Dokumen Analisis PERPUSTAKAAN

## 1. Problem Statement
Anggota perpustakaan dapat meminjam buku, tetapi jumlah buku yang dipinjam dibatasi maksimal 3 dan buku yang sedang dipinjam tidak bisa dipinjam lagi. Jika buku dikembalikan terlambat, anggota dikenakan denda Rp1.000 untuk setiap hari keterlambatan.

## 2. Actor
Anggota perpustakaan

Anggota merupakan pihak yang meminjam buku dan mengembalikan buku, sehingga berhubungan langsung dengan aturan peminjaman dan denda.

## 3. Input & Output

### Input
- Jumlah buku yang sedang dipinjam anggota
- Status buku ("tersedia" atau "dipinjam")
- Jumlah hari keterlambatan

### Output
- Status peminjaman
  - Peminjaman berhasil
  - Gagal karena sudah meminjam 3 buku
  - Gagal karena buku sedang dipinjam
- Total denda keterlambatan

## 4. Functional Requirement

| Kode | Functional Requirement |
|------|------------------------|
| FR-01 | Sistem dapat memeriksa apakah anggota sudah mencapai batas pinjam. |
| FR-02 | Sistem dapat memeriksa apakah buku sedang dipinjam. |
| FR-03 | Sistem dapat memproses peminjaman dan menampilkan hasilnya. |
| FR-04 | Sistem dapat menghitung denda berdasarkan hari keterlambatan. |

## 5. Business Rules

| Kode | Business Rule |
|------|---------------|
| BR-01 | Anggota maksimal meminjam 3 buku. |
| BR-02 | Buku yang sedang dipinjam tidak bisa dipinjam. |
| BR-03 | Denda keterlambatan Rp1.000 per hari. |

## 6. Decomposition

```
perpustakaan
│
├── prosesPinjam
│   ├── cekMaksPinjam           (BR-01)
│   └── cekBukuSedangDipinjam   (BR-02)
│
└── hitungDenda                 (BR-03)
```

## 7. Pattern Recognition

1. **Validasi berurutan**
   Setiap peminjaman selalu melewati pengecekan yang sama: batas pinjam dulu, lalu status buku. Kalau ada yang gagal, proses berhenti dan menampilkan alasannya.

2. **Perhitungan denda**
   Denda selalu dihitung dengan cara yang sama: hari terlambat dikali Rp1.000. Kalau tidak terlambat, denda 0.

## 8. Abstraction

Data yang dibutuhkan untuk menyelesaikan masalah ini:

- **jumlahBukuDipinjam** → jumlah buku yang sedang dipinjam anggota.
- **statusBuku** → "tersedia" atau "dipinjam".
- **hariTerlambat** → jumlah hari keterlambatan pengembalian.

Data lain seperti nama anggota, judul buku, dan penerbit diabaikan karena tidak mempengaruhi aturan peminjaman dan denda.

## 9. Algorithm

### Flowchart

```
          START
            │
            ▼
  Input jumlahBukuDipinjam, statusBuku
            │
            ▼
  ┌──────────────────────┐  Ya
  │ jumlah buku >= 3 ?   ├──────► "Gagal: maksimal pinjam 3 buku" ──┐
  └──────────┬───────────┘                                          │
         Tidak│                                                     │
            ▼                                                       │
  ┌──────────────────────┐  Ya                                      │
  │ status = "dipinjam"? ├──────► "Gagal: buku sedang dipinjam" ────┤
  └──────────┬───────────┘                                          │
         Tidak│                                                     │
            ▼                                                       │
   "Peminjaman berhasil"                                            │
            │                                                       │
            ▼                                                       │
        tampilkan pesan ◄───────────────────────────────────────────┘
            │
            ▼
     Input hariTerlambat
            │
            ▼
  ┌──────────────────────┐  Tidak
  │ hariTerlambat > 0 ?  ├──────► denda = 0 ──┐
  └──────────┬───────────┘                    │
          Ya │                                │
            ▼                                 │
  denda = hariTerlambat x 1000                │
            │                                 │
            ▼                                 │
      tampilkan denda ◄───────────────────────┘
            │
            ▼
           END
```

### Pseudocode

```
PROCEDURE prosesPinjam(jumlahBukuDipinjam, statusBuku)
    IF jumlahBukuDipinjam >= 3 THEN              // BR-01
        RETURN "Gagal: maksimal pinjam 3 buku"
    END IF
    IF statusBuku = "dipinjam" THEN              // BR-02
        RETURN "Gagal: buku sedang dipinjam"
    END IF
    RETURN "Peminjaman berhasil"
END PROCEDURE

PROCEDURE hitungDenda(hariTerlambat)
    IF hariTerlambat > 0 THEN                    // BR-03
        RETURN hariTerlambat * 1000
    END IF
    RETURN 0
END PROCEDURE
```

---

# Tabel Traceability

| Business Rule | Function | Diuji pada skenario |
|---------------|----------|---------------------|
| BR-01 Maksimal pinjam 3 buku | `cekMaksPinjam`, `prosesPinjam` | Skenario 3 (sudah pinjam 3 buku, buku tersedia) |
| BR-02 Buku sedang dipinjam tidak bisa dipinjam | `cekBukuSedangDipinjam`, `prosesPinjam` | Skenario 2 (pinjam 1 buku, buku "dipinjam") |
| BR-03 Denda Rp1.000 per hari | `hitungDenda` | Skenario 4 (0 hari), Skenario 5 (4 hari) |

Skenario 1 (pinjam 1 buku, buku "tersedia") menguji kasus sukses: semua business rule terpenuhi.
