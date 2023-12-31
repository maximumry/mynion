require 'rails_helper'

RSpec.describe "Opinions", type: :request do
  before do
    @opinion = FactoryBot.create(:opinion)
  end
  describe "GET /opinions" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿ずみのタイトルが存在する" do
      get root_path
      expect(response.body).to include(@opinion.title)
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのテキストが存在する" do
      get root_path
      expect(response.body).to include(@opinion.text)
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みの画像が存在する" do
      get root_path
      expect(response.body).to match(/<img src=".*test_image\.png".*>/)
    end
  end
  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get opinion_path(@opinion)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのツイートのタイトルが存在する' do 
      get opinion_path(@opinion)
      expect(response.body).to include(@opinion.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのテキストが存在する' do 
      get opinion_path(@opinion)
      expect(response.body).to include(@opinion.text)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの画像が存在する' do 
      get opinion_path(@opinion)
      expect(response.body).to match(/<img src=".*test_image\.png".*>/)
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do 
      get opinion_path(@opinion)
      expect(response.body).to match('＜コメント一覧＞')
    end
  end
end
