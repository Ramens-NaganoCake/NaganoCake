require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Customer::ItemsHelper. For example:
#
# describe Customer::ItemsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


RSpec.describe Customer::ItemsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  def tax_price(price)
  (price * 1.1).floor
  end
end

