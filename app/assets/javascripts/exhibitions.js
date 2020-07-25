$(document).on('turbolinks:load', function(){
  $(function(){
    $(".option-btn").on("click", function(){
      $(".gray-back").fadeIn("show")
      $(".option-menu").fadeIn("show")
    })
    $(".gray-back").on("click", function(){
      $(".gray-back").fadeOut("show")
      $(".option-menu").fadeOut("show")
    })
    $(".cancle-btn").on("click", function(){
      $(".gray-back").fadeOut("show")
      $(".option-menu").fadeOut("show")
    })
  });
});