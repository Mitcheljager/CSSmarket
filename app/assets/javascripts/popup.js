$('.content__button').on("click", function() {
  $(".popup").addClass("popup--animation-in");

  //Prevent scrolling
  $("body, html").addClass('body--no-scroll');
});

$('.popup__close').on("click", function() {
  $(".popup").removeClass("popup--animation-in");

  //Add scrolling
  $("body, html").removeClass('body--no-scroll');
});
