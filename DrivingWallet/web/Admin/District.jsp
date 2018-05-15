<%-- 
    Document   : Religion
    Created on : 15 Aug, 2017, 2:45:55 PM
    Author     : basilscolu
--%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<%
    String DistrictName="",stateId="",District_id="";
    if(request.getParameter("btn_submit")!=null)
    {
        String Dname=request.getParameter("txt_District");
      
        if(!request.getParameter("hiddenid").equals(""))
        {
            
            
           int did=Integer.parseInt(request.getParameter("hiddenid"));
          
           String qq="update tbl_district set district='"+Dname+"'  where district_id="+did;
           obb.executeCommand(qq);
      }
        else
       {
        
        obb.executeCommand("insert into tbl_district(district) values('"+Dname+"')");
          }
        
    }
    if(request.getParameter("del")!=null)
    {
      int did2=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_district where district_id='"+did2+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String did1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_district where district_id='"+did1+"'");
       while(rs1.next())
       {
       DistrictName=rs1.getString("district");
       
       District_id=rs1.getString("district_id");
       
    }
    }
   %> 
<html>
    <head>
       <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css">
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Religion page</title>
    </head>
    <body>
       
        <form class="Malayali_campaignrightthree">
            
            <input type="hidden" name="hiddenid" value="<%=District_id%>">
            
            
           <table>
                  
                
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">District / City</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_District" placeholder="Enter District / City" class="regtxtbox" value="<%=DistrictName%>"></div></td>
                    </tr>
                    <tr><td></td><td><div class="Religion_innerregisterform_new" ><input type="submit" value="save" name="btn_submit" class="campaign_buttonnew">
                                  <input type="submit" value="Cancel" name="btn_cancel" class="campaign_buttonnew cancelbtn"> </div></td>
                </tr>
                </table>
                <!--table searching start here-->
                        <div class="" style="background-color: activeborder ;">  <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                         </div >
               
                         
                
                 <div class="Religion_innerregisterform_table">
                    
                     <table id="myTable" >
                            
                             <tr class="header" >
                             
                              <th style="width:60%;">District/city</th>
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs1=obb.selectData("select * from tbl_district");
                             while(rs1.next())
                             {
                           
                             %>
                             <tr>
                                
                               <td>
                                   <b> <%=rs1.getString("district") %></b>
                               </td>
                                <td>
                                    <a href="District.jsp?edit=<%=rs1.getString("district_id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="District.jsp?del=<%=rs1.getString("district_id")%>"><input type="button" class="button_link cancel" value="delete"></a>
                                </td>
                                   
                            </tr>
                             
                            <% 
                             }
                            
                            %>  
                               
                        </table>
                </div>
                                        <!--table searching end here-->

            </div>
            
                     
        </form>
         <div class="bengali_campaigntopernew"></div>
                         <div class="bengali_campaignbottom"></div> 

         
    </body>
    <!--script--->
   
    
</html>
