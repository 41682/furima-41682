require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @order_shipping_address = FactoryBot.build(:order_shipping_address)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it "user_idと、item_id、token、postal_code、prefecture_id、city、addresses、phone_numberが存在すれば登録できる" do
        expect(@order_shipping_address).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @order_shipping_address.building = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'user_idが空では登録できない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
  
      it 'item_idが空では登録できない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
  
      it 'tokenが空では登録できない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
  
      it '郵便番号が空では登録できない' do
        @order_shipping_address.postal_code = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
  
      it '郵便番号が不正なフォーマットの場合は登録できない' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
  
      it '都道府県IDが1では登録できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
  
      it 'cityが空では登録できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
  
      it 'addressesが空では登録できない' do
        @order_shipping_address.addresses = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Addresses can't be blank")
      end
  
      it '電話番号が空では登録できない' do
        @order_shipping_address.phone_number = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
  
      it '電話番号が不正なフォーマットの場合は登録できない' do
        @order_shipping_address.phone_number = '123-4567-8901'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end