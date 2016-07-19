#
# Genaral Comments and build commands suitable for scripting
#
# ------------------------------------------------------
# 1 - Expected Directory Structure
# ------------------------------------------------------

> superklee$ ls

cfe-3.8.0.src (This is ported Clang 3.8b)       
cfe_build
compiler-rt-3.8.0.src (This is ported Compiler 3.8b)
compiler-rt_build  
llvm-3.8.0.src  
llvm_build
minisat      
minisat_build
klee-3.8.src (This is ported Klee 3.8)       
klee_build
stp
stp_build
Tests
README-1st.txt  
                    
# ------------------------------------------------------
# 2 - LLVM Libraries Build (sources cloned llvm.org)
# ------------------------------------------------------
# LLVM - Compiler-Rt and Clang have been all placed in 
# superklee project root directory (not as specified by
# llvm documentation, then they have to be build each on
# its own)

# LLVM: it was executed the install 
# command, path for install is /usr/local/bin

> tar -xvf llvm-3.8.0.src.tar.xz

> mkdir llmv_build
> mkdir compiler-rt-build

> cd llvm_build
> cmake -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
> cmake --build .
> sudo cmake --build . --target install
> cd ..

# ------------------------------------------------------
# 3 - CLANG 3.8b and Compiler-rt 3.8b (sources cloned from repo)
# ------------------------------------------------------

> cd compiler_rt_build
> cmake ../compiler-rt-3.8.0.src
> cmake --build .
> sudo cmake --build . --target install
> cd ..

> mkdir cfe_build
> cd cfe_build
> cmake ../cfe-3.8.0.src
> cmake --build .  
> cd ..

# Comments : 
# - Additional changes in file
# cfe-3.8.0.src/lib/CodeGen/CGExpr.cpp:
# //assert(IsSanitizerScope);
# - Warning: left behind debugging messages that 
# will generate following mesagges:
# NOW PENG's Routine running
# SrcType bits : 64, DstType bits: 32


# ------------------------------------------------------
# 4 - KLEE
# ------------------------------------------------------
# STP Solver

> git clone https://github.com/stp/minisat.git
> mkdir minisat_build
> cd minisat_build
> cmake ../minisat
> cmake --build .
> cd ..
> git clone https://github.com/stp/stp.git
> cd stp
> git checkout tags/2.1.2
> cd ..
> mkdir stp_build
> cd stp_build
> cmake -DBUILD_SHARED_LIBS:BOOL=OFF -DENABLE_PYTHON_INTERFACE:BOOL=OFF ../stp
> cmake --build .
> cd .. 

# Klee Tool
> mkdir klee_build
> cd klee_build cmake -DLLVM_DIR=../llvm_build/share/llvm/cmake ../klee-src/

# WARNING : still to complete Cmake for runtime lirbraies
# by now linked from shell in additional directory in superklee root
# Clang version is not the ported one (3.8b)

> superklee/klee_runtime>  clang-3.4 -c ../klee-3.8.src/runtime/Intrinsic/*.c -emit-llvm -I ../klee-3.8.src/include
> superklee/klee_runtime>  llvm-link *.bc  -o  kleeRuntimeIntrinsic.bc

# ------------------------------------------------------
# 5 - TESTS COMPLIE & RUN
# ------------------------------------------------------
> cd Tests
> ../cfe_build/bin/clang -I../klee-3.8.src/include/klee -c -emit-llvm -fsanitize=other signed.c
> mv signed.bc signed_f-sanit.bc
> llvm-dis signed_f-sanit.bc
> cat signed_f-sanit.ll

> ../klee_build/klee-3.8 signed_fsanit.bc

# ------------------------------------------------------


