#!/usr/bin/ruby

require 'Rex/Post/Zeterpreter/ObjectAliases'
require 'Rex/Post/Zeterpreter/Extension'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Constants'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Tlv'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Fs/Dir'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Fs/File'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Fs/FileStat'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Net/Config'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Sys/Process'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Sys/Registry'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/UI'

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
		client.register_extension_aliases(
			[
				{ 
					'name' => 'fs',
					'ext'  => ObjectAliases.new(
						{
							'dir'      => self.dir,
							'file'     => self.file,
							'filestat' => self.filestat
						})
				},
				{
					'name' => 'sys',
					'ext'  => ObjectAliases.new(
						{
							'process'  => self.process,
							'registry' => self.registry
						})
				},
				{
					'name' => 'net',
					'ext'  => ObjectAliases.new(
						{
							'config'	=> Rex::Post::Zeterpreter::Extensions::Stdapi::Net::Config.new(client)
						})
				},
				{
					'name' => 'ui',
					'ext'  => UI.new(client)
				}

			])
	end

	# Sets the client instance on a duplicated copy of the supplied class
	def brand(klass)
		klass = klass.dup
		klass.client = self.client
		return klass
	end

	# Returns a copy of the Dir class
	def dir
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Fs::Dir)
	end

	# Returns a copy of the File class
	def file
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Fs::File)
	end

	# Returns a copy of the FileStat class
	def filestat
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Fs::FileStat)
	end

	# Returns a copy of the Process class
	def process
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Sys::Process)
	end

	# Returns a copy of the Registry class
	def registry
		brand(Rex::Post::Zeterpreter::Extensions::Stdapi::Sys::Registry)
	end
end

end; end; end; end; end