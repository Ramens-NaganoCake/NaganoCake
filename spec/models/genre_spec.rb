# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do


  describe "ジャンル一覧画面(admin_genres_path)のテスト" do
    before do
      visit admin_genres_path
    end
    context 'ジャンル登録の確認' do
      it '登録ボタンを押下すると追加した一覧ページにジャンルが表示されているか' do
        fill_in 'genre[name]', with: Faker::Lorem.characters(number:5)
        click_button
        expect(page).to have_content 'Faker::Lorem.characters(number:5)'
      end
      it 'ヘッダから商品一覧へのリンクを押下すると商品一覧画面が表示される' do
        click_link '商品一覧'
        expect(page).to eq '/admins/items'
      end
    end
  end
end