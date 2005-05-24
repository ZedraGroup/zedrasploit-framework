#ifndef _ZETERPRETER_SERVER_ZETSRV_H
#define _ZETERPRETER_SERVER_ZETSRV_H

/*
 * Version number
 *                               v------- major major
 *                                 v----- major minor
 *                                   v--- minor major
 *                                     v- minor minor
 */
#define ZETSRV_VERSION_NUMBER 0x00000500

#define USE_DLL
#define ZETERPRETER_EXPORTS
#include "../common/common.h"

#include "remote_dispatch.h"
#include "libloader.h"

#endif