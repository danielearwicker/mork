
# some cpp_flags for extra buffer checks: /GS /RTC1 /Ge
# but the embedded assembler irritates during debugging sessions

cpp_tool = cl
cpp_flags = -EHsc -nologo -c -DWIN32 -D_WINSOCKAPI_ -MD /Zi 
# Use Cygwin's g++ to generate dependencies for us!
cpp_generate_dependencies = g++-4 -c -MM -MP -MT $(2) -MF $(3) $(4) $(1)

cpp_output = -Fo
cpp_output_dir = obj
cpp_output_suffix = .obj

static_tool = lib
static_flags = -NOLOGO
static_output = -OUT:
static_output_dir = lib
static_output_prefix = 
static_output_suffix = .lib

shared_tool = @echo WIP...
shared_flags = -NOLOGO
shared_output = -OUT:
shared_output_dir = dll
shared_output_prefix = 
shared_output_suffix = .dll

exe_tool = link
exe_flags = -NOLOGO Advapi32.lib ws2_32.lib Delayimp.lib -NODEFAULTLIB:libc.lib,libcmt.lib,libcd.lib,libcmtd.lib,msvcrtd.lib -debug
exe_output = -OUT:
exe_output_dir = bin
exe_output_suffix = .exe
exe_libpath_prefix = -LIBPATH:
exe_libname_prefix = 

env_keyword = export
env_separator = ;
# A dummy var because setting the path is problematic
env_libpath = DLL_PATH

