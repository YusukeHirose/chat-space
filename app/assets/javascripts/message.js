$(function(){
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    //リクエスト送信先のURLを定義
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      //dataに指定したオブジェクトをクエリ文字列に変換
      processData: false,
      contentType: false
    })
  })
})
