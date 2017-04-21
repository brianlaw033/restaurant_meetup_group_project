
$(function() {
  $("#yes").submit(function(){console.log("submitted")});

  $( "#user_img" ).draggable(
      { revert: true });
  $( "#droppable" ).droppable({
    hoverClass: "drop-hover-dislike",
    drop: function( event, ui ) {
      $( this )
      setTimeout(function () {
        console.log("nope");
        $( "#no" ).trigger( "click" );
      }, 200);
    }
  });
  $( "#droppable2" ).droppable({
    hoverClass: "drop-hover-like",
    drop: function( event, ui ) {
      $( this )
      setTimeout(function () {
        console.log("yes");
        $( "#yes" ).trigger( "click" );
      }, 200);
    }
  });

});
