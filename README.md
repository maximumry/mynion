## テーブル設計

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

