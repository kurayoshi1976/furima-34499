require 'rails_helper'

RSpec.describe DeliveryPurchase, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @delivery_purchase = FactoryBot.build(:delivery_purchase, user_id: @user, item_id: @item)
  end

  describe '商品購入' do
    context '保存出来る' do
      it '全てのデータがあると保存出来る' do
        expect(@delivery_purchase).to be_valid
      end
    end

    context '保存出来ない' do
      it 'tokenが空だと保存出来ない' do
        @delivery_purchase.token = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが空だと保存出来ない' do
        @delivery_purchase.user_id = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが空だと保存出来ない' do
        @delivery_purchase.item_id = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空だと保存出来ない' do
        @delivery_purchase.postal_code = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフン(-)がないと保存出来ない' do
        @delivery_purchase.postal_code = 1111111
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが半角英字のみだと保存出来ない' do
        @delivery_purchase.postal_code = 'aaaa-aaa'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが半角英字数字混合だと保存出来ない' do
        @delivery_purchase.postal_code = 'aaaa-111'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが全角数字だと保存出来ない' do
        @delivery_purchase.postal_code = '１１１１-１１１'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが1だと保存出来ない' do
        @delivery_purchase.prefecture_id = 1
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Prefecture select")
      end

      it 'municipalityが空だと保存出来ない' do
        @delivery_purchase.municipality = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberが空だと保存出来ない' do
        @delivery_purchase.house_number = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存出来ない' do
        @delivery_purchase.phone_number = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字だと保存出来ない' do
        @delivery_purchase.phone_number = '１１１１１１１１１１１'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角英字のみだと保存出来ない' do
        @delivery_purchase.phone_number = 'aaaaaaaaaaa'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角英字数字混合だと保存出来ない' do
        @delivery_purchase.phone_number = 'a1a1a1a1a1a'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが11桁以上だと保存出来ない' do
        @delivery_purchase.phone_number = 1111111111111111
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end  
end
