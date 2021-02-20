# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な配送先の場合は保存されるか" do
    expect(FactoryBot.build(:deliver_destination)).to be_valid
  end
end