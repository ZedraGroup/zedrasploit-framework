#!/usr/bin/ruby

require 'Rex/Post/Process'
require 'Rex/Post/Zeterpreter/Packet'
require 'Rex/Post/Zeterpreter/Client'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Stdapi'

module Rex
module Post
module Zeterpreter
module Extensions
module Stdapi

class Process < Rex::Post::Process

	class <<self
		attr_accessor :client
	end

	def Process.getpid
		request = Packet.create_request('stdapi_process_getpid')

		response = self.client.send_packet_wait_response(request, Client.default_timeout)
		tlv = nil

		if (response == nil)
			raise RuntimeError, "getpid: No response was received", caller
		elsif (response.result != 0)
			raise RuntimeError, "getpid: Failed to get process id: #{response.result}", caller
		end

		tlv = response.get_tlv(TLV_TYPE_PID)

		if (tlv != nil)
			return tlv.value
		else
			return 0
		end
	end

end

end; end; end; end; end