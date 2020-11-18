require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品登録' do
      context '商品出品がうまくいくとき' do
        it '全ての値が存在すれば登録できること' do
          expect(@item).to be_valid
        end

        context '商品出品がうまくいないとき' do
          it 'nameがないと保存できない' do
            @item.name = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
          end

          it '画像がないと保存できない' do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end

          it 'descriptionが空だと保存できない' do
            @item.description = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Description can't be blank")
          end

          it 'categoryは１を登録したら保存できない' do
            @item.category_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include('Category must be other than 1')
          end

          it 'conditionは１を登録したら保存できない' do
            @item.condition_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include('Condition must be other than 1')
          end

          it 'postage_prayerは１を登録したら保存できない' do
            @item.postage_prayer_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include('Postage prayer must be other than 1')
          end

          it 'prefectureは１を登録したら保存できない' do
            @item.prefecture_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
          end

          it 'daysは１を登録したら保存できない' do
            @item.days_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include('Days must be other than 1')
          end

          it 'priceは入力されていないと保存できない' do
            @item.price = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end

          it 'priceが300円以上でないと保存できない' do
            @item.price = '299'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
          end

          it 'priceは9,999,999以下でないと保存できない' do
            @item.price = '10000000'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
          end

          it 'priceは半角数字でないと保存できない' do
            @item.price = '３００'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is not a number')
          end
        end
      end
    end
  end
end
