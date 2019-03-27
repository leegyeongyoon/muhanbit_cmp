<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.io.File"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4 {
   font-family: "Lato", sans-serif
}

.mySlides {
   display: none
}

.w3-tag, .fa {
   cursor: pointer
}

.w3-tag {
   height: 15px;
   width: 15px;
   padding: 0;
   margin-top: 6px
}

a {
   color: blue;
}
</style>
</head>
<body>
      <div class="w3-section" style="height: 100%;">
                <div class="w3-center">
                <div class="w3-center w3-padding-32" id="contact" style="margin-bottom: 3em; margin-top: 60px;">
                    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">데이터 엑셀 파일로 생성</span>
                </div>
         <% try{
            
        
            Process  exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\Maintenance_list.csv"});
                     exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\category_list.csv"});
                     
                Thread.sleep(1000);
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp",
                       "root", "muhanbit");
                 
                 String inventorystatesql = "select c.sort,c.title,l.customer,l.type,l.op,l.content,l.other,l.go_date  INTO  OUTFILE 'C:/Temp/Maintenance_list.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n'   from category_tbl AS c JOIN customer_list_tbl  AS l ON c.seq = l.fk_ca_seq ";
                 String inventorylistsql = "SELECT * INTO OUTFILE 'C:/Temp/category_list.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM category_tbl";
                
                
                 PreparedStatement pstmt = conn.prepareStatement(inventorystatesql);
                 pstmt.executeQuery();      
                 pstmt = conn.prepareStatement(inventorylistsql);
                 pstmt.executeQuery();
                
                             
                 pstmt.close();
                 conn.close();


                 
                 
                // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
                //String file1 = "C:/dump.txt"; // 파일 input에 지정한 이름을 가져옴
                // 그에 해당하는 실재 파일 이름을 가져옴
                String originalName[] ={"Maintenance_list.csv" , "category_list.csv" };
                String fileName[] ={"Maintenance_list.csv" , "category_list.csv" };  
                // 파일 타입 정보를 가져옴

                //File file1 = new File("C:/Temp/inventorystate.csv");
                //File file2 = new File("C:/Temp/inventorylist.csv");
                //File file3 = new File("C:/Temp/deliverlist.csv");
                  
        %>
        <table class="table" style="margin-bottom: 80px;">
            <thead>
              <tr>
                <th style="text-align: center;">엑셀 데이터 유형</th>
                <th style="text-align: center;">파일 다운로드</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>유지보수 현황 리스트</td>
                <td><a id="down1" href="#"><%=originalName[0]%></a></td>
              </tr>
              
            
            </tbody>
          </table> 
        
       
    </div>
    </div>
    </div>
	<% 
         
    }    
         catch(Exception e){
             e.printStackTrace(); 
         }   
  %>  
</body>
</html>


             
         
         






