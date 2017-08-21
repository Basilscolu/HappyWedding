<%-- 
    Document   : regjsp
    Created on : Aug 5, 2017, 2:13:19 PM
    Author     : student36
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    if(request.getParameter("submit")!=null)
    {
        String add,qual,gen,email,pass,repass;
        String name=request.getParameter("txt_name");
        add=request.getParameter("txt_address");
       gen=request.getParameter("gender");
       email=request.getParameter("email1");
       qual=request.getParameter("qual");
       pass=request.getParameter("password");
       repass=request.getParameter("repassword");
        String str="insert into tbl_reg(name,address,gender,qualification,email,pass,repass) values('"+name+"','"+add+"','"+gen+"','"+email+"','"+qual+"','"+pass+"','"+repass+"')";
       
         boolean b=obj.ExecuteCommand(str);
         if(b==true)
            out.print("success");
         else
            out.print(str);
         
         
    }
     else if(request.getParameter("delete")!=null)
     {
         String name=request.getParameter("txt_name");
         String str="delete from tbl_reg where name='"+name+"'";
           boolean b=obj.ExecuteCommand(str);
         if(b==true)
            out.print("success");
         else
            out.print(str);
                
     }
    %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
<table align=center>
<tr><td>NAME:</td><td><input type="text" name="txt_name"></td></tr>
<tr><td>ADDRESS:</td><td><textarea name="txt_address"></textarea></td></tr>
<tr><td>GENDER :</td><td>
MALE<input type="radio" name="gender" id="genderradio" >
FEMALE<input type="radio" name="gender" id="genderradio">
<tr><td>QUALIFICATION: </td>
<td><select name="qual" id="qualification">
<option>MCA</option>
<option>MBA</option>
<option>BSC</option>
<option>BCA</option>
<tr><td>EMAIL:<td><input type="text" name="email1" id="email"</td></tr>
<tr><td>PASSWORD:<td><input type="password" name="password" id="pass1"></td></tr>
<tr><td>RE-ENTER PASSWORD:<td><input type="password" name="repassword" id ="pass2"></td></tr>
<tr><td><input type="submit" name="submit" onclick="return check()"></td>
    
<td><button type="button" name="reset">RESET</td></tr>
<tr><td><button type="submit" name="delete">delete</td></tr>

</table>
</form>
    </body>
</html>
