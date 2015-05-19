require 'net/http'
module Chibineko
  module RSpec
    module Helper
      def include_chibineko(testcase_url)
        testcase = Chibineko::TestCase.retrieve(testcase_url)
        ExampleGroupExporter.new(self,testcase).export
      end
    end
  end
end
