mkdir -p build_linux32 && cd build_linux32
cmake -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_SHARED_LINKER_FLAGS=-m32 ../
cd ..
cmake --build build_linux32 --config Release
mkdir -p Plugins/Linux/x86_32/
cp build_linux32/libRecastDll.so Plugins/x86_32/libRecastDll.so
rm -rf build_linux32
