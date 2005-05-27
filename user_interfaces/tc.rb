#!/usr/bin/ruby -I../Lib

require 'test/unit/ui/console/testrunner'
require 'zsf/Core.rb.ts'
require 'Zsf/Base.rb.ts'

Test::Unit::UI::Console::TestRunner.run(Zsf::TestSuite)
Test::Unit::UI::Console::TestRunner.run(Zsf::Base::TestSuite)