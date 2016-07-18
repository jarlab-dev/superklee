


> mkdir llvm_build
> cd llvm_build
> cmake -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
> cmake --build .
> sudo cmake --build . --target install


> mkdir compiler-rt_build
> cd compiler_rt_llvm
> cmake -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
> cmake --build .
> sudo cmake --build . --target install


#KLEE
cmake -DLLVM_DIR=../llvm_build/share/llvm/cmake ../klee-src/


Additionl Changes


cfe-3.8.0.src/lib/CodeGen/CGExpr.cpp


  //assert(IsSanitizerScope);
