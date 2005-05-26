#!/usr/bin/ruby

require 'test/unit'
require 'zsf/Core'
require 'zsf/Core/OptionContainer.rb.ut'
require 'Zsf/Core/SessionManager.rb.ut'

class zsf::TestSuite
	def self.suite
		suite = Test::Unit::TestSuite.new

		suite << zsf::OptionContainer::UnitTest.suite
		suite << Zsf::SessionManager::UnitTest.suite

		return suite;
	end
end