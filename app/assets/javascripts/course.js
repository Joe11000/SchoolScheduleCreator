$(function()
{
  my_hash = {'key': "value"};
	$('#add_course_button').click(function(e){ e.preventDefault(); addCourseToList(); clearInput()});
	// $("#next_button").click(function(e){ e.preventDefault(); postWithCoursesList()});

	function addCourseToList()
	{
		a = $('#name')[0].value
    b = $('#number')[0].value
    c = $('#num_students')[0].value

    if(a == "" || b == "" || c == "")
    	return;

    // f = document.createElement("FORM")

    string = "<tr>" +
                "<td><input id='course' name='course[course]' type='text' value='" + a + "'></td>" +
                "<td><input id='course_number' name='course[course_number]' type='text' value='" + b + "'></td>" +
                "<td><input id='num_students' name='course[num_students]' type='text' value='" + c + "'></td>" +
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
		 $('#name')[0].value = "";
		 $('#number')[0].value = "";
		 $('#num_students')[0].value = "";
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
		$.post( "/schools/10/courses", {"MAT_101": ["math", "MAT_101", 14], "eng_216": ["english", "eng_216", 15]});
	}

});