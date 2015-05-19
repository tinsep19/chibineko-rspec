require "net/http"
require "csv"
require "spec_helper"

module Research
  def include_chibineko(permlink)
    uri = URI.parse( permlink + "/test_case.csv?encode=utf-8")
    response = Net::HTTP.get_response(uri)
    CSV.parse(response.body, return_headers: false, headers: :first_row) do | row |
      s = row.size
      memo = row.field(s - 1)
      okng = row.field(s - 2)
      groups = (0 .. s - 3).map {|i| row.field(i) }.compact
      desc = groups.join

      it "#{desc}" do
        expect(okng).to eq("OK")
      end

    end
  end
end

RSpec.describe "chibineko-rspec prototypings" do
  extend Research
  include_chibineko("https://chibineko.jp/t/_op4xxVZqT-8KMd4S6FTgw")
end
