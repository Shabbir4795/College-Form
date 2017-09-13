<%-- 
    Document   : SaveDisplayData
    Created on : 13 Sep, 2017, 12:50:04 AM
    Author     : Shabbir
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td{
                border: 1px solid black;
                padding:12px;
            }
        </style>
    </head>
    <body>
        
        <button onclick="myFunction()">Print</button>
        
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");
           Statement stmt = conn.createStatement();
           String course_contact = null;
           String name = null;
           String all_courses = new String();
           String room_requirement = request.getParameter("hostel");
           String radio_select = "N.A";
           String fees = "0";
           String contact = null;
           String query_for_students = "select *"
                   + " from students where student_id=(select max(student_id) from students)";
           ResultSet  result_student = stmt.executeQuery(query_for_students);
           if(result_student.next()){
               name = result_student.getString("student_name");
               contact = result_student.getString("student_contact");
               
           }
           
           
           System.out.println("Contact = "+contact);
           String course_displayed = "select * from course_students where student_contact='"+contact+"'";
           ResultSet course_for_student = stmt.executeQuery(course_displayed);
           
           
           while(course_for_student.next()){
               all_courses = all_courses+ course_for_student.getString("course_name") + ", ";
           }
           all_courses = all_courses.toUpperCase();
           System.out.println(all_courses);
           System.out.println(room_requirement);
           room_requirement = room_requirement.toUpperCase();
           
           if(room_requirement.equals("YES")){
               System.out.println("YO");
               radio_select  = request.getParameter("sharing");
                System.out.println("hello");
                String query_fees = "select * from hostel where room_sharing='"+radio_select+"'";
                ResultSet fee_result = stmt.executeQuery(query_fees);
                //fees = null;
                if(fee_result.next()){
                    fees = fee_result.getString("room_fees");
                }
                System.out.println(fees);
                System.out.println(radio_select);
           
                
                String insert = "insert into student_hostel(student_name, student_contact, student_room_sharing, room_fees)"
                        + "values('"+name+"','"+contact+"','"+radio_select+"','"+fees+"')";
                ResultSet save = stmt.executeQuery(insert);
                System.out.println("good");
           
           }
           else{
           System.out.println("no");
           System.out.println(room_requirement);}
         %>
         
         
         <h3>Personal Details</h3>
         <%
             Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");
           Statement statement = connect.createStatement();
           String name1 = null;
           String contact1 = null;
           String address1 = null;
           String email1 = null;
           String dob1 = null;
           String yop1 = null;
           String qual1 = null;
           String query1 = "select *"
                   + " from students where student_id=(select max(student_id) from students)";
           ResultSet  rset = statement.executeQuery(query_for_students);
           if(rset.next()){
               name1 = rset.getString("student_name");
               contact1 = rset.getString("student_contact");
               yop1 = rset.getString("student_year_of_passing");
               dob1 = rset.getString("student_dob");
               email1 = rset.getString("email");
               qual1 = rset.getString("student_qualification");
               address1 = rset.getString("address");
               System.out.println(name1);
           }
               //Course Fees
                   String bcom = null;
                   String bscit = null;
                   String bms = null;
                   String bcom_seat = null;
                   String bcom_qual = null;
                   String bms_seat = null;
                   String bms_qual = null;
                   String bscit_seat = null;
                   String bscit_qual = null;
                   
               String query2 = "select * from courses";
               ResultSet rset2 = statement.executeQuery(query2);
               while(rset2.next()){
                   System.out.println("abbcd");
                   String cn = rset2.getString("course_name");
                   System.out.println(cn);
                   if(cn.equals("B.COM")){
                        bcom = rset2.getString("course_fees");
                        bcom_seat = rset2.getString("course_seat_availability");
                        bcom_qual = rset2.getString("course_qualification");
                   }
                       
                   else if(cn.equals("BMS")){
                        bms = rset2.getString("course_fees");
                        bms_seat = rset2.getString("course_seat_availability");
                        bms_qual = rset2.getString("course_qualification");
                   }
                       
                   else{
                        bscit = rset2.getString("course_fees");
                        bscit_seat = rset2.getString("course_seat_availability");
                        bscit_qual = rset2.getString("course_qualification");
                   }
                       
                   System.out.println(bcom);
               }
           

         %>
         <table>
             <tr>
                 <td>
                     Name:
                 </td>
                 <td>
                     <%=name1%>
                     
                 </td>
             </tr>
             <tr>
                 <td>
                     Contact Info:
                 </td>
                 <td>
                     <%=contact1%>
                 </td>
             </tr>
             <tr>
                 <td>
                     Address :
                 </td>
                 <td>
                     
                     <%=address1%>
                 </td>
             </tr>
             <tr>
                 <td>
                     Qualification :
                 </td>
                 <td>
                     
                     <%=qual1%>
                 </td>
             </tr>
             <tr>
                 <td>
                     Date of Birth :
                 </td>
                 <td>
                     
                     <%=dob1%>
                 </td>
             </tr>
             <tr>
                 <td>
                     Email :
                 <td>
                     
                     <%=email1%>
                 </td>
             </tr>
             <tr>
                 <td>
                     Year of Passing :
                 </td>
                 <td>
                     
                     <%=yop1%>
                 </td>
             </tr>
             
         </table>
          
         <hr>
         <h3>Course Details</h3>
         <table>
             <tr>
                 <td>
                     Courses Selected :
                 </td>
                 <td>
                     <%=all_courses%>
                 </td>
             </tr>
             <th>Course Name</th><th>Course Fees</th><th>Seat Available</th><th>Qualifications required</th>
             <tr>
                 <td>
                    BCOM
                </td>
             <td>
                 <%=bcom%>
             </td>
             
             <td>
                 <%=bcom_seat%>
             </td>
             <td>
                 <%=bcom_qual%>
             </td>
             </tr>
             <tr>
                 <td>
                     BMS
                 </td>
                 <td>
                     <%=bms%>
                 </td>
                 <td>
                     <%=bms_seat%>
                 </td>
                 <td>
                     <%=bms_qual%>
                 </td>
             </tr>
             <tr>
                 <td>
                     BScit
                 </td>
                 <td>
                     <%=bscit%>
                 </td>
                 <td>
                     <%=bscit_seat%>
                 </td>
                 <td>
                     <%=bscit_qual%>
                 </td>
             </tr>
             
         </table>
             
                 <hr>
                 <h3>Hostel Details</h3>
         <table>
             <tr>
                 <td>
                     Hostel Room Required: 
                 </td>
                 <td>
                     <%=room_requirement%>
                 </td>
             </tr>    
             <tr>
                 <td>
                     Room Sharing between: 
                 </td>
                 <td>
                     <%=radio_select%>
                 </td>
             </tr>
             <tr>
                 <td>
                     Hostel Fees:
                 </td>
                 <td>
                     <%=fees%>
                 </td>
             </tr>
         </table><br><br>
                 
                 

                <script>
                    function myFunction() {
                     window.print();
                    }
                </script>
    </body>
</html>
