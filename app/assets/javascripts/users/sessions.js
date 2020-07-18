$(document).on('turbolinks:load', function(){
  $(function(){
    $(document).ready(function(){
      $(".signIn-background").fadeIn(1500)
    })
  });

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
});