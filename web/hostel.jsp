<%-- 
    Document   : newjsp
    Created on : 12 Sep, 2017, 10:46:04 AM
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
            input[type=radio] + .details{
                display: none;
            }

            input[type=radio]:checked + .fordebit {
                display: block;
            }

            input[type=radio]:checked + .hostel {
                display: block;
            }
            input[type=radio] {
                float:left;
            }
            #share + .room_cost{
                display:none;
            }
            #share:checked + .room_cost{
                display:block;
            }
            
        </style>
    </head>
    <body>
        
        <%
           String checked [] = request.getParameterValues("course_value");
           String name = null;
           String contact = null;
           String qualification = null;
           String query_for_students = "select *"
                   + "from students where student_id=(select max(student_id)from students)";
           Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");
           Statement stmt = conn.createStatement();
           ResultSet  result_student = stmt.executeQuery(query_for_students);
           if(result_student.next()){
               name = result_student.getString("student_name");
               contact = result_student.getString("student_contact");
               qualification = result_student.getString("student_qualification");
           }
           for(int i=0; i<checked.length;i++){
               //System.out.println(checked[i]);
               String query = "insert into course_students(student_name,course_name,"
                                + "student_qualification,student_contact)"
                                + "values('"+name+"','"+checked[i]+"','"+qualification+"',"
                                + "'"+contact+"')";
               ResultSet result = stmt.executeQuery(query);
           }
            
         %>
        
        <form method="post" action="SaveDisplayData.jsp">

  <h4>Hostel Requirement:</h4>
  
  <div>
    <div>
      <label>Room Required</label>
      <input type="radio" name="hostel" id="room_yes" value="yes" required>

      <div class="hostel details">
          <hr>
        
        <h3>Room Sharing</h3>
        <div>
        <label>Room of 8</label>
        <input type ="radio" name="sharing" class="share" value="8" onclick="radio_click()"><br>
        <%
            String eight = "8";
            String query_8 = "select ROOM_FEES from hostel where room_sharing ='"+eight+"'";
            ResultSet result_8 = stmt.executeQuery(query_8);
            if(!result_8.next()){
                System.out.println("No such data");
            }
            else{
                System.out.println(result_8.getString(1));
                String hostel_entry = result_8.getString(1);
                String share = "8";
                %>
                
        <p id="room_eight"></p>
        <label>Room of 4</label>
        <input type ="radio" name="sharing" class="share" value="4" onclick="radio_click()"><br>
       
            <p id="room_four"></p>
        <label>Room of 2</label>
        <input type="radio" name="sharing" class="share" value="2" onclick="radio_click()"><br>
        <p id="room_two"></p>
        </div>
        
        
      </div>
      
    </div>
      <hr>
    <div>
      <label>Room Not Required</label>
      <input type="radio" name="hostel" id="debit" value="no">

      
    </div>
  </div>
<div>
    <input type="submit" value="Submit">
  </div>
        </form>          
  <script>
      function radio_click(){
          var checked_value = null;
          //document.getElementById('room_eight').innerHTML = "fgjhjh";
          var radio = document.getElementsByClassName("share");
          //document.getElementById('room_eight').innerHTML = radio[1];
          for(var i=0; radio[i];++i){
              if(radio[i].checked){
              //document.getElementById('room_eight').innerHTML = radio[i];
              checked_value = radio[i].value;
              if(checked_value == "8"){
               document.getElementById('room_eight').innerHTML = "Fees: "+"<%=result_8.getString(1)%>";
          }
          <%
              }
          %>
          <%
              //String radio_value = request.getParameter("checked_value");
              //System.out.println(radio_value);
          %>
              <%
            String four = "4";
            String query_4 = "select ROOM_FEES from hostel where room_sharing ='"+four+"'";
            ResultSet result_4 = stmt.executeQuery(query_4);
            if(!result_4.next()){
                System.out.println("No such data");
            }
            else{
                String hostel_entry = result_4.getString(1);
                String share = "4";
            %>
               else if(checked_value == "4")
                   document.getElementById('room_four').innerHTML = "Fees: "+"<%=result_4.getString(1)%>";
             <%
                }
            %>
              <%
                  String share = null, hostel_entry = null;
            String two = "2";
            String query_2 = "select ROOM_FEES from hostel where room_sharing ='"+two+"'";
            ResultSet result_2 = stmt.executeQuery(query_2);
            if(!result_2.next()){
                System.out.println("No such data");
            }
            else{
                 hostel_entry = result_2.getString(1);
                 share = "2";
            %>
            else if(checked_value == "2"){
               document.getElementById('room_two').innerHTML = "Fees: "+"<%=result_2.getString(1)%>"; 
                  <%
                      }
                      
                      %>
             }
            }
          }
          
          
      }
      
      
  </script>

        
    </body>
</html>
