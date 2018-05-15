<%-- 
    Document   : Chats
    Created on : 5 Apr, 2018, 8:00:57 PM
    Author     : basilscolu
--%>

  <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="refresh" content="10"/>
        <title>JSP Page</title>
         <link href="UserCss/HomePageCss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
     

<%
     String MessageSender_id=request.getParameter("id");
     String userid=session.getAttribute("userId").toString();
     String ss="";
   ResultSet rss=obj.selectData("select * from tbl_mymessagers mm where mm.My_id='"+MessageSender_id+"' and mm.My_Messager_id='"+userid+"'");
   if(rss.next())
   {
      if(rss.getString("typing").equals("Y")) 
      {
          ss="Typing..";
      }
   }
   
     
     
     
     obj.executeCommand("update tbl_messsage msg set msg.receiver_seen='Y' where msg.receiver_id='"+userid+"' and msg.sender_id='"+MessageSender_id+"'and msg.receiver_seen='N'");
 %>
 <input type="hidden"  value="<%=MessageSender_id%>"  id="hid">
 <h1 ><%=ss%></h1>
 <table style="margin-left: 200px;" >
     
     <tr>
 <table style="width: 380px;height: 50px;position: fixed ;margin: 0px 0px 0px 0px ;margin-left: 400px;">
        <tr>
                             <th > Message </th><th><label style="margin-left: 230px;cursor: pointer;font-size: 20px;"  class="close" id="closemessage1"> &times;</label> </th>
                         </tr>
        <tr>
            <td  style="width: 250px; height: 50px;"><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px;" id="Message" name="messageTextarea" required="" onfocus="show()"  ></textarea></td><td style="width: 70px;height: 50px;"> <input type="button" value="send" name="messagesend" style="width: 70px;height: 50px;border: solid #333;border-radius: 10px;background: #ff0033;color: #FFFFFF;" onclick="SendMessage('<%=MessageSender_id%>')"></td>
    </tr>
    </table>
 </tr>
 <tr>
  <div id="modalAboutMewww">
       
      
    <table style="width: 380px;overflow-y: scroll;overflow-x: hidden;margin-top: 100px;margin-left: 300px;">
         
<%
   
    ResultSet Rsmessageshow=obj.selectData("select * from tbl_messsage where (sender_id='"+userid+"' and receiver_id='"+MessageSender_id+"') or( sender_id='"+MessageSender_id+"' and receiver_id='"+userid+"') order by M_id  desc");
while(Rsmessageshow.next())
{
    if(Rsmessageshow.getString("sender_id").equals(MessageSender_id))
    {
%>
<tr>
<td ><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px; background: #ff9999; " ><%=Rsmessageshow.getString("Message")%></textarea>
                <br>
            <span style="color: crimson;font-size: 10px"><%=Rsmessageshow.getString("mdate")%>-<%=Rsmessageshow.getString("mTime")%></span>
                </label></td><td></td>
</tr>
<%
    }
    else
    {
        %>
        
<tr>
<td></td><td  ><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px; background: #33ffcc; " ><%=Rsmessageshow.getString("Message")%></textarea><br>
            <span style="color: crimson;font-size: 10px"><%=Rsmessageshow.getString("mdate")%>-<%=Rsmessageshow.getString("mTime")%></span></td>
</tr>
        <%
    }
}
%>
    </table>
 
  </div>
     </tr>
    </table>
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
         //alert(result);
        $("#modalAboutMewww").html(result);
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
        function show()
        {
            alert("working");
            var v=hid.value;
            alert(v);
            $.ajax({url:"Ajax_sendTyping.jsp?&id="+v+"", 
         success: function(result){
         //alert(result);
       // $("#modalAboutMewww").html(result);
    }});
        }
     function show1()
     {
         alert("DDD");
     }
      
    </script>
</html>
