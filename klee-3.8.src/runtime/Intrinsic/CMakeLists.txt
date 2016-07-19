
PROJECT ( runtime C CXX)

##########################
# Runtime libs setup
##########################
#WORK IN PROGRESS
file( GLOB KLEE_RUNTIME_SRC "*.c")


INCLUDE_DIRECTORIES ( 
	"${PROJECT_SOURCE_DIR}/../../include" 
#	"${PROJECT_BINARY_DIR}/include" 
	)


# Setup compilers used to build runtime library and run tests
SET (CMAKE_C_COMPILER             "/usr/bin/clang-3.4")
#SET (CMAKE_C_FLAGS          	  "-")

#SET ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -" )
#SET ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-builtin" )
SET ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -emit-llvm" )
SET ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto" )

#SET (CMAKE_C_FLAGS_DEBUG          "-g -emit-llvm -c")
SET (CMAKE_C_FLAGS_MINSIZEREL     "-Os -DNDEBUG")
SET (CMAKE_C_FLAGS_RELEASE        "-O4 -DNDEBUG")
SET (CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g")#
SET (CMAKE_CXX_COMPILER             "/usr/bin/clang++-3.4")
#SET (CMAKE_CXX_FLAGS                "-Wall -emit-llvm -fno-builtin  -c")
SET (CMAKE_CXX_FLAGS_DEBUG          "-g")
SET (CMAKE_CXX_FLAGS_MINSIZEREL     "-Os -DNDEBUG")
SET (CMAKE_CXX_FLAGS_RELEASE        "-O4 -DNDEBUG")
SET (CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
SET (CMAKE_AR      "/usr/local/bin/llvm-ar")
SET (CMAKE_LINKER  "/usr/local/bin/llvm-link")
SET (CMAKE_NM      "/usr/local/bin/llvm-nm")
SET (CMAKE_OBJDUMP "/usr/local/bin/llvm-objdump")
SET (CMAKE_RANLIB  "/usr/local/bin/llvm-ranlib")

SET (CMAKE_LD_FLAGS  "${CMAKE_LD_FLAGS} -module" )
#SET (CMAKE_LD_FLAGS  "${CMAKE_LD_FLAGS} -flto" )

#set( CMAKE_C_CREATE_SHARED_LIBRARY "<CMAKE_C_COMPILER> ...")
#set( CMAKE_C_CREATE_SHARED_MODULE  "<CMAKE_C_COMPILER> ...")
#set( CMAKE_C_LINK_EXECUTABLE       "<CMAKE_C_COMPILER> ...")
#set( CMAKE_CXX_CREATE_SHARED_LIBRARY "<CMAKE_CXX_COMPILER> ...")
#set( CMAKE_CXX_CREATE_SHARED_MODULE  "<CMAKE_CXX_COMPILER> ...")
#set( CMAKE_CXX_LINK_EXECUTABLE       "<CMAKE_CXX_COMPILER> ...")


#set_source_files_properties(runtime/Intrinsics/*.c PROPERTIES CMAKE_CXX_COMPILER  "clang++")
#set_source_files_properties(runtime/Intrinsics/*.c PROPERTIES CMAKE_C_FLAGS "-Wall -emit-llvm -c")
ADD_LIBRARY( kleeRuntimeIntrinsic ${KLEE_RUNTIME_SRC} )

#REQUIRES_RTTI := 0

#BYTECODE_LIBRARY=1
#DONT_BUILD_RELINKED=1
#DEBUG_RUNTIME=1
#NO_PEDANTIC=1
#NO_BUILD_ARCHIVE=1
#C.Flags += -fno-builtin




