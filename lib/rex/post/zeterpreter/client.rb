#!/usr/bin/ruby

require 'socket'
require 'Rex/Post/Zeterpreter/ClientCore'
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
		self.sock       = sock
		self.parser     = PacketParser.new
		self.extensions = {}

		self.register_extension_alias('core', ClientCore.new(self))

		monitor_socket
	end

	def brand(klass)
		klass = klass.dup
		klass.client = self
		return klass
	end

	#
	# Pass-thru extensions
	#
	def method_missing(symbol, *args)
		return self.extensions[symbol.to_s];
	end

	#
	# Extension registration
	#
	def add_extension(name)
		Kernel.require("Rex/Post/Zeterpreter/Extensions/#{name}")

		ext = eval("Rex::Post::Zeterpreter::Extensions::" + name + ".new(client)")

		self.extensions[ext.name] = ext
	end

	def register_extension_alias(name, ext)
		self.extensions[name] = ext
	end

	def deregister_extension(name)
		self.extensions.delete(name)
	end

	def each_extension(&block)
		self.extensions.each(block)
	end

	protected
	attr_accessor :sock, :parser, :extensions
end

end; end; end