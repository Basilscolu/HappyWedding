

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
     String UId=session.getAttribute("userId").toString();
    
     ResultSet rs=obj.selectData("select * from tbl_userregistration us where us.UserId='"+UId+"'");
     while(rs.next())
     {
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        
        
        <link href="UserCss/HomePageCss.css" rel="stylesheet" type="text/css">
        <style>
             .PropicCircle
                       {
                           width: 200px;
                           height: 200px;
                           margin-left: 100px;
                           margin-top: 80px;
                           border: solid;
                           border-radius: 100px;
                       }
                        .Propic
                 {
                     width:400px;
                     height: 400px;
                     border: solid #363636;
                     border-radius: 10px;
                     margin-left: 500px;
                     margin-top: 50px;
                 }
        </style>
        
    </head>
    <body style="margin-left: 0px;margin-top: 0px">
        
         <div style="width: 1400px;height: 150px; background-color: #363636;margin-bottom: 10px;position: fixed">
              <div class="MalyaliMarriage_logo" style="float:left;"> 
					

					<img src="img/HWloggo.png" alt="Driving Wallet" title="Driving Wallet" width="120" height="100" />

				    </div> 
            <div    style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Digitally Solution For Being Forgotton  !!!
                <a href="../Admin/AdminHomepage.jsp"></a>
            </div>
              <div style="width: 1400px;height: 50px; background-color: #363636;margin-bottom: 10px;padding-left: 100px;padding-top: 100px;">
                     <br>
                     <table>
                         <tr>
                             <td>
                                 <a href="Homepage.jsp" id="HomeLink"> <label class="regcheck" style="background: #ff0033">Home</label></a>
                             </td>
                             <td>
                                 <a href="Myapplication.jsp" ><label class="regcheck"> My Application</label></a>
                             </td>
                              <td>
                                  <a href="Qrcodes.jsp" >  <label class="regcheck" >MY QR Codes</label></a>
                             </td>
                            
                              <td>
                                  <a href="Notification.jsp" >  <label class="regcheck"  >Notification</label>
                             </td>
                              
                              <td>
                                  <a href="ChatRoom.jsp" >  <label class="regcheck"  >ChatRoom</label>
                             </td>
                         </tr>
                     </table>
                 </div>
             
              <div class="PropicCircle" >
                  <label for="propicxfile"><img id="proPic" style="width: 200px;height: 200px;border-radius: 100px" src="ProfilePic/<%=rs.getString("Image")%>"></label>
                  
                   <input type="file" name="propicxfile" id="propicxfile" style="display: none"  > 
               </div>
                  <table>
                <%
                ResultSet rss=obj.selectData("select * from tbl_license ll, tbl_rtoffice rt where ll.RtOfficeId=rt.id and UserId='"+UId+"'");
                while(rss.next())
                {
                    %>
                    <tr><th colspan="3">License Details</th></tr>
                    <tr><td style="width: 400px;height: 400px">
                    <label>License No :<%=rss.getString("LicenseNo")%> </label><br>
                    <label>Valid From-To :<%=rss.getString("validityFrom")%> -<%=rss.getString("ValidityTo")%> </label><br>
                    <label>Date Of Issue  :<%=rss.getString("DateOfIssue")%> </label><br>
                    <label>RT Office :<%=rss.getString("RtOffice")%> </label><br>
                    </td>
                    <td style="width: 400px;height: 400px"><img style="width: 100%;height: 100%;" src="../User/LicenseImages/<%=rss.getString("FImage")%>">
                    </td><td style="width: 400px;height: 400px"><img style="width: 100%;height: 100%;" src="../User/LicenseImages/<%=rss.getString("Bimag")%>">
                    </td></tr>
                    <%
                }
                %>
                <%
                 ResultSet rss1=obj.selectData("select * from tbl_rcbook  where UserId='"+UId+"'");
                while(rss1.next())
                {%>
                      <tr><th colspan="3">Rc Book Details</th></tr>
             <tr><td style="width: 400px;height: 400px">
                    <label>Chasis No :<%=rss1.getString("ChaseNo")%> </label><br>
                    <label>Vehicle No :<%=rss1.getString("VehicleNo")%>  </label><br>
                    <label>Engine No  :<%=rss1.getString("EngineNo")%> </label><br>
                    <label>Valid From - To :<%=rss1.getString("validFrom")%>-<%=rss1.getString("ValidTo")%> </label><br>
                    </td>
                    <td style="width: 400px;height: 400px"><img style="width: 100%;height: 100%;" src="../User/RcBook//<%=rss1.getString("Image")%>">
                    </td></tr>
            <%
                
                }
                %>
                
            </table>
                  
             
         </div>
    </body>
</html>
<%}
%>      