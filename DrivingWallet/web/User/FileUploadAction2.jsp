
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

<%
    
     
       String UId=session.getAttribute("userId").toString();
     
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
           
                     
                            System.out.println(field_name);
                            String ext=file_name.substring(file_name.lastIndexOf("."));
//setting path to store image
                            File proj_path=new File(config.getServletContext().getRealPath("/"));
                            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\User\\RcBook\\";
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
                      
//}
//}
   
                    }
           
                
           String RtoId="" ;    
       ResultSet rrrr=obj.selectData("select * from tbl_license ll where ll.UserId='"+UId+"'");
       if(rrrr.next())
       {
           RtoId=rrrr.getString("RtOfficeId");
       }
 Boolean bb=obj.executeCommand("insert into tbl_rcbook (UserId,Image,VehicleNo,ChaseNo,EngineNo,validFrom,validTo) VALUES('"+UId+"','"+fn+"','"+value[0]+"','"+value[1]+"','"+value[2]+"',,'"+value[3]+"',,'"+value[4]+"')");
    
                
                    if(bb==true)
                   {
                        Random rand = new Random();
       int n = rand.nextInt(90000) + 10000;
       String Applno="Appln"+n;
                  obj.executeCommand("insert into tbl_qrapplication (UserId,Application_No,application_date,RtOffice) VALUES('"+UId+"','"+Applno+"',CURDATE(),'"+RtoId+"')");
                 
                  response.sendRedirect("Homepage.jsp?");
                    } 
                }
          
    
                    %>