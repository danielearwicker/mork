
define module_type_exe

$$(eval $$(call module_type_native,$(1),$(2)))

$(2)_main = $(1)/$(exe_output_dir)/$(exe_output_prefix)$(2)$(exe_output_suffix)
$(2)_output_dirs = $(1)/$(cpp_output_dir) $(1)/$(exe_output_dir) $(1)/gen

$$($(2)_main): $$($(2)_dependencies) $$($(2)_cpp_outputs)
	$($(2)_prebuild)
	mkdir -p $(1)/$(exe_output_dir)
	$(exe_tool) $(exe_flags) $(exe_output)$$($(2)_main) $$($(2)_cpp_outputs) $$(foreach r,$$($(2)_requires),$$($$(r)_link))
	$(env_keyword) $(env_libpath)=$$(foreach sp,$$(sort $$($(2)_shared_path)),$$(sp)$(env_separator)) ; $($(2)_postbuild)

endef

