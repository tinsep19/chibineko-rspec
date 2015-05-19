require "spec_helper"
RSpec.describe "chibineko/rspec" do
  extend Chibineko::RSpec::Helper
  include_chibineko("https://chibineko.jp/t/_op4xxVZqT-8KMd4S6FTgw")
  xit { expect(nil).to be_nil}
  it { pending "some reason" }
end
