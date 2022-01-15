mkdir -p build_linux64 && cd build_linux64
cmake -DCMAKE_C_FLAGS=-m64 -DCMAKE_CXX_FLAGS=-m64 -DCMAKE_SHARED_LINKER_FLAGS=-m64 ../
cd ..
cmake --build build_linux64 --config Release
mkdir -p Plugins/Linux/x86_64/
cp build_linux64/libRecastDll.so Plugins/x86_64/libRecastDll.so
rm -rf build_linux64
