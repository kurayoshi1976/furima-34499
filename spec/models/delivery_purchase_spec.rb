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

      it 'buildingが空でも保存出来る' do
        @delivery_purchase.building = nil
        expect(@delivery_purchase).to be_valid
      end
    end

    context '保存出来ない' do
      it 'tokenが空だと保存出来ない' do
        @delivery_purchase.token = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('カード情報を正しく入力してください')
      end

      it 'userが空だと保存出来ない' do
        @delivery_purchase.user_id = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('Userを入力してください')
      end

      it 'itemが空だと保存出来ない' do
        @delivery_purchase.item_id = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('Itemを入力してください')
      end

      it 'postal_codeが空だと保存出来ない' do
        @delivery_purchase.postal_code = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('郵便番号を入力してください')
      end

      it 'postal_codeにハイフン(-)がないと保存出来ない' do
        @delivery_purchase.postal_code = 1_111_111
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'postal_codeが半角英字のみだと保存出来ない' do
        @delivery_purchase.postal_code = 'aaaa-aaa'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'postal_codeが半角英字数字混合だと保存出来ない' do
        @delivery_purchase.postal_code = 'aaaa-111'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'postal_codeが全角数字だと保存出来ない' do
        @delivery_purchase.postal_code = '１１１１-１１１'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'prefecture_idが1だと保存出来ない' do
        @delivery_purchase.prefecture_id = 1
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('都道府県を入力してください')
      end

      it 'municipalityが空だと保存出来ない' do
        @delivery_purchase.municipality = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('市町村を入力してください')
      end

      it 'house_numberが空だと保存出来ない' do
        @delivery_purchase.house_number = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('番地を入力してください')
      end

      it 'phone_numberが空だと保存出来ない' do
        @delivery_purchase.phone_number = nil
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('電話番号を入力してください')
      end

      it 'phone_numberが全角数字だと保存出来ない' do
        @delivery_purchase.phone_number = '１１１１１１１１１１１'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberが半角英字のみだと保存出来ない' do
        @delivery_purchase.phone_number = 'aaaaaaaaaaa'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberが半角英字数字混合だと保存出来ない' do
        @delivery_purchase.phone_number = 'a1a1a1a1a1a'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberが11桁以上だと保存出来ない' do
        @delivery_purchase.phone_number = '1111111111111111'
        @delivery_purchase.valid?
        expect(@delivery_purchase.errors.full_messages).to include('電話番号は不正な値です')
      end
    end
  end
end
