
$(function() {
  $("#yes").submit(function(){console.log("submitted")});

  $( "#user_img" ).draggable(
      { revert: true });
  $( "#droppable" ).droppable({
    hoverClass: "drop-hover-dislike",
    drop: function( event, ui ) {
      $( this )
        .addClass( "ui-state-highlight" )
        .find( "h1" )
          .html( "Get Lost!" );
      $("#draggable").hide();
      setTimeout(function () {
        $( "#no" ).trigger( "click" );
      }, 200);
    }
  });
  $( "#droppable2" ).droppable({
    hoverClass: "drop-hover-like",
    drop: function( event, ui ) {
      $( this )
        .addClass( "ui-state-highlight" )
        .find( "h1" )
          .html( "Let's tuck in!" );
      $("#draggable").hide();
      setTimeout(function () {
        $( "#yes" ).trigger( "click" );
      }, 200);
    }
  });

});
