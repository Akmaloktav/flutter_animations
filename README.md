# Belajar flutter_animations

Konsep Animasi di Flutter
Nilai suatu property berubah secara bertahap dari awal menuju akhir dalam rentang Waktu tertentu.

Komponen Dasar Animasi di Flutter
- Nilai awal, kondisi awal sebelum animasi dimulai
- Nilai akhir,kondisi akhir Ketika animasi selesai berjalan
- Durasi, Waktu berjalannya animasi atau seberapa lama animasi berjalan
- frame, perubahan tampilan secara berkala
- kurva, pola percepatan atau perlambatan Gerakan animasi, misal easein, easeout, atau easeinout

Animasi di Flutter dibagi menjadi 2 Implicit Animation dan Explicit Animation.

Implicit Animation
Jenis animasi yang secara otomatis menganimasikan perubahan nilai suatu property tanpa perlu mengatur proses animasi secara manual.

AnimatedContainer
Animated Container adalah versi animasi dari widget Container, fokusnya property-property visual seperti warna, ukuran, border dan properti-properti lain yang ada di widget container

Opacity adalah tingkat keterlihatan suatu objek berada direntang 0.0 hingga 1.0 yang dimana 0.0 artinya tidak terlihat dan 1.0 artinya terlihat

Animated opacity adalah widget yang membantu menganimasikan perubahan tingkat transparansi suatu widget, fokusnya pada property opacity. animated opacity tidak mengapus suatu widget tetapi hanya menghilangkan tingkat transparansinya

Animated Slide adalah widget animasi implisit di flutter yang digunakan untuk menggeser(slide/translate) posisi widget anak berdasarkan persentase relative ukuran widget itu sendiri. Trigger state berupa property Offset

Animated Scale adalah widget animasi implisit di flutter yang digunakan untuk menganimasikan perubahan scale (scale factor / pembesaran/pengecilan) widget anak secara halus dan proporsional tanpa memengaruhi tata letak elemen disekitarnya. Nilai scale 1.0 adalah ukuran asli, 2.0 adalah dua kali lipatnya ukuran asli sedangkan 0.0 adalah menghilang sempurna

Animated Positioned adalah widget animasi implisit di flutter yang secara otomatis menganimasikan perubahan posisi dan ukuran widget anak di dalam stack. Mengontrol posisi left, right, bottom dan top selain itu width dan height juga termasuk dalam control dari animasi ini. 

Animated Align adalah komponen widget flutter yang berguna untuk mengubah posisi atau perataan (alignment) suatu elemen anak secara halus dan otomatis menggunakan animasi perpindahan Waktu. Widget ini mangatur perpindahan posisi child di dalam area yang dimilikinya.Fokusnya adalah mengubah nilai alignmentnya bukan berpindah posisi ke sembarang tempat.

Animated CrossFade adalah widget animasi implisit di flutter yang dirancang khusus untuk melakukan transisi pergantian secara halus(cross-fade) antara dua widget berbeda(firstChild dan secondChild), sekaligus menyesuaikan perubahan ukuran(size morphing) secara otomatis jika kedua widget tersebut memiliki dimensi yang berbeda. Widget ini menggabungkan efek fade out pada widget lama, fade in pada widget baru, dan animasi ukuran dalam satu komponen.

Animated Switcher adalah widget animasi implisit di flutter yang secara otomatis menganimasikan pergantian dari satu widget anak(child) ke widget anak lainnya setiap kali identitas atau tipe dari widget anak tersebut berubah. Flutter memeriksa apakah child baru berbeda dengan child saat ini berdasarkan tipe kelas atau nilai Key-nya. Animated switcher hanya menerima satu parameter child yang dinamis dan mampu menangani pergantian banyak widget, data, atau status yang tidak terbatas. 

TweenAnimationBuilder adalah widget yang digunakan untuk membuat animasi implisit kustom. Dirancang untuk menganimasikan perubahan nilai property visual apapun secara halus tanpa mengharuskan mengelola animation controller atau statefulwidget dengan tickerprovider secara manual. Dapat menganimasikan tipe data apapun selama memiliki representasi tween.
