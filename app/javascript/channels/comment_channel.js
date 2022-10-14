import consumer from "./consumer"

if(location.pathname.match(/\/articles\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    article_id: location.pathname.match(/\d+/)[0] //現在のパスを取得
  }, {
    
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
      <div class="comment-box",>
          <a href="/users/${data.user.id}">${data.user.nickname}</a>：${data.comment.comment}
      </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
    }
  })
}