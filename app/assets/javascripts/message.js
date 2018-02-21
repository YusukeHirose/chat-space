$(document).on('turbolinks:load', function() {
  $(function(){
    function buildHTML(message){
      var json_body = "";
      var json_image = "";
      if (message.body) {
        json_body = `${message.body}`
      }
      if (message.image.url) {
        json_image = `<img src="${message.image.url}">`
      }
      var html = `<ul class="body__messages">
                    <li class="body__messages_username">
                      ${message.user_name}
                    </li>
                    <span class="body__messages_date">
                      ${message.time}
                    </span>
                    <li class="body__messages_message">
                      ${json_body}
                    </li>
                    <li class="body__messages_image">
                      ${json_image}
                    </li>
                  </ul>`
      return html;
    }
    $('.form__submit').removeAttr('data-disable-with');
    $('#new_message').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = window.location.href
      $.ajax({
        url: url,
        type: 'POST',
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data)
        var target = $('.body').append(html)
	      $(target).animate({scrollTop: $(target)[0].scrollHeight})
        $('.form__message').val("")
        $('.hide').val("")
      })
      .fail(function(){
        alert('メッセージ送信に失敗しました。');
      })
    })
  })
})
