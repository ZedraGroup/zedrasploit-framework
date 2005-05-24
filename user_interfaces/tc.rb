#!/usr/bin/ruby -I../Lib

require 'test/unit/ui/console/testrunner'
require 'zsf/Core.rb.ts'

Test::Unit::UI::Console::TestRunner.run(zsf::TestSuite)