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
    def initialize(file_name='CHANGELOG.md', from=nil, to=nil)
      @file_name = file_name
      @tag_from = from
      @tag_to = to
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

      tags = `git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags | grep -v '^$'#`

      tags = tags.split
      prev_begin = nil

      if !@tag_from.nil? && !@tag_to.nil?
        from = tags.index(@tag_from)
        to = tags.index(@tag_to)
        tags = tags[from..to]
      elsif !@tag_from.nil?
        from = tags.index @tag_from
        prev_begin = tags[from - 1]
        tags = tags[from..-1]
      elsif !@tag_to.nil?
        to = tags.index @tag_to
        tags = tags[0..to]
      end

      tags.reverse!

      output << "\n#### [Current]" if @tag_to.nil?

      previous_tag=''
      tags.each do |tag|
        current_tag = tag

        unless previous_tag.empty?
          output << "\n#### #{previous_tag}"
        end

        if !previous_tag.empty? || @tag_to.nil?
          output << `git log --pretty=format:" * [%h](#{COMMIT_URL}%h) - __(%an)__ %s%n%n%-b" "#{current_tag}".."#{previous_tag}" | grep -v "Merge branch "`
        end

        previous_tag = current_tag
      end

      output << "\n#### #{previous_tag}"

      if prev_begin.nil?
        output << `git log --pretty=format:" * [%h](#{COMMIT_URL}%h) - __(%an)__ %s%n%n%-b" #{previous_tag} | grep -v "Merge branch "`
      else
        output << `git log --pretty=format:" * [%h](#{COMMIT_URL}%h) - __(%an)__ %s%n%n%-b" "#{prev_begin}".."#{previous_tag}" | grep -v "Merge branch "`
      end



      output.each do |line|
        line.encode!('utf-8', 'utf-8', invalid: :replace, undef: :replace, replace: '')

        if line.index(/#[1-9][0-9]*/)
          line.gsub!(/#[1-9][0-9]*/) {|s| "[#{s}](#{ISSUE_URL}#{s[-(s.length-1)..-1]})"}
        end
      end

      output
    end
  end
end
