require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before do
    @opinion = FactoryBot.build(:opinion)
  end

  describe '意見を投稿する' do
    context '意見が投稿できた' do
      it '必要な項目を入力して投稿できた' do
        expect(@opinion).to be_valid
      end
    end
    context '意見を投稿できなかった' do
      it 'タイトルを入力していない' do
        @opinion.title = ""
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("Title is can't be blank")
      end
      it 'テキストが空では登録出来ない' do
        @opinion.text = ""
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("Text is can't be blank")
      end
      it 'ユーザーが紐づいていないと投稿できない' do
        @opinion.user = nil
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("User must exist")
      end
    end
  end
end
