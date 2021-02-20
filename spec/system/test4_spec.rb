# frozen_string_literal: true

require 'rails_helper'

  describe '会員側のテスト' do
    let!(:customer) { create(:customer) }
    let!(:item) { create(:item)}

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end

    describe '会員情報編集のテスト' do
      before do
        visit customer_customer_path
      end

      context 'マイページから会員情報編集画面への遷移' do
        it 'マイページ画面から会員情報編集画面に遷移できるか' do
          customer_edit_link = find_all('a')[6]
          customer_edit_link.click
          expect(current_path).to eq('/customers/edit/my_page')
        end
      end

      context '会員情報を編集し、マイページに遷移' do
        before do
          @customer_old_last_name = customer.last_name
          @customer_old_first_name = customer.first_name
          @customer_old_last_name_kana = customer.last_name_kana
          @customer_old_first_name_kana = customer.first_name_kana
          @customer_old_postcode = customer.postcode
          @customer_old_address = customer.address
          @customer_old_phone = customer.phone
          @customer_old_email = customer.email
          visit customer_customer_edit_path
          fill_in 'customer[last_name]', with: Faker::Lorem.characters(number: 3)
          fill_in 'customer[first_name]', with: Faker::Lorem.characters(number: 3)
          fill_in 'customer[last_name_kana]', with: Faker::Lorem.characters(number: 3)
          fill_in 'customer[first_name_kana]', with: Faker::Lorem.characters(number: 3)
          fill_in 'customer[postcode]', with: '7654321'
          fill_in 'customer[address]', with: Faker::Lorem.characters(number: 25)
          fill_in 'customer[phone]', with: '09087654321'
          fill_in 'customer[email]', with: Faker::Internet.email
          click_button '編集内容を保存'
        end

        it '各項目が正しく更新されている' do
          expect(customer.reload.last_name).not_to eq @customer_old_last_name
          expect(customer.reload.first_name).not_to eq @customer_old_first_name
          expect(customer.reload.last_name_kana).not_to eq @customer_old_last_name_kana
          expect(customer.reload.first_name_kana).not_to eq @customer_old_first_name_kana
          expect(customer.reload.postcode).not_to eq @customer_old_postcode
          expect(customer.reload.address).not_to eq @customer_old_address
          expect(customer.reload.phone).not_to eq @customer_old_phone
          expect(customer.reload.email).not_to eq @customer_old_email
        end

        it '保存ボタンを押した後の遷移先がマイページか' do
          expect(current_path).to eq('/customers/my_page')
        end
      end

    end

    describe '配送先に関するテスト' do
      before do
        visit customer_customer_path
      end

      context 'マイページから配送先一覧画面への遷移' do
        it 'マイページ画面から配送先一覧画面に遷移できるか' do
          customer_deliver_destination_link = find_all('a')[7]
          customer_deliver_destination_link.click
          expect(current_path).to eq('/customers/deliver_destinations')
        end
      end

      context '配送先を登録し、トップ画面に戻る' do
        before do
          visit customer_deliver_destinations_path
          fill_in 'deliver_destination[postcode]', with: '1234567'
          fill_in 'deliver_destination[address]', with: Faker::Lorem.characters(number: 20)
          fill_in 'deliver_destination[destination]', with: Faker::Lorem.characters(number: 4)
        end

        it '新規登録後の遷移先は配送先一覧画面か' do
          click_button '新規登録'
          expect(current_path).to eq('/customers/deliver_destinations')
        end

        it '新しく登録した配送先が正しく保存されているか' do
          expect { click_button '新規登録' }.to change(customer.deliver_destinations, :count).by(1)
        end

        it '配送先の情報が表示されているか' do
          click_button '新規登録'
          @deliver_destination = DeliverDestination.find(1)
          expect(page).to have_content @deliver_destination.postcode
          expect(page).to have_content @deliver_destination.address
          expect(page).to have_content @deliver_destination.destination
        end

      end
    end

    describe '商品詳細のテスト' do
      context 'トップ画面から商品詳細画面への遷移' do
        it '商品の詳細画像を押下すると詳細画面に遷移するか' do
          customer_item_image_link = find_all('a')[6]
          customer_item_image_link.click
          expect(current_path).to eq('/customers/items/' + item.id.to_s)
        end

        it '商品情報が正しく表示されているか' do
          visit customer_item_path(item)
          expect(page).to have_content item.name
          expect(page).to have_content item.introduction
          #expect(page).to have_content (item.price * 1.1).to_s(:delimited)
          expect(page).to have_content item.price.to_s(:delimited)
        end
      end
    end

    describe 'カート画面のテスト' do
      context '商品詳細で個数を選択' do
        before do
          visit customer_item_path(item)
          find("option[value='5']").select_option
        end

        it 'カートに入れるボタンを押下すると、カート画面に遷移するか' do
          click_button 'カートに入れる'
          expect(current_path).to eq('/customers/cart_items')
        end

        it 'カートの中身が正しく表示されているか' do
          click_button 'カートに入れる'
          @cart_item = CartItem.find(1)
          expect(page).to have_content @cart_item.item.name
        end
      end
    end

    describe '退会処理のテスト' do
      before do
        visit customer_customer_edit_path
      end

      context '退会処理' do
        it '退会ボタンを押すと退会確認(アラート)画面に遷移するか' do
          customer_leave_link = find_all('a')[6]
          customer_leave_link.click
          expect(current_path).to eq('/customers/leave')
        end

        it '確認画面で退会ボタンを押すとトップ画面に遷移するか' do
          visit customer_customer_leave_path
          customer_out_link = find_all('a')[7]
          customer_out_link.click
          expect(current_path).to eq('/')
        end

        it '退会後にヘッダーが未ログイン状態になっているか' do
          visit customer_customer_leave_path
          customer_out_link = find_all('a')[7]
          customer_out_link.click
          expect(page).to have_link 'About'
          expect(page).to have_link '商品一覧'
          expect(page).to have_link '新規登録'
          expect(page).to have_link 'ログイン'
        end

        it '退会後、ヘッダーからログインボタンを押すとログイン画面に遷移するか' do
          visit customer_customer_leave_path
          customer_out_link = find_all('a')[7]
          customer_out_link.click
          customer_sign_in_link = find_all('a')[4]
          customer_sign_in_link.click
          expect(current_path).to eq('/customers/sign_in')
        end

        it '退会したアカウントでログインを試みても失敗するか' do
          visit customer_customer_leave_path
          customer_out_link = find_all('a')[7]
          customer_out_link.click
          customer_sign_in_link = find_all('a')[4]
          customer_sign_in_link.click
          fill_in 'customer[email]', with: customer.email
          fill_in 'customer[password]', with: customer.password
          click_button 'ログイン'
          expect(current_path).to eq('/customers/sign_in')
          expect(page).to have_content "退会済のアカウントです。ご利用いただけません。"
        end
      end

    end

  end
