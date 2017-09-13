<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <style>
		div{
			align-items: center;
			width: 50%;
			height: 20%;
			text-align: center;
			outline: none;
		}
		input[type = text]{
			width: 70%;
			padding: 12px;
			border-radius: 8px;
			border-color: #4CAF50;
			outline-color: blue;
			outline: transparent;

		}
		input[type = text]:hover{
			border-color: blue;
			box-shadow: 0 2px #999;
		}
		input[type = text]:active{
			border-color: blue;
			box-shadow: 0 4px #999;
		}
                
                input[type = date]{
			width: 70%;
			padding: 12px;
			border-radius: 8px;
			border-color: #4CAF50;
			outline-color: blue;
			outline: transparent;

		}
		input[type = date]:hover{
			border-color: blue;
			box-shadow: 0 2px #999;
		}
		input[type = date]:active{
			border-color: blue;
			box-shadow: 0 4px #999;
                }
                
		input[type = email]{
			width: 70%;
			padding: 12px;
			border-radius: 8px;
			border-color: #4CAF50;
			outline-color: blue;
		}
		input[type = email]:hover{
			border-color: blue;
			box-shadow: 0 2px #999;
		}
		input[type = email]:active{
			border-color: blue;
			box-shadow: 0 4px #999;
		}
		input[type = tel]{
			width: 70%;
			padding: 12px;
			border-radius: 8px;
			border-color: #4CAF50;
			outline-color: blue;

		}
		input[type = tel]:hover{
			border-color: blue;
			box-shadow: 0 2px #999;
		}
		input[type = tel]:active{
			border-color: blue;
			box-shadow: 0 4px #999;
		}
		input[type = password]{
			width: 70%;
			padding: 12px;
			border-radius: 8px;
			border-color: #4CAF50;
			outline-color: blue;

		}
		input[type = password]:hover{
			border-color: blue;
			box-shadow: 0 2px #999;
		}
		input[type = password]:active{
			border-color: blue;
			box-shadow: 0 4px #999;
		}
		input[type = submit]{
			width: 70%;
			padding: 12px;
			border-radius: 8px;
			border-color: #4CAF50;
			background-color: #4CAF50;
			color: #fff;
			transform: translateY(15px);
			outline: none;
			box-shadow: 0 2px #666;
		}
		input[type = submit]:hover{
			background-color: green;
		}
		input[type = submit]:active{
			background-color: green;
			box-shadow: 0 1px #999;
			transform: translateY(1px);
		}
	</style>

    </head>

    <body>
        <center>
            <form method="POST" action="courses.jsp" >
            <input type="text" name="name" 
            placeholder="Enter your Full Name" required><br><br>
            <input type="text" name="address" 
            placeholder="Enter your Address" required><br><br>
            <input type="number" name="passing" 
            placeholder="Enter Year of Passing" required><br><br>
            <input type="text" name="qualifications"
            placeholder ="Enter your Qualifications" required><br><br>
            <input type="date" name="date_of_birth" 
            placeholder="Enter your DOB" required><br><br>
            <input type="email" name="email_id" 
            placeholder="Enter your email id" required><br><br>
            <input type="tel" name="phone_number" 
            placeholder="Enter your Contact" required><br><br>
            <input type="submit" name="Sign_up" 
            value="Sign up" >
        </form>
        </center>
    </body>
</html>
