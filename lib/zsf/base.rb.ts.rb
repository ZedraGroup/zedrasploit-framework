#!/usr/bin/ruby

require 'test/unit'
require 'Zsf/Base'
require 'Zsf/Base/Session/CommandShell.rb.ut'
require 'Zsf/Base/Session/Zeterpreter.rb.ut'
require 'Zsf/Base/Session/DispatchNinja.rb.ut'
require 'Zsf/Base/Session/Vnc.rb.ut'

module Zsf
module Base

class TestSuite
	def self.suite
		suite = Test::Unit::TestSuite.new

		suite << Zsf::Session::CommandShell::UnitTest.suite
		suite << Zsf::Session::Zeterpreter::UnitTest.suite
		suite << Zsf::Session::DispatchNinja::UnitTest.suite
		suite << Zsf::Session::Vnc::UnitTest.suite

		return suite;
	end
end

end
end