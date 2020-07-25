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
    $(".cancel-btn").on("click", function(){
      $(".gray-back").fadeOut("show")
      $(".option-menu").fadeOut("show")
    })
    $(".option-btn-other").on("click", function(){
      $(".gray-back").fadeIn("show")
      $(".option-menu").fadeIn("show")
    })
  });
});