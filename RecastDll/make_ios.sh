# 设置好Xcode的路径是/Application/Xcode.app
# 如果系统中包含多个xcode版本，最好使用sudo xcode-select --switch /Applications/Xcode.app进行指定

mkdir -p build_ios && cd build_ios
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/iOS.cmake -GXcode ../
cd ..
cmake --build build_ios --config Release
mkdir -p Plugins/iOS/
#exist_armv7=`lipo -info build_ios/Release-iphoneos/libRecastDll.a | grep armv7 | wc -l`
exist_arm64=`lipo -info build_ios/Release-iphoneos/libRecastDll.a | grep arm64 | wc -l`
#if [ $[exist_armv7] -eq 0 ]; then
#	echo "** ERROR **: No support for armv7, maybe XCode version is to high, use manual_build_ios instead!"
#el
if [ $[exist_arm64] -eq 0 ]; then
	echo "** ERROR ** : No support for arm64, maybe XCode version is to high, use manual_build_ios instead!"
else
	cp build_ios/Release-iphoneos/libRecastDll.a Plugins/iOS/libRecastDll.a
    rm -rf build_io
fi
