
cpp_tool = g++
cpp_flags = -c -DPOSIX -g -O0 -fno-inline -MD -MP
# We generate dependencies at same time as compiling (-MD)
cpp_generate_dependencies = 
cpp_output = -o
cpp_output_dir = obj
cpp_output_suffix = .o

static_tool = ar
static_flags = -cr
static_output = -o 
static_output_dir = lib
static_output_prefix = lib
static_output_suffix = .lib

shared_tool = @echo WIP...
shared_flags = -cr
shared_output = -o 
shared_output_dir = so
shared_output_prefix = 
shared_output_suffix = .so

exe_tool = g++
exe_flags = 
exe_output = -o 
exe_output_dir = bin
exe_output_suffix =
exe_libpath_prefix = -L
exe_libname_prefix = 

env_keyword = export
env_separator = :
env_libpath = LD_LIBRARY_PATH

