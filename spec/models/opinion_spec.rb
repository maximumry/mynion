require 'rails_helper'
RSpec.describe Opinion, type: :model do
  before do
    @opinion = FactoryBot.build(:opinion)
  end

  describe '意見投稿' do
    context '意見投稿できる' do
      it 'すべての情報を入力したら登録できる' do
        expect(@opinion).to be_valid
      end
      it '画像が空でも投稿できる' do
        @opinion.image = nil
        expect(@opinion).to be_valid
      end
      it 'textが空でも投稿できる' do
        @opinion.text = ""
        expect(@opinion).to be_valid
      end
    end
    context '意見投稿できない' do
      it 'titleが空では投稿できない' do
        @opinion.title = ""
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("Title can't be blank")
      end
      it 'textと画像が空では投稿できない' do
        @opinion.text = ""
        @opinion.image = nil
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていないと投稿できない' do
        @opinion.user = nil
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end