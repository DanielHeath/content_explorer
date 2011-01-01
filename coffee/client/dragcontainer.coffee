$( ->
  zindex = 100;
  $('.narrative').ckeditor(customConfig: '/js/src/ckconfig.js')
  $('.draggable').draggable( 
    cancel: ".nodrag" 
    start: (event, poi) -> 
      $(event.target).css('z-index', zindex += 1)
  )
)