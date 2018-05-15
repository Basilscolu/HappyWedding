
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

<%
    
      Random rand = new Random();
       int n = rand.nextInt(90000) + 10000;
       String UId="UseR"+n;
     session.setAttribute("userId", UId);
 String field_name="";
            FileItem f_item=null;
            String file_name="";
            File savedFile=null;
            String fn="";
            String fn1="";
            String e= "";
            
            //String usid=session.getAttribute("loginIdU").toString();
          //  String famid=session.getAttribute("loginIdF").toString();

            String field[] = new String[30];
            String value[]=new String[30];
            //String famid=session.getAttribute("loginNameF").toString();
            
//checking if request cotains multipart data
            boolean isMultipart=ServletFileUpload.isMultipartContent(request);

            if(isMultipart)
            {
                FileItemFactory factory=new DiskFileItemFactory();
                ServletFileUpload upload=new ServletFileUpload(factory);

//declaring a list of form fields
                
                List items_list=null;

//assigning fields to list 'items_list'
                try
                {
                    items_list=upload.parseRequest(request);
                }
                catch(FileUploadException ex)
                {
                    out.println(ex);
                }

//declaring iterator
                Iterator itr=items_list.iterator();
                int k=0;
//iterating through the list 'items_list'
                while(itr.hasNext())
                {
//typecasting next element in items_list as fileitem
                    f_item=(FileItem)itr.next();

//checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if(f_item.isFormField())
                    {
          
//getting fieldname and value
                        field[k]=f_item.getFieldName();
                        value[k]=f_item.getString();
                        System.out.println(k+" "+field[k]+" "+value[k]);
                        k++;
                    }
                    else
                    {
//f_item=(FileItem)itr.next();
           
                        file_name=f_item.getName();
                        field_name=f_item.getFieldName();
//System.out.println("file "+file_name);
//if(file_name!=null && !file_name.equals("")){
           
                       if(field_name.equals("mpho"))
                        
                        {
                            System.out.println(field_name);
                            String ext=file_name.substring(file_name.lastIndexOf("."));
//setting path to store image
                            File proj_path=new File(config.getServletContext().getRealPath("/"));
                            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\User\\Images\\";
                            Random r=new Random();
                            int r_num=r.nextInt(1111)+999;
                            fn="IMG_"+r_num+ext;
                            System.out.println(fn);
//creating a file object
                            savedFile=new File(file_path+fn);
                            try
                            {
//writing the file object
                                f_item.write(savedFile);               
                
                            }
                            catch(Exception ex)
                            {
                                out.println(ex);
                            }
                        }
                       if(field_name.equals("Muser"))
                        {
                            System.out.println(field_name);
                            String ext=file_name.substring(file_name.lastIndexOf("."));
//setting path to store image
                            File proj_path=new File(config.getServletContext().getRealPath("/"));
                            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\Web\\User\\ProfilePic\\";
                            Random r=new Random();
                            int r_num=r.nextInt(1111)+999;
                            fn1="IMG_"+r_num+ext;
                            System.out.println(fn1);
//creating a file object
                            savedFile=new File(file_path+fn1);
                            try
                            {
//writing the file object
                                f_item.write(savedFile);               
                
                            }
                            catch(Exception ex)
                            {
                                out.println(ex);
                            }
                        }
                      
//}
//}
   
                    }
           
                }
                
                
                 Boolean bb=obj.executeCommand("insert into tbl_userregistration (UserId,Email,PhoneNo,Name,Address,Dob,Adhar_no,Password,Pincode,Gender,ChatId)"
             + " VALUES('"+UId+"','"+value[1]+"','"+value[2]+"',"
             + "'"+value[0]+"','"+value[4]+"',"
             + "'"+value[6]+"','"+value[7]+"','"+value[8]+"','"+value[5]+"','"+value[3]+"','"+value[0]+n+"')");

      
                out.print("update tbl_userregistration  set AdhaarImage='"+fn+"' and Image='"+fn1+"' where UserId='"+UId+"'");
                obj.executeCommand("update tbl_userregistration  set Image='"+fn1+"'  where UserId='"+UId+"'");
               boolean b1=obj.executeCommand("update tbl_userregistration  set AdhaarImage='"+fn+"'  where UserId='"+UId+"'") ;
                    if(b1==true)
                   {
                  
                  response.sendRedirect("Homepage.jsp");
                    } 
                }
          
    
                    %>