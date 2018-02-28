$(function() {
  var searchList = $("#user-search-result");
  var memberList = $("#member-list")

  function appendUser(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    searchList.append(html);
  }

  function appendNoUser(user) {
    var html = `<div calss="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user}</p>
                </div>`
    searchList.append(html);
  }

  $("#user-search-field").ready(function() {
    $("#user-search-field").on("keyup",this, function(){
    var input = $(this).val();

      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
      })

      .done(function(users) {
        $("#user-search-result").empty();
        if(users.length !== 0) {
          users.forEach(function(user){
            appendUser(user);
          });
        }
        else {
          appendNoUser("一致するユーザーはいません。")
        }
      })
      .fail(function() {
        alert("ユーザー検索に失敗しました。");
      })
    });
  });

  function addUser(user) {
    var userId = $(user).data("user-id");
    var userName = $(user).data("user-name");
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${userId}'>
                  <p class='chat-group-user__name'>${userName}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    memberList.append(html)
  };

  $(document).on("click", ".chat-group-user__btn", function(e){
       switch ($(e.currentTarget)[0].innerText) {
         case "追加":
           $(this).parent().remove();
           addUser(this);
           break;
         case "削除":
           $(this).parent().remove();
           break;
         default:
           break;
       };
    }
  );

});
