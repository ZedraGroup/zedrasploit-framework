#!/usr/bin/ruby

require 'Rex/Post/Zeterpreter/Extension'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Dir'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/File'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/FileStat'
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

		# Alias the following things on the client object so that they
		# can be directly referenced
		client.register_extension_alias('dir', self.dir)
		client.register_extension_alias('file', self.file)
		client.register_extension_alias('filestat', self.filestat)
		client.register_extension_alias('process', self.process)
		client.register_extension_alias('registry', self.registry)
	end

	def brand(klass)
		klass = klass.dup
		klass.client = self.client
		return klass
	end

	def dir
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Dir)
	end

	def file
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::File)
	end

	def filestat
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::FileStat)
	end

	def process
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Process)
	end
	
	def registry
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Registry)
	end
end

end; end; end; end; end