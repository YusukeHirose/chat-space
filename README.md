
chat-space.database
===================

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, index: { unique: true }, foreign_key: true|
|group|references|null: false, index: { unique: true }, foreign_key: true|

### Association

belongs_to :group
belongs_to user



## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|unique: true|
|user|references|null: false, index: { unique: true }, foreign_key: true|

### Association

- has_many :users, through: :members, source: :users
- has_many :messages
- has_many :members



## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|unique: true, null: false|
|name|string|null: false|
|group|references|null: false, index: { unique: true }, foreign_key: true|

### Association

- has_many :groups, through: :members, source: :groups
- has_many :members
- has_many :messages


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|user|references|null: false, index: { unique: true }, foreign_key: true|
|group|references|null: false, index: { unique: true }, foreign_key: true|


### Association

belongs_to :group
belongs_to user




