# frozen_string_literal: true

require 'rails_helper'


  describe '(新規登録前)トップ画面〜新規登録画面のテスト' do
    before do
      visit top_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it '新規登録リンクが表示されている' do
        expect(page).to have_link '新規登録'
      end
    end

    context 'リンクの遷移先の確認' do
      it '新規登録の遷移先は新規登録画面か' do
        customer_sign_up_link = find_all('a')[3]
        customer_sign_up_link.click
        expect(current_path).to eq('/customers/sign_up')
      end
    end
  end

  describe '新規登録画面〜注文完了のテスト' do
    before do
      visit new_customer_registration_path
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'customer[last_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[first_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[last_name_kana]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[first_name_kana]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[email]', with: Faker::Internet.email
        fill_in 'customer[postcode]', with: '1234567'
        fill_in 'customer[address]', with: Faker::Lorem.characters(number: 20)
        fill_in 'customer[phone]', with: '09012345678'
        fill_in 'customer[password]', with: 'password'
        fill_in 'customer[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(Customer.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、トップ画面である' do
        click_button '新規登録'
        expect(current_path).to eq '/'
      end
      it 'ヘッダーがログイン後の表示に変わっている' do
        click_button '新規登録'
        #expect(page).to have_content customer.last_name
        expect(page).to have_link '会員のみなさまへ'
        expect(page).to have_link 'マイページ'
        expect(page).to have_link '商品一覧'
        expect(page).to have_link 'カート'
        expect(page).to have_link 'ログアウト'
      end
    end
  end
