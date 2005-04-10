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
		self.sock   = sock
		self.parser = PacketParser.new
		self.core	= ClientCore.new(self)

		monitor_socket
	end

	def brand(klass)
		klass = klass.dup
		klass.client = self
		return klass
	end

	attr_reader	  :core
	protected
	attr_accessor :sock, :parser
	attr_writer	  :core
end

end; end; end