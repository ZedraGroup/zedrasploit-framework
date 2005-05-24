#ifndef _ZETERPRETER_LIB_LINKAGE_H
#define _ZETERPRETER_LIB_LINKAGE_H

#ifdef USE_DLL
	#ifdef ZETERPRETER_EXPORTS
		#define LINKAGE __declspec(dllexport)
	#else
		#define LINKAGE __declspec(dllimport)
	#endif
#else
	#define LINKAGE
#endif

#endif