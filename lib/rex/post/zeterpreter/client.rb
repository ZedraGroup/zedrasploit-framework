#!/usr/bin/ruby

require 'socket'
require 'Rex/Post/Zeterpreter/ClientCore'
require 'Rex/Post/Zeterpreter/ObjectAliases'
require 'Rex/Post/Zeterpreter/Packet'
require 'Rex/Post/Zeterpreter/PacketParser'
require 'Rex/Post/Zeterpreter/PacketDispatcher'

module Rex
module Post
module Zeterpreter

###
#
# Client
# ------
#
# The logical zeterpreter client class.  This class manages a single session
# with a zeterpreter server instance.
#
###
class Client

	include Rex::Post::Zeterpreter::PacketDispatcher

	def initialize(sock)
		self.sock        = sock
		self.parser      = PacketParser.new
		self.ext         = ObjectAliases.new
		self.ext_aliases = ObjectAliases.new

		self.register_extension_alias('core', ClientCore.new(self))

		monitor_socket
	end

	# 
	# Accessors
	#
	def Client.default_timeout
		return 30
	end

	#
	# Alias processor
	#
	def method_missing(symbol, *args)
		return self.ext_aliases.aliases[symbol.to_s];
	end

	#
	# Extension registration
	#
	def add_extension(name)
		if (Kernel.require("Rex/Post/Zeterpreter/Extensions/#{name}/#{name}") == false)
			return false
		end

		ext = eval("Rex::Post::Zeterpreter::Extensions::" + name + "::" + name + ".new(self)")

		self.ext.aliases[ext.name] = ext

		return true
	end

	def deregister_extension(name)
		self.ext.aliases.delete(name)
	end

	def each_extension(&block)
		self.ext.aliases.each(block)
	end

	def register_extension_alias(name, ext)
		self.ext_aliases.aliases[name] = ext
	end

	def deregister_extension_alias(name)
		self.ext_aliases.aliases.delete(name)
	end

	attr_reader   :ext
	protected
	attr_accessor :sock, :parser, :ext_aliases
	attr_writer   :ext
end

end; end; end