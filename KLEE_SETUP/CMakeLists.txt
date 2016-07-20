#Usage
#cmake -D=po

PROJECT (klee_install)

cmake_minimum_required(VERSION 3.6)


#work-in-progress
message( STATUS "CMAKE Running From: ${CMAKE_SOURCE_DIR}")

SET(SUPERKLEE_DIR "../../superklee2/superklee")

if ("${LLVM_DIR}" STREQUAL "") 
	  SET(LLVM_DIR "/usr/local/bin")
	  message( STATUS "LLVM From: ${LLVM_DIR}")

else ()
      message( STATUS "LLVM From: ${LLVM_DIR}")
endif()

#--

#execute_process(COMMAND mkdir compiler-rt_build WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
#execute_process(COMMAND cmake ../${SUPERKLEE_DIR}/compiler-rt-3.8.0.src WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/compiler-rt_build)
execute_process(COMMAND cmake --build . WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/compiler-rt_build)
# sudo cmake --build . --target install

#TODO: set checks of already existing dirs & git sources
execute_process(COMMAND mkdir cfe_build WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
execute_process(COMMAND cmake ../${SUPERKLEE_DIR}/cfe-3.8.0.src WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cfe_build)
execute_process(COMMAND cmake --build . WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cfe_build)
#execute_process(COMMAND git clone https://github.com/stp/minisat.git)
#execute_process(COMMAND mkdir minisat_build WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
#execute_process(COMMAND cmake ../${SUPERKLEE_DIR}/minisat WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/minisat_build)
#execute_process(COMMAND cmake --build . WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/minisat_build)
#execute_process(COMMAND git clone https://github.com/stp/stp.git)
#execute_process(COMMAND git checkout tags/2.1.2 WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/stp)
#execute_process(COMMAND mkdir stp_build WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
#execute_process(COMMAND cmake -DBUILD_SHARED_LIBS:BOOL=OFF -DENABLE_PYTHON_INTERFACE:BOOL=OFF ../${SUPERKLEE_DIR}/stp WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/stp_build)
#execute_process(COMMAND cmake --build . WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/stp_build)
#execute_process(COMMAND mkdir klee_build WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
#execute_process(COMMAND cmake -DLLVM_DIR=${LLVM_DIR} ../${SUPERKLEE_DIR}/klee-3.8.src WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/klee_build)




## BY-NOW using pre-build library
## Clang version is not the ported one (3.8b)
##> superklee/klee_runtime>  clang-3.4 -c ../klee-3.8.src/runtime/Intrinsic/*.c -emit-llvm -I ../klee-3.8.src/include
##> superklee/klee_runtime>  llvm-link *.bc  -o  kleeRuntimeIntrinsic.bc
