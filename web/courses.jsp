<%-- 
    Document   : form2
    Created on : 8 Sep, 2017, 7:26:38 PM
    Author     : Shabbir
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
    </head>
    <body>
        
        <%
            System.out.println("Step 1");
            String query_for_id = "select * from students";
            String id = null;
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String passing_year = request.getParameter("passing");
            String qualifications = request.getParameter("qualifications");
            String date_of_birth = request.getParameter("date_of_birth");
            String email = request.getParameter("email_id");
            String telephone = request.getParameter("phone_number");
            String cn;
            System.out.println("Step 1");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");
            System.out.println("Step 2");
            Statement stmt = conn.createStatement();
            System.out.println("Step 3");
            ResultSet result_id = stmt.executeQuery(query_for_id);
            int i = 0;
            while(result_id.next())
                i++;
            String query = "insert into students(student_name,address,student_year_of_passing,student_id,student_qualification,student_dob,email,student_contact) values('"+name+"','"+address+"','"+passing_year+"','"+i+"','"+qualifications+"','"+date_of_birth+"','"+email+"','"+telephone+"')";
            ResultSet rset = stmt.executeQuery(query);
            /*PreparedStatement pst = null;
            pst = conn.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setString(3, passing_year);
            pst.setString(4, qualifications);
            pst.setString(5, date_of_birth);
            pst.setString(6, email);
            pst.setString(7, telephone);*/
            System.out.println("Step 4");
        %>
        <h1> Select Courses </h1>
        <form method="POST" action="hostel.jsp">
            <input type ="checkbox" class ="course_name" name ="course_value" value ="bms" onclick="checked_course()"> B.MS <br>
            <p id="bms"></p>
            <input type ="checkbox" class ="course_name" name="course_value" value ="bscit" onclick="checked_course()">BScit<br>
            <p id="bscit"></p>
            <input type ="checkbox" class="course_name" name="course_value"  value="bcom" onclick="checked_course()"> B.COM<br>
            <p id="bcom"></p>
            
            <button name ="submit" >Submit</button>
        </form>
        
             
            
            <script>
                function checked_course(){
                    //Java code begins on click
                   <%
                String bcom = "B.COM";//request.getParameter("bcom");
                String bscit = "BSCIT";
                String bms = "BMS"; 
                String name_course = null;
                String course_query_bcom = "select * from courses where course_name='"+bcom+"'";
                String course_query_bms = "select * from courses where course_name='"+bms+"'";
                String course_query_bscit = "select * from courses where course_name='"+bscit+"'";
                
                ResultSet result_bcom = null;
                result_bcom = stmt.executeQuery(course_query_bcom);
                
                //System.out.println(course_query_bcom);
                if(result_bcom.next()){
                    //System.out.println("No such data");
                //else {
                    //System.out.println(result_bcom.getString(1));
                    //name_course = result_bcom.getString(1);*/
                    
             %>
                    //Java code ends
                    var checked_value = null;
                    var course = document.getElementsByClassName("course_name");
                    for(var i=0; course[i]; ++i){
                        if(course[i].checked){
                            checked_value = course[i].value;
                            //window.location.replace("courses.jsp?checked_value ="+checked_value);
                            if (checked_value == "bcom"){
                                
                            
                                document.getElementById('bcom').innerHTML = "Course Name: "+"<%=result_bcom.getString(1)%>"+"<br>"+
                                                                             "Course Fees: " +"<%=result_bcom.getString(2)%>"+"<br>"+
                                                                             "Course Qualification: "+"<%=result_bcom.getString(3)%>"+"<br>"+
                                                                              "Course Seat Availability: "+"<%=result_bcom.getString(4)%>";
                                                                            
                                //break;
                            }
                            <% } %>
                            <%
                                ResultSet result_bscit = null;
                                result_bscit = stmt.executeQuery(course_query_bscit);
                                if(result_bscit.next()){
                                %>
                            
                            else if (checked_value == "bscit"){
                                                            
                                document.getElementById('bscit').innerHTML = "Course Name: "+"<%=result_bscit.getString(1)%>"+"<br>"+
                                                                             "Course Fees: "+"<%=result_bscit.getString(2)%>"+"<br>"+
                                                                             "Course Qualification: "+"<%=result_bscit.getString(3)%>"+"<br>"+
                                                                              "Course Seat Availability: "+"<%=result_bscit.getString(4)%>";
                                //break;
                            }
                            <%
                                }
                                %>
                            <%
                                ResultSet result_bms = null;
                                result_bms = stmt.executeQuery(course_query_bms);
                                if(result_bms.next()){
                                
                                %>
                            else if (checked_value == "bms"){
                                document.getElementById('bms').innerHTML = "Course Name: "+"<%=result_bms.getString(1)%>"+"<br>"+
                                                                             "Course Fees: "+"<%=result_bms.getString(2)%>"+"<br>"+
                                                                             "Course Qualofication: "+"<%=result_bms.getString(3)%>"+"<br>"+
                                                                              "Course Seat Availability: "+"<%=result_bms.getString(4)%>";
                                //break;
                            }
                            <%
                                }
                                %>
                            
                                
                            /*document.getElementById('bcom').innerHTML = checked_value;
                            break;
                        }
                        else if(course[i].checked == "bscit"){
                            checked_value = course[i].value;
                            document.getElementById('bscit').innerHTML = checked_value;
                            //break;
                        }
                        else{
                            checked_value = course[i].value;
                            document.getElementById('bms').innerHTML = checked_value;
                            //break;*/
                        }
                        
                    }
                    //document.getElementById("details").innerHTML = checked_value;
                }
                
            </script>
            
    </body>
</html>
