$(".header__icon--mobile-menu").on("click", function () {
  $(".menu").addClass("menu--is-moving-in");
  $(".overlay").addClass("overlay--is-moving-in");
});

$(".overlay, .menu__close").on("click", function () {
  $(".menu").addClass("menu--is-moving-out").removeClass("menu--is-moving-in");
  $(".overlay").removeClass("overlay--is-moving-in");

  setTimeout(function () {
    $(".menu").removeClass("menu--is-moving-out");
  }, 300);
});
