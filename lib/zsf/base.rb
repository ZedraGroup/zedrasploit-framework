###
#
# framework-base
# --------------
#
# The base library provides implementations for some of the default
# sessions, such as Shell, Zeterpreter, DispatchNinja, and VNC.  These
# sessions are used by modules that come pre-packaged with the default
# module distribution of Zedrasploit and are depended on by their 
# respective payloads.
#
# Beyond providing the default sessions, framework-base also provides
# a wrapper interface to framework-core that makes some of the tasks,
# such as exploitation, into easier to manage functions.
#
###

# framework-base depends on framework-core
require 'Zsf/Core'

# Sessions
require 'Zsf/Base/Session/CommandShell'
require 'Zsf/Base/Session/Zeterpreter'
require 'Zsf/Base/Session/DispatchNinja'
require 'Zsf/Base/Session/Vnc'