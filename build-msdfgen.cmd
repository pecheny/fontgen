rem if build fails check msdfgen folder for cmake caches and other temporary files
rd /q /s native\msdfgen-bin
cd native
mkdir msdfgen-bin
cd msdfgen-bin
cmake  -DCMAKE_TOOLCHAIN_FILE=%vcpkg_path%/scripts/buildsystems/vcpkg.cmake -DCMAKE_CXX_FLAGS="/MD" -DCMAKE_BUILD_TYPE=Release ../msdfgen -A Win32 
cmake --build . --config Release