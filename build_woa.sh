# https://gist.github.com/jgbabyn/ce4bf3bc25e781b5733d7e1c25bf988e
pacman -Su mingw-w64-clang-aarch64-clang mingw-w64-clang-aarch64-ctags mingw-w64-clang-aarch64-freetype mingw-w64-clang-aarch64-gnutls mingw-w64-clang-aarch64-harfbuzz mingw-w64-clang-aarch64-jansson mingw-w64-clang-aarch64-libtree-sitter mingw-w64-clang-aarch64-libwinpthread mingw-w64-clang-aarch64-texinfo mingw-w64-clang-aarch64-xpm-nox mingw-w64-clang-aarch64-zlib mingw-w64-clang-aarch64-autotools mingw-w64-clang-aarch64-cc mingw-w64-clang-aarch64-giflib mingw-w64-clang-aarch64-libjpeg-turbo mingw-w64-clang-aarch64-libpng mingw-w64-clang-aarch64-librsvg mingw-w64-clang-aarch64-libtiff mingw-w64-clang-aarch64-libxml2 patch autoconf autogen make

mkdir ./bin

wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/heads/master/mingw-w64-emacs/001-ucrt.patch
wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/heads/master/mingw-w64-emacs/002-clang-fixes.patch
wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/heads/master/mingw-w64-emacs/003-aarch64-fixes.patch
wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/heads/master/mingw-w64-emacs/emacs-ARM64.manifest

cp ./emacs-ARM64.manifest ./nt

patch -Np1 -i ./001-ucrt.patch
patch -Np1 -i ./002-clang-fixes.patch
patch -Np1 -i ./003-aarch64-fixes.patch

./autogen.sh

./configure \
    --prefix=./bin \
    --host="${MINGW_CHOST}" \
    --build="${MINGW_CHOST}" \
    --with-modules \
    --without-dbus \
    --without-compress-install \
    --with-tree-sitter \

make actual-all -j 8
make install

cd ./bin/lib
mkdir dll
cp /clangarm64/bin/*.dll ./dll

