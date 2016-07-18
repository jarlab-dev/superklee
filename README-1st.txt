git clone http://llvm.org/git/llvm.git

git clone http://llvm.org/git/clang.git

git clone http://llvm.org/git/compiler-rt.git


> mkdir build_llvm
> cd build_llvm
> cmake -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
> cmake --build .

> sudo cmake --build . --target install




Additionl Changes


cfe-3.8.0.src/lib/CodeGen/CGExpr.cpp


  //assert(IsSanitizerScope);
