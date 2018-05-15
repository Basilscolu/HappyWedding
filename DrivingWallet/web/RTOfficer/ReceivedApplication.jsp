

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
 String s="select * from tbl_rtofficer rt where rt.RtoId='"+session.getAttribute("RTO").toString()+"'";
    ResultSet rrr=obj.selectData("select * from tbl_rtofficer rt where rt.RtoId='"+session.getAttribute("RTO").toString()+"'");
    while(rrr.next())
    {
        
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application Received</title>
        
        
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
                                 <a href="Homepage.jsp" id="HomeLink"> <label class="regcheck" >Home</label></a>
                             </td>
                             <td>
                                 <a href="" ><label class="regcheck" style="background: #ff0033"> Application Received</label></a>
                             </td>
                              <td>
                                  <a href="" >  <label class="regcheck" >MY QR Codes</label></a>
                             </td>
                            
                              <td>
                                 <a href="" >  <label class="regcheck"  >Notification </label>
                             </td>
                              
                         </tr>
                     </table>
                 </div>
         </div>
        
        <br>
        
         <table id="myTable" >
                            
     
                  <tr>
                      <td style="background: white;color: red;font-size: 30px; ">
                                  Application Details
                              </td>
         </tr>            
                             
             <% 
        ResultSet rs1=obj.selectData("select * from tbl_qrapplication qr, tbl_userregistration us,tbl_license ll where qr.UserId=us.UserId and  ll.UserId=qr.UserId and qr.AcceptOrReject='Not Yet'  and ll.RtOfficeId='"+rrr.getString("id")+"'");
                            
           //   s="select * from tbl_qrapplication qr, tbl_userregistration us,tbl_license ll where qr.UserId=us.UserId and  ll.UserId=qr.UserId  and ll.DistrictId='"+rrr.getString("DistrictId")+"' and ll.RtOfficeId='"+rrr.getString("id")+"'";
             
             while(rs1.next())
                             {
                           
                             %>
                            <tr>
                                   <td >
                                     <img class="imageIcon" src="../User/ProfilePic/<%=rs1.getString("Image")%>"  title ="<%=rs1.getString("Name")%>"> 
                                
                                     <%=rs1.getString("Name") %> Applied For An QR Application Application NO : <%=rs1.getString("Application_No") %>
                                   
                                     <a href="Application Details.jsp?ApplId=<%=rs1.getString("Application_No") %>" style="color: red">View</a>
                                   </td>
                                
                             
                                
                                 </tr>
                             
                            <% 
                             }
    }
                            %>  
                             
                        </table>
       
    </body>
</html>
        