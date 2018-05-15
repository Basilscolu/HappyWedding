
<%@page import="java.io.File"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<jsp:useBean class="qr.QRCode" id="q">
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%
  String RtoId=session.getAttribute("RTO").toString();
  String rto="",RtoOffice="",Regno="";
  ResultSet rsq=obj.selectData("select * from tbl_rtofficer of,tbl_rtoffice rt where of.RtoId='"+RtoId+"' and rt.id=of.Rtoffice");
  while(rsq.next())
  {
      rto=rsq.getString("username");
      RtoOffice=rsq.getString("RtOffice");
     Regno=rsq.getString("RegNo");
      
  }
   String AppnId=request.getParameter("ApplId");
   String Uid="";String  unam="";
    ResultSet rs=obj.selectData("select * from tbl_qrapplication qr where qr.Application_No='"+AppnId+"'");
    while(rs.next())
    {
       Uid=rs.getString("UserId");

    }
    ResultSet qq=obj.selectData("select * from tbl_userregistration us where us.UserId='"+request.getParameter("Uid")+"'");
    while(qq.next())
    {
        unam=qq.getString("Name");
        
    }
    
    if(request.getParameter("btn_Rsave")!=null)
    {
        obj.executeCommand("UPDATE tbl_qrapplication qr set qr.AcceptOrReject='reject' where qr.Application_No='"+request.getParameter("AppnId")+"'");
        String Not="Your Application Id :"+request.getParameter("AppnId")+" is Rejected Because Of :"+request.getParameter("txt_reason");
        obj.executeCommand("insert into tbl_notification (Notification,date,UserId,rtoId) VALUES('"+Not+"',curdate(),'"+request.getParameter("Uid")+"','"+request.getParameter("AppnId")+"')");
  response.sendRedirect("HomePage.jsp");
    }
     if(request.getParameter("btn_Asave")!=null)
    {
        String code="Qr Genersted By RtOfficer :"+rto+" Office :"+RtoOffice +" Office Regno :"+Regno+" for UserId="+request.getParameter("Uid")+","+unam
                +"Link :http://localhost:8080/DrivingWallet/Officer/SearchResult.jsp?Uid="+request.getParameter("Uid");
      
      
                Random r=new Random();
               int x= r.nextInt(999+1111);
                String name="QR_"+x;
		String filePath = "F:\\MyWorks\\exam cell\\DrivingWallet\\web\\qrcodes\\"+name+".png";
		int size = 125;
		String fileType = "png";
		File qrFile = new File(filePath);
		q.createQRImage(qrFile, code, size, fileType);  
              boolean b1= obj.executeCommand("insert into tbl_qrcodes (UserId,QrCodes) VALUES('"+request.getParameter("Uid")+"','"+name+"')");
               obj.executeCommand("insert into tbl_licensevalidity (UserId,LicenseNo,ValidityFrom,ValidityTo)"
                       + " VALUES('"+request.getParameter("Uid")+"','"+request.getParameter("lNO")+"','"+request.getParameter("LvalidFrom")+"','"+request.getParameter("LvalidTo")+"')");
              obj.executeCommand("insert into tbl_rcbookvalidity (UserId,RcValidityfROM,RcValiditytO)"
                      + " VALUES('"+request.getParameter("Uid")+"','"+request.getParameter("rcvalF")+"','"+request.getParameter("rcvalT")+"')");
              
               obj.executeCommand("UPDATE tbl_qrapplication qr set qr.AcceptOrReject='Accept' where qr.Application_No='"+request.getParameter("AppnId")+"'");
        String Not="Your Application Id :"+request.getParameter("AppnId")+" is Accepted and your Qr code Is Genereted";
        obj.executeCommand("insert into tbl_notification (Notification,date,UserId,rtoId) VALUES('"+Not+"',curdate(),'"+request.getParameter("Uid")+"','"+request.getParameter("AppnId")+"')");
       
  response.sendRedirect("HomePage.jsp");
    }
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applicatio Details</title>
        <style>
             .modalAboutMe {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
   // padding-top: 100px; /* Location of the box */
   // left: 0; 
   // top: 0;
  // margin-top: 200px;
  // margin-left: 400px;
    width: 800px; /* Full width */
    height: 600px; /* Full height */
   // overflow: auto; /* Enable scroll if needed */
   // background-color: rgb(0,0,0); /* Fallback color */
  //  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
   border: solid;
   border-radius: 10px;
   overflow: scroll;
   overflow-x: hidden;
   background: #FFFFFF;
}
 .close {
   position: absolute;
    top: 0px;
    right: 5px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}
 
        </style>
    </head>
    <body>
        <form> 
            <input type="hidden" name="AppnId" value="<%=AppnId%>">
            <input type="hidden" name="Uid" value="<%=Uid%>">
              <div class="modalAboutMe"  id="modalNotification"  >
                   <table id="myTable1"  >
                         <tr>
                             <th > <span>Reason For Rejection Applictaion</span> <label style="padding-left: 500px; cursor: pointer;font-size: 20px;" id="NotificationClose"> &times;</label> </th>
                         </tr>
                         <tr>
                         <td><label>Reason :</label><textarea name="txt_reason"></textarea></td>
                         </tr>
                         <tr><td>  <input type="submit" value="Save" name="btn_Rsave" style="background:  red" ></td></tr>
                   </table>
                  
              </div>
               <div class="modalAboutMe"  id="AcceptModel"  >
                   <table id="myTable1"  >
                      
                    <%
                ResultSet rss2=obj.selectData("select * from tbl_license ll, tbl_rtoffice rt where ll.RtOfficeId=rt.id and UserId='"+Uid+"'");
                while(rss2.next())
                {
                    %>
                     <tr><th>License </th></tr>
                   <tr> <td><label>Valid From-To :</label>
                   
                   <input type="date" value="<%=rss2.getString("validityFrom")%>" name="LvalidFrom"> - <input type="date" value="<%=rss2.getString("ValidityTo")%>" name="LvalidTo"></td> <br></tr>
                   <tr><td><label>License No :</label><input type="text" value="<%=rss2.getString("LicenseNo")%>" name="lNO"> </td></tr>
                   <tr><td> <label>Date Of Issue  :<%=rss2.getString("DateOfIssue")%> </label></td></tr><br>
                   <tr><td>  <label>RT Office :<%=rss2.getString("RtOffice")%> </label></td></tr>
                       <%
                       
                }
                       %>
                    <%
                 ResultSet rss3=obj.selectData("select * from tbl_rcbook  where UserId='"+Uid+"'");
                while(rss3.next())
                {%>
                      <tr><th colspan="3">Rc Book Details</th></tr>
             <tr><td>
             <label>Chasis No :<%=rss3.getString("ChaseNo")%> </label></td></tr>
                   <tr><td>   <label>Vehicle No :<%=rss3.getString("VehicleNo")%>  </label></td></tr>
                   <tr><td>  <label>Engine No  :<%=rss3.getString("EngineNo")%> </label><br>
                   <tr><td>  <label>Valid From - To :</label><input type="date" value="<%=rss3.getString("validFrom")%>" name="rcvalF">- <input type="date" value="<%=rss3.getString("ValidTo")%>" name="rcvalT">
                   </td></tr>
                   
            <%
                
                }
                %>
                     <tr><th colspan="3">Application Validity</th></tr>
                <tr><td>  <label>Qr Code Valid From - To :</label><input type="date" value="">-<input type="date" value=""></td>
                </tr>
                         <tr><td>  <input type="submit" value="Save and generate user Qr codes!" name="btn_Asave" style="background:  red" ></td></tr>
                   </table>
                  
              </div>
            <table>
                <%
                ResultSet rss=obj.selectData("select * from tbl_license ll, tbl_rtoffice rt where ll.RtOfficeId=rt.id and UserId='"+Uid+"'");
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
                 ResultSet rss1=obj.selectData("select * from tbl_rcbook  where UserId='"+Uid+"'");
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
            <table>
            <tr>
            <input type="button" value="Accept" name="btn_accept" id="NotificationView1">
             <input type="button" value="Reject" name="btn_reject" id="NotificationView">
            </tr>
            
        </table>
            
        </form>
    </body>
    <script>
        
var NotificationLabel = document.getElementById("NotificationView");
NotificationLabel.onclick = function(){
 
modalNotification.style.display = "block";
 var spanNotification = document.getElementById("NotificationClose");
     NotificationLabel.style="background:red";


// When the user clicks on <span> (x), close the modal
spanNotification.onclick = function() { 
    modalNotification.style.display = "none";
         NotificationLabel.style="background:none";

} 
}
       
var NotificationLabel1 = document.getElementById("NotificationView1");
NotificationLabel1.onclick = function(){
 
AcceptModel.style.display = "block";
 var spanNotification = document.getElementById("NotificationClose");
     NotificationLabel1.style="background:red";


// When the user clicks on <span> (x), close the modal
spanNotification.onclick = function() { 
    AcceptModel.style.display = "none";
         NotificationLabel1.style="background:none";

} 
}
    </script>
</html>
