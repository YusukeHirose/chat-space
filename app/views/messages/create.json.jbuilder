json.body @message.body
json.image @message.image
json.user_name @message.user.name
json.time time_format(@message.created_at)
