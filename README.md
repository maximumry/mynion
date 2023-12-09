## アプリケーション名
Mynion

## アプリケーションの概要
ヒヤリハットや上司に今すぐ伝えたい事をリアルタイムで共有できる。

## URL
https://mynion.onrender.com

## テスト用アカウント
- Basic認証ID : admin
- Basic認証パスワード : 2222
- アカウントメールアドレス : aaa@aaa
- アカウントパスワード : aaa111
- アカウントメールアドレス : bbb@bbb
- アカウントパスワード : bbb222

## 利用方法

#### 意見投稿

1. トップページのヘッダーから新規ユーザー登録をする
[![Image from Gyazo](https://i.gyazo.com/57c9639ab2a5129221742c7647638043.gif)](https://gyazo.com/57c9639ab2a5129221742c7647638043)

2. ヘッダーの新規投稿から(タイトル、テキスト、画像(任意))を入力して投稿する
[![Image from Gyazo](https://i.gyazo.com/0c0ea96cad6c0ded5a1bab7798d32eae.gif)](https://gyazo.com/0c0ea96cad6c0ded5a1bab7798d32eae)

#### 意見に対してコメントする

1. 一覧ページに表示されている投稿の詳細ボタンをタップして意見の詳細をクリック
2. 投稿内容の左側に表示されているフォームからコメントを投稿
[![Image from Gyazo](https://i.gyazo.com/803d92c06e819501a20a1b1ec265289f.gif)](https://gyazo.com/803d92c06e819501a20a1b1ec265289f)

#### 意見に対していいねする

1. 一覧ページに表示されている詳細ボタンをタップしていいねボタンをクリック

2. いいねをクリックすると投稿内容の下に表示されているいいねの数字が増える
[![Image from Gyazo](https://i.gyazo.com/07744b045d54bc4106253a312211a884.gif)](https://gyazo.com/07744b045d54bc4106253a312211a884)

## アプリケーションを作成した背景

ヒヤリハットを紙に書いて提出というシステムが一手間で提出提出する人が少なかった。しかし意見を出せていたら防げた事故が多くあると考えた。<br>
また、一部の人にのみにコミュニケーションを取れる内線電話を渡されていないので、多くの社員は急ぎの報告の際に離れている事務所に行かなければならなかった。<br>これを解決するために高齢の方でも使える様に必要最小限の機能を搭載して素早く投稿できるように開発した。

## 実装予定の機能

- 通知機能
- Googleアカウントでログイン機能

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/943fe1e916f89b58ba32eaf61824b8d0.png)](https://gyazo.com/943fe1e916f89b58ba32eaf61824b8d0)

## 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/113c835aefc50ba76a5f68c687f6c349.png)](https://gyazo.com/113c835aefc50ba76a5f68c687f6c349)

## 開発環境

###### フロントエンド<br>
- BootStrap
- HTML
###### バックエンド<br>
- Ruby on rails
- Gem

## ローカルでの動作方法

% git clone https://github.com/maximumry/mynion.git <br>
% cd mynion<br>
% bundle install<br>
% yarn install<br>
% rails db:create<br>
% rails db:migrate<br>
% rails s

## 工夫したポイント

- 高齢の方でも使いやすい様になるべく大きい表示と英語を使わない事を心がけた
- 素早く投稿できるように必要最小限の投稿内容にした
- 画像を任意で投稿できる様にして相手にわかりやすく伝えられる様にした
- 投稿にいいねできる様にして多くの作業者が思っていることを可視化できる様にした
- 上司が素早く作業者の投稿に気づけるように3分ごとに画面更新させた

## 改善点

- できるだけ日本語を使いたかったが結合テストでフォームの名前を英語にしないと認識されなかったところを改善したい
- 通知できる様にして更に伝わりやすくなる様に改善したい

## 制作時間

2週間

## users テーブル

|     Column         |   Type  |    Options                |
|--------------------|---------|---------------------------|
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |

### Association

- has_many :opinions
- has_many :comments
- has_many :likes

## opinions テーブル

|     Column        |   Type     |    Options                     |
|-------------------|------------|--------------------------------|
| text              | text       | null: false                    |
| title             | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :likes
- belongs_to :user
- has_one_attached :image

## comments テーブル

|     Column        |   Type     |    Options                     |
|-------------------|------------|--------------------------------|
| text              | text       | null: false                    |
| opinion           | references | null: false, foreign_key: true |
| user              | references | null: fa;se, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :opinion
- has_one_attached :image

## likes テーブル

|     Column        |   Type     |    Options                     |
|-------------------|------------|--------------------------------|
| opinion           | references | null: false, foreign_key: true |
| user              | references | null: fa;se, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :opinion

