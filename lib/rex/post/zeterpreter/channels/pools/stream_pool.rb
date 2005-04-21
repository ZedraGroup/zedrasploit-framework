#!/usr/bin/ruby

require 'Rex/Post/Zeterpreter/Channels/Pool'
require 'Rex/Post/Zeterpreter/Extensions/Stdapi/Tlv'

module Rex
module Post
module Zeterpreter
module Channels
module Pools

###
#
# StreamPool
# ----------
#
# This class represents a channel that is associated with a 
# streaming pool that has no definite end-point.  While this
# may seem a paradox given the stream class of channels, it's
# in fact dinstinct because streams automatically forward
# traffic between the two ends of the channel whereas
# stream pools are always requested data in a single direction.
#
###
class StreamPool < Rex::Post::Zeterpreter::Channels::Pool

	##
	#
	# Constructor
	#
	##

	# Initializes the file channel instance
	def initialize(client, cid, type, flags)
		super(client, cid, type, flags)
	end

	#
	# Streaming pools don't support tell, seek, or eof.
	#

	def tell
		throw NotImplementedError
	end

	def seek
		throw NotImplementedError
	end

	def eof
		return false
	end

end

end; end; end; end; end