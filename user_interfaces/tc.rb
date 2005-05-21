#!/usr/bin/ruby -I../Framework

require 'test/unit/ui/console/testrunner'
require 'Core'

Test::Unit::UI::Console::TestRunner.run(Zsf::Test::FrameworkCoreTestSuite)