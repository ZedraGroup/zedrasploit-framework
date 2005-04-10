#!/usr/bin/ruby

require 'Rex/Post/Zeterpreter/Extension'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Process'

module Rex
module Post
module Zeterpreter
module Extensions
module Stdapi

# Constants
TLV_TYPE_PID = TLV_META_TYPE_UINT | 0

###
#
# Stdapi
# ------
#
# Standard ruby interface to remote entities
#
###
class Stdapi < Extension
	def initialize(client)
		super(client, 'stdapi')
	end

	def brand(klass)
		klass = klass.dup
		klass.client = self.client
		return klass
	end

	def process
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Process)
	end
end

end; end; end; end; end