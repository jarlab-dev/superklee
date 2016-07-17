git clone http://llvm.org/git/llvm.git

git clone http://llvm.org/git/clang.git

git clone http://llvm.org/git/compiler-rt.git


> mkdir build_llvm
> cd build_llvm
> cmake -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
> cmake --build .
