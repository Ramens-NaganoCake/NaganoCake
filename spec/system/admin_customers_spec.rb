# frozen_string_literal: true

require 'rails_helper'

describe '管理者側のCustomerのテスト' do
  let(:admin) { create(:admin) }

  describe 'トップ画面のテスト' do
    context '表示の確認' do
      before do
        sign_in admin
        visit admin_items_path
      end
      it '管理者トップ画面に(admin_items_path)に会員一覧画面へのリンクが表示されているか' do
        expect(page).to have_link "/admins/customers"
      end
      it 'admin_items_pathが"/admins/items"であるか' do
        expect(current_path).to eq('/admins/items')
      end
      it '会員一覧を押すと会員一覧画面に遷移する' do
        index_link = find_all( 'a' )[1]
        expect(index_link.native.inner_text).to match("/admins/customers")
      end
    end
  end
end