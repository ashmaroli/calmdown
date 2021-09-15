# frozen_string_literal: true

require_relative 'lib/kramdown/version'

Gem::Specification.new do |s|
  s.name        = 'kramdown'
  s.version     = Kramdown::VERSION
  s.authors     = ['Thomas Leitner']
  s.email       = ['t_leitner@gmx.at']
  s.homepage    = 'http://kramdown.gettalong.org'
  s.license     = 'MIT'
  s.summary     = 'kramdown is a fast, pure-Ruby Markdown-superset converter.'
  s.description = <<~DESC
    kramdown is yet-another-markdown-parser but fast, pure Ruby, using a strict
    syntax definition and supporting several common extensions.
  DESC

  s.files = Dir.glob('{lib}/**/*').push('LICENSE')
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.5.0'

  s.add_runtime_dependency 'rexml', '~> 3.2'
end
