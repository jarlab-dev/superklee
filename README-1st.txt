#
# SETUP, Current release warnings, Klee tool usage
#
# ------------------------------------------------------
# 1 - SETUP 
# ------------------------------------------------------

git clone https://github.com/rodrijuana/superklee
cd superklee/KLEE_SETUP
cmake CMakeLists.txt
 
# ------------------------------------------------------
# 2 - CLANG 3.8b and Compiler-rt 3.8b
# ------------------------------------------------------
# Comments : 
# - Additional changes in file
# cfe-3.8.0.src/lib/CodeGen/CGExpr.cpp:
# //assert(IsSanitizerScope);
# - Warning: left behind debugging messages that 
# will generate following mesagges:
# NOW PENG's Routine running
# SrcType bits : 64, DstType bits: 32

# ------------------------------------------------------
# 3 - KLEE RUNTIME LIBS
# ------------------------------------------------------
# WARNING : still to complete Cmake for runtime libraries
# by now linked from shell in additional directory in superklee root
# Clang version is not the ported one (3.8b)
> superklee/klee_runtime>  clang-3.4 -c ../klee-3.8.src/runtime/Intrinsic/*.c -emit-llvm -I ../klee-3.8.src/include
> superklee/klee_runtime>  llvm-link *.bc  -o  kleeRuntimeIntrinsic.bc

# ------------------------------------------------------
# 4 - KLEE USAGE: TESTS COMPLIE & RUN
# ------------------------------------------------------
> cd Tests
> ../cfe_build/bin/clang -I../klee-3.8.src/include/klee -c -emit-llvm -fsanitize=other signed.c
> mv signed.bc signed_f-sanit.bc
> llvm-dis signed_f-sanit.bc
> cat signed_f-sanit.ll

> ../klee_build/klee-3.8 signed_fsanit.bc

# ------------------------------------------------------


