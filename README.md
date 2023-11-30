# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| unique_user_id     | integer | null: false,unique: true |
| encrypted_password | string  | null: false              |
| name               | string  | null: false              |
| department_id      | integer | null: false              |
| position_id        | integer | null: false              |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :articles, through: :checks
- has_many :checks

- belongs_to :department
- belongs_to :position

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## articles テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| poster  | string     | null: false                    |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- has_many :checks
- has_many ::users, through: :checks

## checks テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| news   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :articles