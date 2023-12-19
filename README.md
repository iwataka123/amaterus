# アプリケーション名

amaterus

# アプリケーション概要

チャット機能・お知らせ投稿機能・スケジュール管理機能を持った  
社内向けコミュニケーションサイトを作成することで、  
使用するソフトを一元化し、利便性・保守性の向上を図る。

# URL

https://amaterus.onrender.com

# テスト用アカウント

- Basic認証ID：admin
- Basic認証パスワード：475901
- 職員番号：000001
- パスワード：i353632

# 利用方法

## お知らせ投稿機能

１．右下フロートメニューをクリックし、投稿するボタンを押す。  
２．記事名、記事内容、投稿者を入力する。（アイキャッチ画像は任意）  
３．投稿ボタンを押す。  
４．閲覧は、TOPページから、見たい記事を選択する。

## チャット機能

１．右下フロートメニューをクリックし、チャットボタンを押す。  
２．画面左側「ルームを作成」ボタンを押す。  
３．チャットルーム名を入力し、チャットメンバーをチェックを入れて選択する。  
４．ルームを作成ボタンを押す。  
５．画面左側ルーム一覧内になる作成したルーム名のボタンを押す。  
６．画面下部中央、メッセージを入力に文字を入力し、送信ボタンを押す。  
　　※画像やドキュメントファイルを送信する際は、ファイルボタンを押して、ファイルを選択する。  
７．不要なルームは中央右上、ルームを削除ボタンで削除する。

## スケジュール管理機能

１．画面右側、予定の作成ボタンを押す。  
２．タイトル・内容（任意）・日時を入力し、作成ボタンを押す。  
３．スケジュールの変更削除は、週間予定欄もしくは、当日の予定ならば今日の予定一覧の、イベント名を選択し、詳細ページより行う。

# アプリケーションを作成した背景

前職の職場では、メールアカウントを持っていない職員がいたり、メールソフトを使っていたため、新入職員を採用したり、PC更新の度に設定や、データ移動の手間があった。また、全体のお知らせを更新するのも、専門の部署に依頼をしなければならず、煩わしい思いをしていた。前職で解決出来たらと思っていたことを、プログラミング学習をしていく中で解決できそうだったため、アプリケーションを開発することにした。アプリケーションを開発していく中で、このサイトで、スケジュールの管理も行うことができたら、より便利になるのではないかと考え、スケジュール管理機能を追加実装した。

# 実装した機能についての画像やGIFおよびその説明

## TOPページ（投稿記事一覧表示・スケジュール表示）  

[![Image from Gyazo](https://i.gyazo.com/0092510782f2159b88a586cbf978ed4a.gif)](https://gyazo.com/0092510782f2159b88a586cbf978ed4a)  

## 記事投稿

[![Image from Gyazo](https://i.gyazo.com/04b61992111abdeabfa1df7f8c77ae96.gif)](https://gyazo.com/04b61992111abdeabfa1df7f8c77ae96)

## 記事の詳細画面

[![Image from Gyazo](https://i.gyazo.com/60d8c427a148c8bca8d3513406257dde.gif)](https://gyazo.com/60d8c427a148c8bca8d3513406257dde)

## チャットルーム作成  

[![Image from Gyazo](https://i.gyazo.com/3cb799a54d97b931b81ac162698f6edf.gif)](https://gyazo.com/3cb799a54d97b931b81ac162698f6edf)

## チャット画面

[![Image from Gyazo](https://i.gyazo.com/c73ba849fb951ed7fcd05f6532530904.gif)](https://gyazo.com/c73ba849fb951ed7fcd05f6532530904)

## 予定の作成

[![Image from Gyazo](https://i.gyazo.com/a351dde249526cc630cf57406e4a6804.gif)](https://gyazo.com/a351dde249526cc630cf57406e4a6804)

## 予定の詳細画面

[![Image from Gyazo](https://i.gyazo.com/243efd82ec421dac5b6b58a6f2c7b08e.gif)](https://gyazo.com/243efd82ec421dac5b6b58a6f2c7b08e)

# 実装予定の機能

現在、パスワード変更機能を実装中。  
今後はチャットルームを開いた際に、最下部（最新コメント）へ遷移する機能を実装予定。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/5ba3e207514b3d14c57a931de148bf1d.png)](https://gyazo.com/5ba3e207514b3d14c57a931de148bf1d)

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

## schedules テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| content    | text       |                                |
| start_time | boolean    |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/16ff5749a78dec32f429b8eeaea88892.png)](https://gyazo.com/16ff5749a78dec32f429b8eeaea88892)

# 開発環境

- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法

以下のコマンドを順に実行。  
％git clone https://github.com/iwataka123/amaterus.git  
％cd amaterus  
％bundle install  
％yarn install

# 工夫したポイント
- TOPページとチャット画面でも、スケジュールの確認が行いやすいように、レイアウトした。
- 週間予定を表示することで、予定の把握をしやすくした。
- 今日の予定を一覧表示する事で、タスクの管理をしやすくした。
- 記事を詳細表示した後、記事に既読マークがつくことで未読を防ぐ工夫をした。
- 記事投稿の際、キャッチアップ画像がない場合、「NO IMAGE」を表示するようにした。
- チャットを２人以上で行えるようにした。
- チャットで自分と他人の背景色を変えることで、判別しやすくした。
- 画像以外にも、ドキュメントファイルを送れるようにした。
- ドキュメントファイルの場合は、代替画像を表示するようにした。
- 記事の投稿と、チャットをフロートメニューにすることで、画面の情報量を減らした。
