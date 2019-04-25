#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pp'
require 'yaml'
require 'fileutils'

config = YAML.load_file(File.join(__dir__, 'config.yml'))
src_dir_path = File.join(__dir__, config['src_dir'])
dist_dir_path = File.join(__dir__, config['dist_dir'])
itunes_path = config['itunes_path']
replace_to = config['replace_to']

ext = '*.m3u'
# 10min (60sec * 10min)
interval = 60 * 10
encode_from = Encoding::UTF8_MAC
itunes_path_regexp = Regexp.new(itunes_path)

puts "src_dir_path : #{src_dir_path}"
puts "dist_dir_path : #{dist_dir_path}"
puts "itunes_path : #{itunes_path}"
puts "replace_to : #{replace_to}"
puts

FileUtils.mkdir(src_dir_path) unless File.exist?(src_dir_path)
FileUtils.mkdir(dist_dir_path) unless File.exist?(dist_dir_path)

puts "Copy playlist files from #{src_dir_path} to #{dist_dir_path}"
Dir
    .glob(File.join(src_dir_path, ext))
    .sort
    .select { |playlist_file|
      last_mod = File.mtime(playlist_file)
      Time.now - last_mod <= interval
    }
    .tap { |playlist_files|
      pp playlist_files
      puts
      FileUtils.cp(playlist_files, dist_dir_path)
    }

puts 'Replace the playlist file contents'
Dir
    .glob(File.join(dist_dir_path, ext))
    .sort
    .tap(&method(:pp))
    .each { |playlist_file|
      puts "Read #{playlist_file}"
      playlist_content = File.read(playlist_file).encode(Encoding::UTF_8, encode_from)

      puts 'Replace paths'
      # Replace new lines and paths.
      new_playlist_content = playlist_content.gsub(/\r/, "\n").gsub(itunes_path_regexp, replace_to)

      puts 'Override playlist file'
      File.open(playlist_file, 'w') do |f|
        f.write(new_playlist_content)
      end

      puts
    }
