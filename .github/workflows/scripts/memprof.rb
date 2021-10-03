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
  report_file = "#{ARGV[0]}/memprof.txt"
  reporter.pretty_print(to_file: report_file, scale_bytes: true, normalize_paths: true)
  if ARGV[0] == 'master'
    puts 'Normalizing paths..'
    contents = File.binread(report_file)
    contents = contents.gsub('  master/', '  calmdown/')
    File.binwrite(report_file, contents)
  end
  puts ''
  puts "Detailed Report saved into: #{report_file.cyan}"
else
  reporter.pretty_print(scale_bytes: true, normalize_paths: true)
end
