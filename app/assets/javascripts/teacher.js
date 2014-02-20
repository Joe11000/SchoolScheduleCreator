$(function()
{
  // activates any delete images on screen already
  $(".delete_img").each(function(index, element)
  {
    $(this).click(function(e){e.preventDefault();$(this).parents(".course_row").remove();})
  });


  // add button listener to insert new course into table with all required listeners
  $('#add_course_button').click(function(e){ e.preventDefault(); addCourseToList(); clearInput(); checkButtonDisable();});

  // disable button if no courses in table
  checkButtonDisable();

  // add listeneres to delete picture at the end of each course row
  $("#courses_table .delete_img").click(function(){$(this).parents(".course_row").remove(); checkButtonDisable();})
                                 .hover(function(){$(this).css('cursor', 'pointer');})


  $('#save_course_changes_button').click(function(e){
    e.preventDefault();

    $.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
    });

    // this is the ajax call to save form data in server db
    $.post("/courses", formToJSON(), function(response){
       if(response.navigate != undefined)
          eval(response.navigate);
       else
        console.log(response.notice)
     }, "json")
  });

  function addCourseToList()
  {
    c_subject               = $('#subject')[0].value;
    c_course_number         = $('#course_number')[0].value;
    c_min_students_to_teach = $('#min_students_to_teach')[0].value;

    if(c_subject == "" || c_course_number == "" || c_min_students_to_teach == "")
      return;


    c_course_number = c_course_number.replace(/[, -]/g, "_");

    string = "<tr class='course_row'>" +
                "<td><input class='row_subject' type='text' value='" + c_subject + "'></td>" +
                "<td><input class='row_course_number' type='text' value='" + c_course_number + "'></td>" +
                "<td><input class='row_min_students_to_teach' type='text' value='" + c_min_students_to_teach + "'></td>" +
                "<td><img alt='delete_img' class='delete_img' height='50' width='50' src='/assets/delete.png' ></td>" +
             "</tr>"

    $("#courses_table").append(string);
    $("#courses_table tr:last .delete_img").click(function(){$(this).parents(".course_row").remove(); checkButtonDisable();})
                                           .hover(function(){$(this).css('cursor', 'pointer');})
  }


  function checkButtonDisable()
  {
    if($('.course_row').toArray().length == 0)
      $('#save_course_changes_button').attr("disabled", "disabled");
    else
      $('#save_course_changes_button').removeAttr("disabled");
  }

  function clearInput()
  {
     $('#subject')[0].value = "";
     $('#course_number')[0].value = "";
     $('#min_students_to_teach')[0].value = "";
  }

  function formToJSON()
  {
  var json = {courses: {}}

 $(".course_row").each(function(index, element)  {
    row_subject = $(this).find('.row_subject')[0].value
    row_course_number = $(this).find('.row_course_number')[0].value
    row_min_students_to_teach = $(this).find('.row_min_students_to_teach')[0].value

    json['courses'][row_course_number] = {
                                           subject: row_subject,
                                           course_number: row_course_number,
                                           min_students_to_teach: row_min_students_to_teach
                                         }
  });

  return json
  }
});