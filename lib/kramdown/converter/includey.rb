module Kramdown
  module Converter
    class Includey < ::Kramdown::Converter::Kramdown
      def convert_codeblock(el, indent)
        if el.attr.include?('include')
          file_path = File.expand_path(Dir.pwd + '/' + el.attr['include'])
          el.value  = IO.read(file_path) if File.exists?(file_path)
        end

        attr = el.attr.dup
        lang = extract_code_language!(attr)  
        "~~~ #{lang}\n" + el.value.split(/\n/).map {|l| l.empty? ? "" : "#{l}"}.join("\n") + "\n~~~\n"
      end
    end
  end
end
