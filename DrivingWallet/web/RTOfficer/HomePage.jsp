

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    
        
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Qr Driving Wallet</title>
        
        
        <link href="../User/UserCss/HomePageCss.css" rel="stylesheet" type="text/css">
        
        
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
                                 <a href="ReceivedApplication.jsp" ><label class="regcheck"> Application Received</label></a>
                             </td>
                              <td>
                                  <a href="" >  <label class="regcheck" >MY QR Codes</label></a>
                             </td>
                            
                              <td>
                                 <a href="" >  <label class="regcheck"  >Notification</label>
                             </td>
                              
                         </tr>
                     </table>
                 </div>
         </div>
    </body>
</html>
        