require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    context '商品購入ができる時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameは空でも保存ができる' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが体と登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Token can't be blank")
      end

      it 'post_codeが空だと保存できない' do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Post code can't be blank")
      end

      it 'post_codeが半角数字及びハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_address.post_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Post code is invalid")
      end

      it 'prefectureが空だと保存できない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureは１を登録したら保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空だと保存できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("City can't be blank")
      end

      it 'house_numberが空だと保存できない' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("House number can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上であると保存できない' do
        @purchase_address.phone_number = "123456789123"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
