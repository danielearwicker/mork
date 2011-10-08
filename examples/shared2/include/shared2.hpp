#ifndef MORK_EXAMPLES_SHARED2_INCLUDED
#define MORK_EXAMPLES_SHARED2_INCLUDED

#ifdef CONFIG_VARIANT_windows
	#ifdef CONFIG_MODULE_shared2
		#define SHARED2_EXPORT __declspec(dllexport)
	#else
		#define SHARED2_EXPORT __declspec(dllimport)
	#endif
#else
	#define SHARED2_EXPORT
#endif

#include <string>

SHARED2_EXPORT std::string shared2_message();

#endif//MORK_EXAMPLES_SHARED2_INCLUDED
