require 'kramdown'
require 'kramdown/converter/includey'
require 'thor'


module Krambook
  class CLI < Thor
    include Thor::Actions

    class_option :format, :desc => 'The format to convert to', :aliases => '-f', :default => 'kramdown', :type => :string
    class_option :help, :type => :boolean, :desc => 'Show help usage' 
    default_task :join

    desc 'join', 'Joins the markdown files'
    def join
      files            = []
      joined_file_path = File.expand_path './manuscript/' + 'Joined.md'
      File.delete(joined_file_path) if File.exist?(joined_file_path)

      File.open(File.expand_path('./manuscript/Book.txt'), 'r') do |f|
        f.each_line do |line|
          files << line.gsub(/\s+/, "")
        end
      end

      File.open(joined_file_path, 'a') do |f|
        files.each do |file_path|
          full_file_path = File.expand_path './manuscript/' + file_path
          f.puts Kramdown::Document.new(IO.read(full_file_path)).send("to_#{options[:format]}".to_sym) if File.exists?(full_file_path)
          f.puts '' unless file_path == files.last
        end
      end
    end
  end
end
