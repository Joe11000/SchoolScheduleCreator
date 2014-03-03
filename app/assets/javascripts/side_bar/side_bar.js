// addSideBarItem(str)  uses (1) value of  text_field#item_str
//                           (2) button#add_side_bar_item_button


$('#side_bar').delegate('.side_bar_item', 'click', function() {
                if(calendar_info_edited)
                {
                  // if
                  $.post('/teachers/'+ "" + '/calendar', getEventsFromCalendar(), function(){

                  })
                }
                $('.side_bar_item').each(function() {
                  $(this).removeClass('selected');
                });
                $(this).addClass('selected');

                // clear calendar
                $('#calendar').weekCalendar('clear');

                // fill calendar with teachers schedule
                // fillCalendarWithSchedule()
              })
              .delegate('.side_bar_item', 'dblclick', function() {
                if($(this).hasClass('selected'))
                {
                  alert('dblclick');
                }
              })

$('body').delegate('#add_side_bar_item_button', 'click', function() {
  item = $('#item_str')

  if( item.val() != "" )
  {
    addSideBarItem(item.val());
    item.val("") ;
  }
});



// .delegate('.side_bar_item', 'blur', function(){ alert$(this).removeClass('selected')})


// fill in teachers that exist already
// $('#outer_calendar_div').append("<div id='teacher_list'> <label class='teacher_in_list'>Add New</label>  </div>")


  var addSideBarItem = function(str)
  {
      $('#side_bar').append("<label class='side_bar_item'>" + str + "</label>")
  }