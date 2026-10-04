//member gaboleh minjam lebih dari 3 buku
bool cekMaksPinjam(int jumlahBukuDipinjam) {
  return jumlahBukuDipinjam >= 3;
}

//kalo buku status "dipinjam" tidak bisa dipinjam
bool cekBukuSedangDipinjam(String statusBuku) {
  return statusBuku == "dipinjam";
}

// proses peminjaman nya, hasilnya berupa pesan
String prosesPinjam(int jumlahBukuDipinjam, String statusBuku) {
  if (cekMaksPinjam(jumlahBukuDipinjam)) {
    return "Gagal: maksimal pinjam 3 buku";
  }
  if (cekBukuSedangDipinjam(statusBuku)) {
    return "Gagal: buku sedang dipinjam";
  }
  return "Peminjaman berhasil";
}

// denda Rp1.000 kalo setiap hari keterlambatan
int hitungDenda(int hariTerlambat) {
  return hariTerlambat > 0 ? hariTerlambat * 1000 : 0;
}

void main() {
  // Skenario 1 kalo pinjam nya berhasil
  print(prosesPinjam(1, "tersedia"));
  // Skenario 2 gagal kalo buku sedang dipinjam
  print(prosesPinjam(1, "dipinjam"));
  // Skenario 3 gagal karena maksimal pinjam 3
  print(prosesPinjam(3, "tersedia"));
  // Skenario 4 kalo kembaliin buku tepat waktu
  print("Denda: Rp${hitungDenda(0)}");
  // Skenario 5 kalo telat balikin buku denda 4000
  print("Denda: Rp${hitungDenda(4)}");
}