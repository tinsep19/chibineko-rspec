require 'net/http'
module Chibineko
  module RSpec
    module Helper
      def include_chibineko(id_or_url)
        testcase = Chibineko::TestCase.new(id_or_url)
        testcase.retrieve!
        testcase.export_example_group(self)
      end
    end
  end
end
