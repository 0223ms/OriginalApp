$(document).on('turbolinks:load', function(){
  $(function(){
    $(document).on("click", function(e){
      if( e.which === 1 && e.target === $(".header-users i").get(0) ){
        $(".header-users-notification").fadeIn("1000")
      }else{
        $(".header-users-notification").fadeOut("1000")
      }
    });
  });
});