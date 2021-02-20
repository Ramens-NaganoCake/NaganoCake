# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品一覧画面(/admins/items)のテスト" do
    before do
      visit admin_items_path
    end
    context '遷移先の確認' do
      it '新規登録ボタンを押すと商品新規登録画面が表示される' do
        click_link '新規登録'
        expect(page).to eq '/admins/items/new'
      end
    end
  end
  describe "商品新規登録画面のテスト" do
    before do
      visit new_admin_item_path
    end
    context '登録処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in('genre_id', with: 1)
        fill_in('name', with: 'MyString')
        fill_in('introduction', 'MyText')
        fill_in('price', with: '1000')
        fill_in('image_id', 'MyString')
        fill_in('is_active',false)
        click_button '新規登録'
        expect(page).to have_current_path admin_item_path(Item.last)
      end
    end
  end
  describe "商品詳細画面のテスト" do
    before do
      visit admin_item_path(item)
    end
    it 'ヘッダから商品一覧へのリンクを押下すると商品一覧画面が表示される' do
      click_link '商品一覧'
      expect(page).to eq '/admins/items'
    end
  end
  describe "商品一覧画面のテスト" do
    before do
      visit admin_items_path
    end
    it '登録した商品が表示されているか' do
      expect(page).to have_content item.name
      expect(page).to have_link item.name
    end
  end
  describe "Top画面のテスト" do
    before do
      visit top_path
    end
    it '任意の商品画像を押下すると該当商品の詳細画面に遷移する' do
      first('item.image').click
      expect(page).to eq '/admins/items/list.id.to_s'
    end
  end
end
