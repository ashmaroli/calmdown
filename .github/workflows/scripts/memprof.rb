# frozen_string_literal: true

require 'jekyll'
require 'memory_profiler'

reporter = MemoryProfiler.report(allow_files: ['lib/kramdown']) do
  Jekyll::PluginManager.require_from_bundler
  Jekyll::Commands::Build.process({
    "source"             => File.expand_path("sandbox"),
    "destination"        => File.expand_path("sandbox/_site"),
    "disable_disk_cache" => true,
  })
  puts ''
end

if ENV['KD_PATH']
  reporter.pretty_print(to_file: "#{ARGV[0]}/memprof.txt", scale_bytes: true, normalize_paths: true)
else
  reporter.pretty_print(scale_bytes: true, normalize_paths: true)
end
