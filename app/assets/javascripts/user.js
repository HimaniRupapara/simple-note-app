$(document).ready(function() {
  var myitem = document.querySelectorAll(".activeClass");

  for (h = 0; h < myitem.length; h++) {
    myitem[h].addEventListener("click", function(e) {
      var hh = document.querySelector(".navHeaderTitle");
      var myitem = document.querySelectorAll(".activeClass");
      for (h = 0; h < myitem.length; h++) {
        myitem[h].classList.remove("bordered");
      }
      this.classList.add("bordered");
    });
  }

  $("#note_search input").on('input', function(e) {
    $.get($("#note_search").attr("action"), $("#note_search").serialize(), null, "script");
    return false;
  });


});
