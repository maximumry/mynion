## テーブル設計

## users テーブル

|     Column         |   Type  |    Options                |
|--------------------|---------|---------------------------|
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |

### Association

- has_many :rooms, through: room_users
- has_many :room_users
- has_many :opinions

## rooms テーブル

|   Column         | Type       |   Options                      |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |

### Association

- has_many :users, through: room_users
- has_many :room_users, dependent: :destroy
- has_many :opinions, dependent: :destroy

## room_users テーブル

|     Column        |   Type     |    Options                     |
|-------------------|------------|--------------------------------|
| user              | references | null: false, foreign_key: true |
| room              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## opinions テーブル

|     Column        |   Type     |    Options                     |
|-------------------|------------|--------------------------------|
| text              | text       | null: false                    |
| room              | references | null: false, foreign_key: true |
| user              | references | null: fa;se, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
- has_one_attached :image