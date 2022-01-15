if [ -z "$ANDROID_NDK" ]; then
    export ANDROID_NDK=./Tools/android-ndk-r23b
fi

# CMAKE_TOOLCHAIN_FILE替换成自己下载的ndk包路径
# android ndk下载地址：https://dl.google.com/android/repository/android-ndk-r23b-linux.zip

# arm64-v8a
mkdir -p build_v8a && cd build_v8a
cmake -DANDROID_ABI=arm64-v8a -DCMAKE_TOOLCHAIN_FILE=./Tools/android-ndk-r23b/build/cmake/android.toolchain.cmake -DANDROID_TOOLCHAIN_NAME=aarch64-linux-android-clang3.6 -DANDROID_NATIVE_API_LEVEL=android-9 ../
cd ..
cmake --build build_v8a --config Release
mkdir -p Plugins/Android/libs/arm64-v8a/
cp build_v8a/libRecastDll.so Plugins/Android/libs/arm64-v8a/libRecastDll.so
rm -rf build_v8a

# armeabi-v7a
mkdir -p build_v7a && cd build_v7a
cmake -DANDROID_ABI=armeabi-v7a -DCMAKE_TOOLCHAIN_FILE=./Tools/android-ndk-r23b/build/cmake/android.toolchain.cmake -DANDROID_TOOLCHAIN_NAME=arm-linux-androideabi-clang3.6 -DANDROID_NATIVE_API_LEVEL=android-9 ../
cd ..
cmake --build build_v7a --config Release
mkdir -p Plugins/Android/libs/armeabi-v7a/
cp build_v7a/libRecastDll.so Plugins/Android/libs/armeabi-v7a/libRecastDll.so
rm -rf build_v7a

# x86
mkdir -p build_x86 && cd build_x86
cmake -DANDROID_ABI=x86 -DCMAKE_TOOLCHAIN_FILE=./Tools/android-ndk-r23b/build/cmake/android.toolchain.cmake -DANDROID_TOOLCHAIN_NAME=x86-clang3.6 -DANDROID_NATIVE_API_LEVEL=android-9 ../
cd ..
cmake --build build_x86 --config Release
mkdir -p Plugins/Android/libs/x86/
cp build_x86/libRecastDll.so Plugins/Android/libs/x86/libRecastDll.so
rm -rf build_x86

# x86_64
mkdir -p build_x86_64 && cd build_x86_64
cmake -DANDROID_ABI=x86_64 -DCMAKE_TOOLCHAIN_FILE=./Tools/android-ndk-r23b/build/cmake/android.toolchain.cmake -DANDROID_TOOLCHAIN_NAME=x86_64-clang3.6 -DANDROID_NATIVE_API_LEVEL=android-9 ../
cd ..
cmake --build build_x86_64 --config Release
mkdir -p Plugins/Android/libs/x86_64/
cp build_x86_64/libRecastDll.so Plugins/Android/libs/x86_64/libRecastDll.so
rm -rf build_x86_64

