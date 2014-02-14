$(function()
{
  my_hash = {'key': "value"};
	$('#add_course_button').click(function(e){ e.preventDefault(); addCourseToList(); clearInput()});
	// $("#next_button").click(function(e){ e.preventDefault(); postWithCoursesList()});

	function addCourseToList()
	{
		a = $('#subject')[0].value
    b = $('#course_number')[0].value
    c = $('#min_students_to_teach')[0].value

    if(a == "" || b == "" || c == "")
    	return;

    id = b.split(' ')[0];

    string = "<tr>" +
                "<td><input name='courses[" + id + "[subject]]' type='text' value='" + a + "'></td>" +
                "<td><input name='courses[" + id + "[course_number]]' type='text' value='" + b + "'></td>" +
                "<td><input name='courses[" + id + "[min_students_to_teach]]' type='text' value='" + c + "'></td>" +
                "<td><img alt='Delete' height='50' width='50' src='/assets/delete.png' ></td>" +
             "</tr>"

    $("#courses_table").append(string);
	}

	function deleteCourse()
	{
		alert("working so far")
		$(this).getParent();
	}

	function clearInput()
	{
		 $('#subject')[0].value = "";
		 $('#course_number')[0].value = "";
		 $('#min_students_to_teach')[0].value = "";
	}

	function convertListToJSON()
	{
		// courses_hash = new Array()

     $("#courses_table tr").each(function(index,element){
       if(index == 0); "hey"
       	 // continue;

       // courses_hash[:]

     })
	}

	function postWithCoursesList()
	{
		// $.post( "ajax/test.html", convertListToJSON());

		// $.post( <%= escape_javascript(school_courses_path(@school)) %>, {"MAT_101": ["math", "MAT_101", 14], "eng_216": ["english", "eng_216", 15]});
		// $.post( "/schools/10/courses", {"MAT_101": ["math", "MAT_101", 14], "eng_216": ["english", "eng_216", 15]});
	}

});