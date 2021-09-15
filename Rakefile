# frozen_string_literal: true

require 'rake'
require 'rake/testtask'

task default: [:test]

Rake::TestTask.new do |test|
  test.warning = false
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_*.rb']
end
