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
    String StateName="",stateId="",country_id="";
    if(request.getParameter("btn_submit")!=null)
    {
        String cname=request.getParameter("txt_state");
        String countryid=request.getParameter("selCountry");
        if(!request.getParameter("hiddenid").equals(""))
        {
            
            
           int sid=Integer.parseInt(request.getParameter("hiddenid"));
           out.print(sid);
           out.print(cname);
           out.print(countryid);
           String qq="update tbl_state set state_name='"+cname+"' and c_id='"+countryid+"' where state_id="+sid;
           obb.executeCommand(qq);
      }
        else
       {
        
        obb.executeCommand("insert into tbl_state(state_name,c_id) values('"+cname+"','"+countryid+"')");
          }
        
    }
    if(request.getParameter("del")!=null)
    {
      int sid2=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_state where state_id='"+sid2+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String sid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_state where state_id='"+sid1+"'");
       while(rs1.next())
       {
       StateName=rs1.getString("state_name");
       stateId=rs1.getString("state_id");
       country_id=rs1.getString("c_id");
       
    }
    }
   %> 
<html>
    <head>
        <style>
            body
               {
                 background:#d4d4d4 url("img/kerala_wedding_photography_06.jpg")  top right ;
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
  padding: 12px 12px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 0px;
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
        <title>Religion page</title>
    </head>
    <body>
       
        <form class="Malayali_campaignrightthree">
            
            <input type="hidden" name="hiddenid" value="<%=stateId%>">
            
            
          
            <div class="MalyaliMarriage_logo1"><img src="img/Happyweddinglogo.jpg" alt="Happy Wedding" title="Happy Wedding" width="120" height="80"></div>
            <div class="Malayali_campaignrightthree" style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Choose For Happy Marriages
                                        </div>
            <div class="clear"></div>
            <div class="ReligionForm_details">
                <div class="registerhead"><label style="color: #ff0033">State Entry</label></div>
                <table>
                    <tr>
                        <td>
                              <div class="Religion_innerregisterform_new" ><label class="religionlabel">Country</label></div>
                        </td>
                       
                        <td><div class="Religion_innerregisterform_new"><select name="selCountry" class="regtxtbox" ><option>--selected--</option>
                            
                                     <%
                       ResultSet rs=obb.selectData("select * from tbl_country");
                       while(rs.next())
                       {
                        %>
                        <option value="<%=rs.getString("c_id")%>"  <%if(rs.getString("c_id").equals(country_id)){%> selected="true" <% } %> ><%=rs.getString("country")%></option>
                                <%
                                    }
                                    %> </select></div>
                                    </td>
                                   
                    </tr>
                
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">State</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_state" placeholder="Enter State" class="regtxtbox" value="<%=StateName%>"></div></td>
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
                              <th style="width:60%;">Country</th>
                              <th style="width:60%;">State</th>
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs1=obb.selectData("select * from tbl_state s, tbl_country c where s.c_id=c.c_id order by c.c_id asc");
                             while(rs1.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <b> <%=rs1.getString("state_name") %></b>
                                </td>
                               <td>
                                   <b> <%=rs1.getString("country") %></b>
                               </td>
                                <td>
                                    <a href="State.jsp?edit=<%=rs1.getString("state_id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="State.jsp?del=<%=rs1.getString("state_id")%>"><input type="button" class="button_link cancel" value="delete"></a>
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
    <script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
    
</html>
