#!/usr/bin/ruby

require 'Rex/Post/Zeterpreter/Extension'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Process'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Registry'

module Rex
module Post
module Zeterpreter
module Extensions
module Stdapi

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
	
	def registry
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Registry)
	end
end

end; end; end; end; end