module MessagesHelper
  def time_format(post_time)
    post_time.strftime('%Y/%m/%d %H:%M')
  end
end
