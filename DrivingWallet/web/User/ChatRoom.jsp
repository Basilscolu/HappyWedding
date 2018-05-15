<%-- 
    Document   : newjsp
    Created on : 5 Apr, 2018, 7:17:53 PM
    Author     : basilscolu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link href="UserCss/HomePageCss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <table id="myTable" >
                         <tr>
                             <th > Message </th><th><label style="margin-left: 230px;cursor: pointer;font-size: 20px;"  class="close" id="closemessage"> &times;</label> </th>
                         </tr>
           <%
                 String uid=session.getAttribute("userId").toString();
    
ResultSet rsMessage=obj.selectData("select * from tbl_myfriends myf ,tbl_userregistration reg  where myf.My_id ='"+uid+"' and myf.Friend_id=reg.UserId");
 while(rsMessage.next())
{
    
 %>
 <tr onclick="ShowMessageView('<%=rsMessage.getString("Friend_id")%>')">
     
 <input type="hidden" id="hm" value="<%=rsMessage.getString("Friend_id")%>">
           <td >
               <img class="imageIcon" src="ProfilePicture/<%=rsMessage.getString("Image")%>"  title ="<%=rsMessage.getString("Name")%>"></td>
           <td >     <label style="cursor: pointer"><i><%=rsMessage.getString("Name")%></i> </label>
               <br> 
                   <%
                   String ssss="";
                  
                   ResultSet rsmsgno=obj.selectData("select  count(*) from tbl_messsage msg where  msg.receiver_id='"+uid+"' and msg.receiver_seen='N' and msg.sender_id='"+rsMessage.getString("Friend_id")+"'");
                   while(rsmsgno.next())
                   {
                       ssss=rsmsgno.getString("count(*)");
                    if(rsmsgno.getString("count(*)").equals("0")) 
                    {
                  ssss="";
                   }
                   }
                   ResultSet rsa=obj.selectData("select * FROM tbl_messsage msg where msg.sender_id='"+uid+"' and msg.receiver_id='"+rsMessage.getString("Friend_id")+"' or msg.sender_id='"+rsMessage.getString("Friend_id")+"' and msg.receiver_id='"+uid+"'");
                  if(rsa.last())
                  {
                      %>
                      <label style="color: red"><%=rsa.getString("Message")+" "+ssss%> </label>
                      <%
                  }
                  
                  
                   %>
               
                 <a href="Chats.jsp?id=<%=rsMessage.getString("Friend_id")%>">view</a>
                            
           </td>
         
       </tr>
     
    
                           
                   
                           
      
                  
  <%
}
%>  

             </table>
<div id="modalAboutMe"></div>
    </body>
    <script src="jquery.min.js" type="text/javascript"></script>
    <script>
         
    function ShowMessageView(v)
    {
        //alert(h);
        alert(v);
     $.ajax({url:"Ajax_ShowMessage.jsp?id="+v, 
         success: function(result){
         alert(result);
        $("#modalAboutMe").html(result);
    }});
    }
    
    function SendMessage(v,h)
    {
   // alert(v);
 var h=document.getElementById("Message").value;
 
        
      //  alert(h);
    
    $.ajax({url:"Ajax_sendMessage.jsp?Message="+h+"&id="+v+"", 
         success: function(result){
         alert(result);
        $("#modalAboutMe").html(result);
    }});
        }
        
       
        function ShowAcceptedFriends()
        {
       // acceptedfriends   
        var Accepted = document.getElementById("acceptedfriends");
         Accepted.style="background:red";
          var HomeL = document.getElementById("HomeLink");
         HomeL.style="background:none";
         
        //alert("yo yo working")
           $.ajax({url:"Ajax_AcceptedFriends.jsp", 
         success: function(result){
        // alert(result);
        $("#result").html(result);
    }});
        }
        
      
    </script>
</html>
