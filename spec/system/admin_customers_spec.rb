# frozen_string_literal: true

require 'rails_helper'

describe '管理者側のCustomerのテスト' do
  let(:admin) { create(:admin) }

  describe 'ログインのテスト' do
    before do
      visit new_admin_session_path
    end
    it 'ログインが可能でログイン後商品一覧へ遷移する' do
      fill_in "admin_email", with: admin.email
      fill_in "admin_password", with: admin.password
      click_button 'Log in'
      expect(current_path).to eq('/admins/items')
    end
  end

  describe 'admin_customer画面のテスト' do
    before do
      visit new_admin_session_path
      fill_in "admin_email", with: admin.email
      fill_in "admin_password", with: admin.password
      click_button 'Log in'
    end
      context '管理者トップの確認' do
        it 'admin_items_pathが"/admins/items"であるか' do
          expect(current_path).to eq('/admins/items')
        end
        it 'ヘッダの会員一覧から会員一覧画面に遷移する' do
          click_link '会員一覧'
          expect(current_path).to eq('/admins/customers')
        end
      end
      context '会員一覧画面の確認' do
        it '会員詳細画面に遷移する' do
          
        end
      end
  end
end