<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="ob"></jsp:useBean>

<%
    String status="";
    if(request.getParameter("btn_loginsubmit")!=null)
        
    {
        String s1="",s2="";
        s1=request.getParameter("txt_username");
        s2=request.getParameter("txt_password");
       ResultSet r= ob.selectData("select * from tbl_login where username='"+s1+"' and password='"+s2+"'");
       if(r.next())
       {
          // out.print("working");
           response.sendRedirect("http://localhost:8080/Matrimonial/Admin/District.jsp");
           
       }
       else
       {
          status="username or password Error !";
       }
    }
    %>

    <!-------JSP code-->

    <!-----------jsp code end here---->
<html>
<head>
<title>Matrimony > MalayalieMarriage > Register FREE!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!--CSS code-->
          <style type="text/css"> 
               body
               {
                   background:#ff0033 url("img/indianwedding.jpg") no-repeat center top;
                margin:0px; padding:0px; 
                font-size:12px; font-family:Arial; color:#363636;
               }
               .Malayali_campaignrightthree
                {
                 float:left;margin-left:35px;
                }
               
                .MalyaliMarriage_logo
                {
                 padding:10px 15px;
                 }
                 .clear
                   {
                   clear:both;
                    }
                    .Malyali_registerform_details
                      {
                       float:left;padding-top:0px;padding-left:0px;width:465px;background:#f4f4f4; /*margin-left: 37px; height: 666px;*/
                       }
                       .registerhead{font-family:Arial;font-size:24px;color:#ff000033;padding:20px 0px 10px 25px;}
	               .registerhead {text-decoration:uppercase;}
                       
        .memberloginnewthree{ float: right;
                 margin: 0;
                 padding-bottom: 7px;
                 padding-right: 25px;
                  padding-top: 25px;}
      .relative
          {
           position: relative;
           }
           .registration_form
           {
	    background: #f4f4f4;
	    height: 530px;
           }
           .bengali_innerregisterform_new
{
	padding:0px 29px 23px;
}
.regtxtbox { background: #fff none repeat scroll 0 0;
    border: 1px solid #e0e0e0;
    color: #777777;
    font: 12px arial;
    height: 27px;
    padding-left: 10px;
    width: 232px;
}
 .regtxtbox1 { background: #fff none repeat scroll 0 0;
    border: 1px solid #e0e0e0;
    color: #777777;
    font: 12px arial;
    height: 27px;
    padding-left: 10px;
    width: 145px;
}
.select-arw {
    position: relative;
    width: 232px;
     border: 1px solid #e0e0e0;
    color: #777777;
    font: 12px arial;
    height: 27px;
}
  .inputcon{border-left:0px;	border-right:0px;	border-top:0px;	border-bottom:1px solid #d7d7d7;width:245px;padding:3px 0px 7px 2px;color:#999999;font-size:13px;background:none;}         
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
	padding:5px 10px
}
.button {
  
 
 
  text-align: center;
 
 
  
  transition: all 0.5s;

  background: #f44336 none repeat scroll 0 0;
    border: medium none !important;
    border-radius: 2px;
    color: #FFFFFF;
    cursor: pointer;
    display: inline-block;
    font: 20px arial;
    margin: 0;
    outline: medium none;
    text-decoration: none;
	padding:5px 10px
}
.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
.bengali_campaigntopernew{ color: #949494;
    font-size: 11px;
    padding: 30px 0px;
    text-align: center;
	background:#333;
	}
        .bengali_campaignbottomernew{ color: #949494;
    font-size: 11px;
    padding: 30px 0px;
    text-align: center;
	background:#333;
        float: bottom;
	}
          </style>
          <!--CSS code end here-->
</head>
<body>
<div class="Malayali_campaignrightthree">
 
				    <div class="MalyaliMarriage_logo" style="float:left;"> 
					<span style="color: #FFFFFF;display: block;font-size: 11px;">MalayaliMarriage</span>

					<img src="img/Bride-and-groom-wedding-congratulations(2).png" alt="MalayaliMarriage" title="MalayaliMarriage" width="181" height="58" />

				    </div>
                                        <div  class="Malayali_campaignrightthree"
          style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Choose For Happy Marriages
                                        </div>
                                         <div class="clear">
                                         </div>

     
                                                 <div class="Malyali_registerform_details">
                                                              <div class="registerhead" style="float:left;color: #ff0033" >Register <span>FREE</span>
                                                              </div>
                                                         
                                                                <div style="float:right;">
                                                                        <div class="memberloginnewthree">
				                                        
					                                <div class="relative">
   
                                                                         </div> 
                                                                        </div>
                                                                </div>
                                                 
 
    
 						<!-- Register Form - Start -->
                                                
                                   
 <form class="Malyali_registerform_details" method="post" name="MatriForm" onsubmit="return validateForm();" style="margin:0px;">
	         
	             <table >
                         <tr><td><div class="bengali_innerregisterform_new">Profile For</div></td><td><div class="bengali_innerregisterform_new">
                                
                                     <select class="select-arw"><option>--select--</option>
                                          
                                   <option value="1">
                                       myself
                                   </option>
                                   <option value="5">
                                       son
                                   </option>
                                   <option value="7">
                                       Brother
                                   </option>
                                   <option value="8">
                                       sister
                                   </option>
                                   <option value="9">
                                       Friend
                                   </option>
                                     </select></div></td>
                         </tr>
                         <tr><td><div class="bengali_innerregisterform_new">Name</div></td><td><div class="bengali_innerregisterform_new"><input type="text" class="regtxtbox" placeholder="enter name" ></div></td>
                         </tr>
                         <tr><td><div class="bengali_innerregisterform_new">Gender</div></td><td><div class="bengali_innerregisterform_new"><input type="radio" name="gender" value="male" style="vertical-align:middle; display:inline; float:none; margin:0px 2px 0px 3px; _margin:0px 1px 0px 1px;">male<input type="radio" name="gender" value="female" style="vertical-align:middle; display:inline; float:none; margin:0px 2px 0px 3px; _margin:0px 1px 0px 1px;">female</div></td>
                         </tr>
                         <tr>
                             <td>
                                 <div class="bengali_innerregisterform_new">Date of Birth</div> </td><td><div class="bengali_innerregisterform_new"><SELECT NAME="DOBDAY" ID="DOBDAY" style="width:65px;border: 1px solid #e0e0e0; color: #777; cursor: pointer; display: inline-block; height: 28px;padding:0px 10px;" class="inputcon"><OPTION value="0" selected>--DD--</OPTION><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12" >12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option> <option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
                                     <SELECT NAME="DOBMonth" ID="dobmonth" style="width:65px;border: 1px solid #e0e0e0; color: #777; cursor: pointer; display: inline-block; height: 28px;padding:0px 10px;" class="inputcon"><OPTION value="0" selected>--MM--</OPTION><option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select>
                                     
                                     <SELECT NAME="DOByear" ID="dobyear" style="width:65px;border: 1px solid #e0e0e0; color: #777; cursor: pointer; display: inline-block; height: 28px;padding:0px 10px;" class="inputcon"><OPTION value="0">--YEAR--</OPTION><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option></SELECT></div></td>
                         </tr>
                         
                         <!--religion -->
                         <tr><td><div class="bengali_innerregisterform_new">Religion</div></td><td><div class="bengali_innerregisterform_new"><select class="select-arw" name="religionSel" ><option>--select--</option> <option>Christians</option>> </select></div></td>
                         </tr>
                         <!--cast/division-->
                         <tr><td><div class="bengali_innerregisterform_new">cast / division</div></td><td><div class="bengali_innerregisterform_new"><select class="select-arw" name="castsel"><option>--select--</option> <option>myself</option>></select></div></td>
                         </tr>
                         <!--Coutry living-->
                         <tr><td><div class="bengali_innerregisterform_new">Country Living</div></td><td><div class="bengali_innerregisterform_new"><select class="select-arw" name="CountrySel" style="-moz-appearance: none; background: #ffffff none repeat scroll 0 0; border: 1px solid #e0e0e0; color: #777; cursor: pointer; display: inline-block; padding-left: 10px;"><option value="0">Select Country living in</option><option value="98" style="color:#004F00">India</option><option value="222" style="color:#004F00">United States of America</option><option value="220" style="color:#004F00">United Arab Emirates</option><option value="221" style="color:#004F00">United Kingdom</option><option value="13" style="color:#004F00">Australia</option><option value="189" style="color:#004F00">Singapore</option><option value="39" style="color:#004F00">Canada</option><option value="173" style="color:#004F00">Qatar</option><option value="114" style="color:#004F00">Kuwait</option><option value="161" style="color:#004F00">Oman</option><option value="17" style="color:#004F00">Bahrain</option><option value="185" style="color:#004F00">Saudi Arabia</option><option value="129" style="color:#004F00">Malaysia</option><option value="80" style="color:#004F00">Germany</option><option value="153" style="color:#004F00">New Zealand</option><option value="73" style="color:#004F00">France</option><option value="102" style="color:#004F00">Ireland</option><option value="203" style="color:#004F00">Switzerland</option><option value="193" style="color:#004F00">South Africa</option><option value="195" style="color:#004F00">Sri Lanka</option><option value="99" style="color:#004F00">Indonesia</option><option value="149" style="color:#004F00">Nepal</option><option value="162" style="color:#004F00">Pakistan</option><option value="18" style="color:#004F00">Bangladesh</option><option value="1" style="color:#004F00">Afghanistan</option><option value="888" style="color:#004F00">Show more options</option> 
                          </select></div></td>
                         </tr>
                         <!--mobile n0-->
                        <tr><td><div class="bengali_innerregisterform_new">Phone No</div> </td>
                            <td><div class="bengali_innerregisterform_new"><select class="inputcon" name="Countrycode"  style="width: 81px;margin-right:10px;"><option selected="" value="0">Country</option><option value="98" style="color:#004F00">+91</option><option value="222" style="color:#004F00">+1</option><option value="220" style="color:#004F00">+971</option><option value="221" style="color:#004F00">+44</option><option value="13" style="color:#004F00">+61</option><option value="189" style="color:#004F00">+65</option><option value="39" style="color:#004F00">+1</option><option value="173" style="color:#004F00">+974</option><option value="114" style="color:#004F00">+965</option><option value="161" style="color:#004F00">+968</option><option value="17" style="color:#004F00">+973</option><option value="185" style="color:#004F00">+966</option><option value="129" style="color:#004F00">+60</option><option value="80" style="color:#004F00">+49</option><option value="153" style="color:#004F00">+64</option><option value="73" style="color:#004F00">+33</option><option value="102" style="color:#004F00">+353</option><option value="203" style="color:#004F00">+41</option><option value="193" style="color:#004F00">+27</option><option value="195" style="color:#004F00">+94</option><option value="99" style="color:#004F00">+62</option><option value="149" style="color:#004F00">+977</option><option value="162" style="color:#004F00">+92</option><option value="18" style="color:#004F00">+880</option><option value="1" style="color:#004F00">+93</option><option value="no" style="color:#004F00">Show more countries</option></select><input type="text" class="regtxtbox1" placeholder="Mobile No" maxlength="10" ></div></td>
                         </tr> 
                         <!--email-->
                         
                         <tr><td><div class="bengali_innerregisterform_new">E-Mail</div></td><td><div class="bengali_innerregisterform_new"><input type="text" class="regtxtbox" placeholder="enter Email" ></div></td>
                         </tr>
                         <!--password-->
                          <tr><td><div class="bengali_innerregisterform_new">Password</div></td><td><div class="bengali_innerregisterform_new"><input type="password" class="regtxtbox" placeholder="enter name" ></div></td>
                         </tr>
                         <tr><td><div class="bengali_innerregisterform_new"></div></td><td> <div class="bengali_innerregisterform_new"><button class="button" ><span>REGISTER FREE ! </span></button></div><br clear="all"></td>
                         </tr>
                     </table>
                                     <div class="bengali_campaignbottomernew">by choosing to continue you agree our<br><a href="#">Terms & Condition</a>and<a href="#">Privacy Policy</a></div>                              
               
          </form>
                                      
                                                                
                                                 </div>
                                     
                                     
</div>   
                                     
    <form method="POST">       <div class="bengali_campaigntopernew">Username  <input type="text" name="txt_username" placeholder="  username " style="width: 120px">   Password <input type="password" name="txt_password" placeholder=" password " style="width: 120px">   <input type="submit" name="btn_loginsubmit" value="Login" class="button"><br><span id="sp"><%=status%></span></div>
                                     </form>  
                                    
      
</body>
</html>