<%-- 
    Document   : Religion
    Created on : 15 Aug, 2017, 2:45:55 PM
    Author     : basilscolu
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String BodyType="",BodyTypeId="";
    if(request.getParameter("btn_submit")!=null)
    {
        String Bname=request.getParameter("txt_BodyType");
        if(!request.getParameter("hiddenid").equals(""))
        {
            int bid=Integer.parseInt(request.getParameter("hiddenid"));
            obb.executeCommand("update tbl_bodytype set Body_Type='"+Bname+"' where B_id='"+bid+"'");
        }
        else
        {
        obb.executeCommand("insert into tbl_bodytype(Body_Type) values('"+Bname+"')");
                }
        
    }
    if(request.getParameter("del")!=null)
    {
      int bid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_bodytype where B_id='"+bid+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String bid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_bodytype where B_id='"+bid1+"'");
       while(rs1.next())
       {
       BodyType=rs1.getString("Body_Type");
       BodyTypeId=rs1.getString("B_id");
       
    }
    }
   %> 
<html>
    <head>
        <style>
            body
               {
                 background:#d4d4d4 url("img/kerala_wedding_photography_06.jpg") no-repeat top right ;
                margin:0px; padding:0px; 
                font-size:12px; font-family:Arial; color:#363636;
               }
            .Malayali_campaignrightthree
                {
                 float:left;margin-left:35px;
                }
               
          .bengali_campaigntopernew{ color: #949494;
                                     
          font-size: 11px;
          padding: 50px 0px;
          text-align: center;
	  background:#333;
          }
          .bengali_campaignbottom{ color: #949494;
                                     
          font-size: 11px;
          padding: 50px 0px;
          text-align: center;
	  background:#333;
          float: bottom;
             position: fixed;
    bottom: 20px;
    
          }
                .MalyaliMarriage_logo1
                {
                 padding:10px 15px;
                 float: left;
                 
                 
                 
                 }
          .ReligionForm_details
                      {
                          float:left;padding-top:0px;padding-left:0px;width:600px;background:#f4f4f4; /*margin-left: 37px; height: 666px;*/
                       }
                       .registerhead{font-family:Arial;font-size:24px;color:#ff0033;padding:20px 0px 10px 25px;}
	               .registerhead {text-decoration:uppercase;}
                         
                         .religionlabel
                         {
                             font-size: 18px;
                             color: #333;
                         }
 .Religion_innerregisterform_new
{
	padding:0px 40px 23px;
}
.Religion_innerregisterform_table
{
	padding:10px 10px 20px;
}

.regtxtbox { background: #fff none repeat scroll 0 0;
    border: 1px solid #e0e0e0;
    color: #777777;
    font: 12px arial;
    height: 27px;
    padding-left: 10px;
    width: 260px;
}
.campaign_buttonnew {
background: #f44336 none repeat scroll 0 0;
    border: medium none !important;
    border-radius: 2px;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font: 20px arial;
    margin: 0;
    outline: medium none;
    text-decoration: none;
	padding:2px 40px
            
        
}
  .campaign_buttonnew.cancelbtn
  {
      background-color: #66ff66;
      padding:2px 40px
  }
  
  #myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 14px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
    background-color: #cccccc;
}
#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 90%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}
.button_link {
    background: #666666 none repeat scroll 0 0;
    border: medium none !important;
    border-radius: 1px;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font: 16px arial;
    margin: 0;
    outline: medium none;
    text-decoration: none;
	padding:1px 8px;
        border-style: ridge
            
            
        
}
.button_link.cancel
{
    background: #949494 none repeat scroll 0 0;
}

  
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Body Type page</title>
    </head>
    <body>
       
        <form class="Malayali_campaignrightthree">
            
            <input type="hidden" name="hiddenid" value="<%=BodyTypeId%>">
            
            
          
            <div class="MalyaliMarriage_logo1"><img src="img/Happyweddinglogo.jpg" alt="MalayaliMarriage" title="MalayaliMarriage" width="181" height="80"></div>
            <div class="Malayali_campaignrightthree" style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Choose For Happy Marriages
                                        </div>
            <div class="clear"></div>
            <div class="ReligionForm_details">
                <div class="registerhead"><label style="color: #ff0033">Body Type Entry</label></div>
                <table>
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Body Type</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_BodyType" placeholder="Enter Body Type" class="regtxtbox" value="<%=BodyType%>"></div></td>
                    </tr>
                    <tr><td></td><td><div class="Religion_innerregisterform_new" ><input type="submit" value="save" name="btn_submit" class="campaign_buttonnew">
                                  <input type="submit" value="Cancel" name="btn_cancel" class="campaign_buttonnew cancelbtn"> </div></td>
                </tr>
                </table>
                <!--table searching start here-->
                        <div class="Religion_innerregisterform_table " style="background-color: activeborder ;">  <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                         </div > 
               
                         
                
                 <div class="Religion_innerregisterform_table">
                    
                     <table id="myTable" >
                            
                             <tr class="header" >
                              <th style="width:60%;">Body Type</th>
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs=obb.selectData("select * from tbl_bodytype");
                             while(rs.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <%=rs.getString("Body_Type") %>
                                </td>
                               
                                <td>
                                    <a href="BodyType.jsp?edit=<%=rs.getString("B_id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="BodyType.jsp?del=<%=rs.getString("B_id")%>"><input type="button" class="button_link cancel" value="delete"></a>
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
    
</html>
