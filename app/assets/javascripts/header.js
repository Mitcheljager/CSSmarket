$(document).on("click", ".header__icon--mobile-menu", function () {
  $(".menu").addClass("menu--is-moving-in");
  $(".overlay").addClass("overlay--is-moving-in");
});

$(document).on("click", ".overlay, .menu__close", function () {
  $(".menu").addClass("menu--is-moving-out").removeClass("menu--is-moving-in");
  $(".overlay").removeClass("overlay--is-moving-in");

  setTimeout(function () {
    $(".menu").removeClass("menu--is-moving-out");
  }, 300);
});
