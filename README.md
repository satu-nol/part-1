# \#1 Mengembangkan Firmware STM32F411 dengan VSCode + CMake + Ninja + GNUARM

Pengembangan *firmware* biasa dilakukan menggunakan IDE (*Integrated Development Environment*) dimana semua kelengkapan seperti *toolchain*, *editor*, dan *debugger* telah terintegrasi. Solusi IDE komersial untuk pengembangan *embedded software* seperti Keil dan IAR terbilang mahal dan sulit dijangkau oleh tim atau *developer* dengan *budget* yang terbatas. Pilihan lainnya adalah menggunakan IDE yang disediakan oleh *manufacturer* seperti STM32CubeIDE untuk seri STM32 dari STMicro atau DAVE IDE untuk seri XMC dari Infineon. IDE dari *manufacturer* biasanya berbasiskan *eclipse* dan memberikan fitur yang relatif lengkap.

Tulisan ini akan meng-*explore* lebih jauh tentang bagaimana kita bisa membangaun *firmware* untuk STM32F411 tidak menggunakan IDE komersial ataupun dari *manufacturer*. Melainkan menggunakan *tools* yang *open source*.
## *Setup*

Hal pertama yang diperlukan untuk mulai menulis *embedded software* adalah *editor*. Mayoritas *embedded software* ditulis dalam bahasa `C/C++`, jadi kita akan fokus pada *editor* yang mendukung bahasa tersebut. *Editor* yang akan digunakan dalam *project* ini adalah [VSCode](https://code.visualstudio.com/). Selain karena dukungan untuk `C/C++`, editor ini juga dipilih karena ketersedian *plugins* yang akan mempermudah integrasi dengan *build configuration tool*, *builder*, dan *toolchain*.

*Tools* yang akan digunakan pada tulisan ini tersedia dan mudah di-*install* di Linux. Namun tulisan ini akan fokus pada pengembangan di Windows. *Tools* yang digunakan akan lebih mudah di-*install* dan dikonfigurasi menggunakan [MSYS2](https://www.msys2.org/wiki/MSYS2-installation/).

```
pacman -S mingw-w64-x86_64-cmake
```

```
pacman -S mingw-w64-x86_64-ninja
```


```
pacman -S mingw-w64-x86_64-arm-none-eabi-toolchain
```

```
pacman -S mingw-w64-x86_64-srecord
```

## Struktur *project*

### *Libraries*

