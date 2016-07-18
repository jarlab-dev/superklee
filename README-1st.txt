# ------------------------------------------------------
# 1 - Directory Peparation 
# ------------------------------------------------------
mkdir llvm_build
mkdir compiler-rt_build


# ------------------------------------------------------
# 1 - Libraries Build
# ------------------------------------------------------

## LLVM 

cd llvm_build
cmake -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
cmake --build .
sudo cmake --build . --target install
cd ..

# ------------------------------------------------------

## Compiler-Rt

cd compiler_rt_llvm
cmake -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
cmake --build .
sudo cmake --build . --target install
cd ..

# ------------------------------------------------------

## CLANG

cd 





# ------------------------------------------------------
##KLEE

#>STP Solver

cd minisat_build
cmake ../minisat
cmake --build .
cd ..

cd stp_build
cmake -DBUILD_SHARED_LIBS:BOOL=OFF -DENABLE_PYTHON_INTERFACE:BOOL=OFF ../stp
cmake --build .
cd .. 

cd klee_build cmake -DLLVM_DIR=../llvm_build/share/llvm/cmake ../klee-src/

# ------------------------------------------------------

# Additionl Changes:
# In file: cfe-3.8.0.src/lib/CodeGen/CGExpr.cpp
# //assert(IsSanitizerScope);

# WARNING - left behind debugging messages generate followign mesagges:
>>> EmitScalarConv, SrcType: long, DstType: int
NOW PENG's Routine running
SrcType bits : 64, DstType bits: 32



# ------------------------------------------------------
## TEST COMPLIE
> cd Tests
> ../cfe_build/bin/clang -I../klee/include/klee -c -emit-llvm -fsanitize=other signed.c
> mv signed.bc signed_f-sanit.bc
> llvm-dis signed_f-sanit.bc
> cat signed_f-sanit.ll

# ------------------------------------------------------


