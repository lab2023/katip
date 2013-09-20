# encoding: utf-8
require 'katip'
require 'katip/change_logger'
module Katip
  class ChangeLogger
    COMMIT_URL='../../commit/'
    ISSUE_URL='../../issues/'

    # initialize
    #
    # @param [String] file_name with path
    def initialize(file_name='CHANGELOG.md')
      @file_name = file_name
    end

    def log_changes
      if git_repository?
        write_file parse_change_log
      end
    end

    private
    def git_repository?
      initialized = `git rev-parse --is-inside-work-tree`.chomp

      if initialized != 'true'
        initialized = false
        puts 'Exiting. Nothing to create log file.'
      end
      initialized
    end

    def write_file(output)

      begin
        file = File.open(@file_name, 'w')
        file.puts output

        puts "Create #{@file_name}"
      rescue IOError => e
        #some error occur, dir not writable etc.
      ensure
        file.close unless file == nil
      end
    end

    def parse_change_log

      output = []

      tags=`git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags | grep -v '^$'`

      tags = tags.split

      tags.reverse!

      output << "\n#### [Current]"

      previous_tag=''
      tags.each do |tag|
        current_tag = tag

        unless previous_tag.empty?
          output << "\n#### #{previous_tag}"
        end

        output << `git log --pretty=format:" * [%h](#{COMMIT_URL}%h) - __(%an)__ %s%n%n%-b" "#{current_tag}".."#{previous_tag}" | grep -v "Merge branch "`

        previous_tag = current_tag
      end

      output << "\n#### #{previous_tag}"

      output << `git log --pretty=format:" * [%h](#{COMMIT_URL}%h) - __(%an)__ %s%n%n%-b" #{previous_tag} | grep -v "Merge branch "`

      output.each do |line|

        line.encode!('utf-8', invalid: :replace, undef: :replace, replace: '')

        if line.index(/#[1-9][0-9]*/)
          line.gsub!(/#[1-9][0-9]*/) {|s| "[#{s}](#{ISSUE_URL}#{s[-(s.length-1)..-1]})"}
        end
      end

      output
    end
  end
end
