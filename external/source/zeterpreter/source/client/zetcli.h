#ifndef _ZETERPRETER_CLIENT_ZETCLI_H
#define _ZETERPRETER_CLIENT_ZETCLI_H

#include "../common/common.h"

#include "console.h"
#include "module.h"

VOID client_init_lock();
VOID client_acquire_lock();
VOID client_release_lock();

#endif