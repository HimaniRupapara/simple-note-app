$(document).ready(function() {
  $("#note_search input").on('input', function(e) {
    $.get($("#note_search").attr("action"), $("#note_search").serialize(), null, "script");
    return false;
  });
});
