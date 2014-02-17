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

  function addCourseToList()
	{
		c_subject               = $('#subject')[0].value;
    c_course_number         = $('#course_number')[0].value;
    c_min_students_to_teach = $('#min_students_to_teach')[0].value;

    if(c_subject == "" || c_course_number == "" || c_min_students_to_teach == "")
    	return;


    c_course_number = c_course_number.replace(/[, ]/g, "_");


    string = "<tr class='course_row'>" +
                "<td><input name='courses[" + c_course_number + "[subject]]' type='text' value='" + c_subject + "'></td>" +
                "<td><input name='courses[" + c_course_number + "[course_number]]' type='text' value='" + c_course_number + "'></td>" +
                "<td><input name='courses[" + c_course_number + "[min_students_to_teach]]' type='text' value='" + c_min_students_to_teach + "'></td>" +
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

		// $.post( <%= escape_javascript(school_courses_path(@school)) %>, {"MAT_101": ["math", "MAT_101", 14], "eng_216": ["english", "eng_216", 15]});
		// $.post( "/schools/10/courses", {"MAT_101": ["math", "MAT_101", 14], "eng_216": ["english", "eng_216", 15]});
});