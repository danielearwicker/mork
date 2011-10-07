
define module_type_native

# Call with parameters: 1=cpp-source-file 2=obj-output-file (note: unescaped $(2) is something else!)
$(2)_cpp_compile = mkdir -p  $$(dir $$(2)) ; \
	$(cpp_tool) $(cpp_flags) $$($(2)_cpp_extra_flags) -DCONFIG_VARIANT_$(config_variant) $$($(2)_include) $(cpp_output)$$(2) $$(1) ; \
	$(call cpp_generate_dependencies,$$(1),$$(2),$$(patsubst %$(cpp_output_suffix),%.d,$$(2)),$$($(2)_include))

# Rule for building C++ sources to obj subdirectory
$(1)/$(cpp_output_dir)/%$(cpp_output_suffix) : $(1)/%.cpp $$($(2)_dependencies) 
	$$(call $(2)_cpp_compile,$$<,$$@)

# Similar for building code-generation C++ sources
$(1)/$(cpp_output_dir)/%$(cpp_output_suffix) : $(1)/gen/%.cpp $$($(2)_dependencies) 
	$$(call $(2)_cpp_compile,$$<,$$@)

$(2)_cpp_sources = $$(wildcard $(1)/*.cpp)

$(2)_cpp_outputs_static = $$(addprefix $(1)/$(cpp_output_dir)/,$$(notdir $$(patsubst %.cpp,%$(cpp_output_suffix),$$($(2)_cpp_sources))))
$(2)_cpp_outputs_codegen = $$($(2)_codegen_outputs:$(1)/gen/%.cpp=$(1)/$(cpp_output_dir)/%$(cpp_output_suffix))
$(2)_cpp_outputs = $$($(2)_cpp_outputs_codegen) $$($(2)_cpp_outputs_static) 

-include $$($(2)_cpp_outputs:$(cpp_output_suffix)=.d) 

# The include flags needed to compile against this module
$(2)_include = -I$(1)/include -I$(1)/gen/include $$(foreach r,$$($(2)_requires),$$($$(r)_include))

# Shared libraries that can be copied into the same directory as an executable
$(2)_sharedlibs = $$(foreach r,$$($(2)_requires),$$($$(r)_sharedlibs))

# Paths where further shared libraries can be found
$(2)_shared_path = $$(foreach r,$$($(2)_requires),$$($$(r)_shared_path))

$$($(2)_codegen_outputs):
	mkdir -p $(1)/gen/include
	$$($(2)_codegen_command)

endef
