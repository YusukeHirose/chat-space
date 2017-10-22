
chat-space.database
===================

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|key|string|unique: true|
|user_id|string|null: false, foreign_key: true|

### Association

- has_many :users
- has_many :messages
- has_many :members
- has_many :users_groups, through: :members, source: :users


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|unique: true, null: false|
|name|string|null: false|
|group_id|integer|null: false, foreign_key: true|

### Association

- has_many :groups
- has_many :messages
- has_many :members
- has_many :users_groups, through: :members, source: :groups


## messagesテーブル  

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|user_id|integer|null: false, foreign_key :true|
|group_id|integer|null: false, foreign_key :true|


### Association

- belongs_to :user
- belongs_to :user



