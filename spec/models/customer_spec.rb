# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な会員内容の場合は保存されるか" do
    expect(FactoryBot.build(:customer)).to be_valid
  end
end