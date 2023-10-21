require 'rails_helper'

RSpec.describe 'ツイート投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @opinion_title = Faker::Lorem.sentence
    @opinion_text = Faker::Lorem.sentence
  end
  context '意見投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_current_path(root_path)
      expect(page).to have_content("新規投稿")
      visit new_opinion_path
      fill_in 'opinion_title', with: @opinion_title
      fill_in 'opinion_text', with: @opinion_text
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { Opinion.count }.by(1)
      expect(page).to have_content(@opinion_text)
      expect(page).to have_content(@opinion_title)
    end
  end
  context '意見投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_content("新規投稿")
    end
  end
end
RSpec.describe '意見詳細', type: :system do
  before do
    @opinion = FactoryBot.create(:opinion)
    @user = FactoryBot.create(:user)
  end
  it 'ログインしたユーザーは詳細ページに遷移してコメント投稿欄が表示される' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("詳細")
    find('button[type="button"]').click
    expect(page).to have_content("意見の詳細")
    visit opinion_path(@opinion)
    expect(page).to have_content(@opinion_title)
    expect(page).to have_content(@opinion_text)
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態でツイート詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    visit root_path
    expect(page).to have_content("詳細")
    find('button[type="button"]').click
    expect(page).to have_content("意見の詳細")
    visit opinion_path(@opinion)
    expect(page).to have_content(@opinion_title)
    expect(page).to have_content(@opinion_text)
    expect(page).to have_no_selector 'form'
    expect(page).to have_content 'コメント投稿には新規登録/ログインが必要です'
    # ツイートに「詳細」へのリンクがあることを確認する
    # 詳細ページに遷移する
    # 詳細ページにツイートの内容が含まれている
    # フォームが存在しないことを確認する
    # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
  end
end