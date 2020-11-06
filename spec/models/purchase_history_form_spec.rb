require 'rails_helper'

RSpec.describe PurchaseHistoryForm, type: :model do
  describe '#create' do
    before do
      @purchase_history_form = FactoryBot.build(:purchase_history_form)
    end

    it 'postal_code,prefecture,city,house_num,phone_numが存在していれば保存できること' do
      expect(@purchase_history_form).to be_valid
    end

    it 'postal_codeが空では保存できないこと' do
      @purchase_history_form.postal_code = nil
      @purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが-がないと保存できないこと' do
      @purchase_history_form.postal_code = '1234567'
      @purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include('Postal code input correctly')
    end

    it 'prefectureが---では保存できないこと' do
      @purchase_history_form.prefecture_id = 1
      @purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空では保存できないこと' do
      @purchase_history_form.city = nil
      @purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numが空では保存できないこと' do
      @purchase_history_form.house_num = nil
      @purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include("House num can't be blank")
    end

    it 'phone_numが空では保存できないこと' do
      @purchase_history_form.house_num = nil
      @purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include("Phone num can't be blank")
    end

    it 'phone_numは-があると保存できないこと' do
      @purchase_history_form.phone_num = "09-12345678"
      @@purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include('Phone num input only number')
    end

    it 'phone_numは12桁以上では保存できないこと' do
      @purchase_history_form.phone_num = "090123456789"
      @@purchase_history_form.valid?
      expect(@purchase_history_form.errors.full_messages).to include('Phone num input only number')
    end
    
  end
end
