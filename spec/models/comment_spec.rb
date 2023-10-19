require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
    
  end

  describe 'コメントを投稿する' do
    context 'コメントが投稿できた' do
      it 'テキストを入力して投稿できた' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントを投稿できなかった' do
      it 'テキストを入力していない' do
        @comment.text = ""
        @opinion.valid?
        expect(@comment.errors.full_messages).to include("Text is can't be blank")
      end
    end
  end
end