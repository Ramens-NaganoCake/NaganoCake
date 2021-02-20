# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効なカート内商品の場合は保存されるか" do
    expect(FactoryBot.build(:cart_item)).to be_valid
  end
end