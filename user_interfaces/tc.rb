#!/usr/bin/ruby -I../Lib

require 'test/unit/ui/console/testrunner'
require 'Zsf/Core'

Test::Unit::UI::Console::TestRunner.run(Zsf::Test::FrameworkCoreTestSuite)