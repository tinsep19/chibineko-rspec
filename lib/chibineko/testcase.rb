module Chibineko
  class TestCase
    URL_REGEXP = %r{^http://chibineko.jp/t/[^/]*$}
    class << self
      def retrieve(testcase_url)
        uri = URI.parse( testcase_url + "/test_case.csv?encode=utf-8")
        content = Net::HTTP.get(uri)
        # Content-Type: text/csv; charset=utf-8
        # But some japanese charactors was not read.
        new(content.encode("UTF-8","UTF-8"), testcase_url) 
      end
      def load_from_file(file_path)
        new(File.read(file_path),File.expand_path(file_path))
      end
    end
    attr_accessor :items, :source
    def initialize(content, src=nil)
      self.source = src
      csv = CSV.new(content, return_headers: false, headers: :first_row)
      self.items = csv.to_enum.with_index(1).map { |row,line|
        TestItem.new(row,source,line)
      }
    end
  end
end
