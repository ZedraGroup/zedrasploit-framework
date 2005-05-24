#ifndef _ZETERPRETER_LIB_ARGS_H
#define _ZETERPRETER_LIB_ARGS_H

#include "linkage.h"

typedef struct 
{
	DWORD currentIndex;
	PCHAR argument;
	CHAR  toggle;
} ArgumentContext;

LINKAGE DWORD args_parse(UINT argc, CHAR **argv, PCHAR params, 
		ArgumentContext *ctx);

#endif