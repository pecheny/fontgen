# Builfing on windows

## Requirements
- msvc, CMake, vcpkg. See details in [Chlumsky/msdfgen](https://github.com/Chlumsky/msdfgen?tab=readme-ov-file#getting-started) build instruction.
- lix

## Steps
```
git submodule update --init --recursive
cmake native/msdfgen --preset=win32
cmake --build native/msdfgen/build/win32 --config Release
pushd native
nmake Makefile.win # run in msvc console or add vcvars.cmd && before command
popd
lix download
npx haxe build-cpp.hxml 
```

I didn't reproduce all the steps from scratch but hope I don't miss some details.
