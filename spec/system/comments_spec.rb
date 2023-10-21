require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @opinion = FactoryBot.create(:opinion)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは意見詳細ページでコメント投稿できる' do
    sign_in(@opinion.user)
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("詳細")
    find('button[type="button"]').click
    expect(page).to have_content("意見の詳細")
    visit opinion_path(@opinion)
    fill_in 'comment_text', with: @comment
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    expect(page).to have_current_path(opinion_path(@opinion))
    expect(page).to have_content @comment
  end
end
