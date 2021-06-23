require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tokenを入力してください")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal codeを入力してください")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectureを入力してください")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalityを入力してください")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House numberを入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberを入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'postal_codeは「3桁ハイフン4桁」半角文字列でないと保存できないこと' do
        @order_address.postal_code = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal codeはハイフンを含めてください")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end
      it 'phone_numberが10桁以下の半角数値でないと保存できないこと' do
        @order_address.phone_number = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it 'phone_numberが12桁以上の半角数値でないと保存できないこと' do
        @order_address.phone_number = '123456789101'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberは不正な値です")
      end

    end
  end
end
