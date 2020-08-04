$(document).on('turbolinks:load', function(){
  $(function(){

    $(document).ready(function(){
      $(".signUp-background").fadeIn(1500)
    })

    $(".btn-app").hover(
      function(){
        $(this).css('opacity', '0.5');
      },
      function(){
        $(this).css('opacity', '');
      }
    );
  
    $(".btn-google").hover(
      function(){
        $(this).css('opacity', '0.5');
      },
      function(){
        $(this).css('opacity', '');
      }
    );


    function buildHTML(image){
      let html = `
                  <div class=".user-image-box">
                    <label for="image-edit-id">
                      <img src="${image}", class="user-image">
                    </label>
                  </div>
                  `
      console.log(html);
      return html;
    }

    $("#image-edit-id").on("change", function(){
      console.log("change");
      let file = this.files[0];
      // FileReader=>ユーザーのファイルをウェブアプリケーションから非同期的に読み込むことができるオブジェクト
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(){
      $(".user-image").remove();
        let image = this.result;
        var html = buildHTML(image);
        $(".user-image-box").append(html);
      }
    })

  });
});
