# frozen_string_literal: true

require 'rails_helper'

describe '③制作〜発送のテスト' do
  describe '会員側のテスト' do
    describe 'ログイン画面のテスト' do
      let(:customer) { create(:customer) }

      before do
        visit new_customer_session_path
      end

      context 'ログイン成功のテスト' do
        before do
          fill_in 'customer[email]', with: customer.email
          fill_in 'customer[password]', with: customer.password
          click_button 'ログイン'
        end

        it 'ログイン後のリダイレクト先が、トップ画面になっている' do
          expect(current_path).to eq('/')
        end
        it 'ヘッダーがログイン後の表示に変わっている' do
        #expect(page).to have_content customer.last_name
        expect(page).to have_link '会員のみなさまへ'
        expect(page).to have_link 'マイページ'
        expect(page).to have_link '商品一覧'
        expect(page).to have_link 'カート'
        expect(page).to have_link 'ログアウト'
        end
        it 'ヘッダーからマイページに遷移できるか' do
          current_customer_link = find_all('a')[2]
          current_customer_link.click
          expect(current_path).to eq('/customers/my_page')
        end
      end

      context 'ログイン失敗のテスト' do
        before do
          fill_in 'customer[email]', with: ''
          fill_in 'customer[password]', with: ''
          click_button 'ログイン'
        end

        it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
          expect(current_path).to eq('/customers/sign_in')
        end
      end
    end
  end
end