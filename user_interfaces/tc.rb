#!/usr/bin/ruby -I../Framework

require 'test/unit/ui/console/testrunner'
require 'Zsf'

Test::Unit::UI::Console::TestRunner.run(Zsf::Test::FrameworkCoreTestSuite)