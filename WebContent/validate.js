		function state_change(){
		        var result = document.getElementById('name_select');
		                $.ajax({
		                    url : "test.do?sort="+document.getElementById("state_select").value ,// test.jsp 에서 받아옴
		                    dataType :"json", // 데이터타입을 json 으로 받아옴
		                    success : function(data) {
		                        result.innerHTML = data;
		                    },
		                    error : function(e) {
		                        result.innerHTML = e.responseText;
		                    }
		                });
		            
			if(document.getElementById("state_select").value=="장애"){
				document.getElementById("type_select").innerHTML= "<option value='요청'>요청</option>"
				+"<option value='진행'>진행</option>"
				+"<option value='완료'>완료</option>"
			}
			
			else if(document.getElementById("state_select").value=="percall"){
				document.getElementById("type_select").innerHTML= "<option value='방문'>방문</option>"
				+"<option value='원격'>원격</option>"
				+"<option value='유선'>유선</option>"
				+"<option value='메일'>메일</option>"
			}
			
			else if(document.getElementById("state_select").value=="정기점검"){
				document.getElementById("type_select").innerHTML= "<option value='매월점검'>매월점검</option>"
				+"<option value='분기점검'>분기점검</option>"
				+"<option value='원격점검'>원격점검</option>"
			}
			
			else if(document.getElementById("state_select").value=="구축"){
				document.getElementById("type_select").innerHTML= "<option value='신규'>신규</option>"
				+"<option value='추가'>추가</option>"
			}
		
		}	
		
		function companysel(){
	        var result = document.getElementById('company_select');
            $.ajax({
                url : "company_list_select.co",// test.jsp 에서 받아옴
                dataType :"json", // 데이터타입을 json 으로 받아옴
                success : function(data) {
                    result.innerHTML = data;
                },
                error : function(e) {
                    result.innerHTML = e.responseText;
                }
            });
			
		}
		
		function search_first_selete() {
			var category_select = document.getElementById("category_select").value;
			if(category_select == "cus_info"){
				document.getElementById("list_select").innerHTML = "<option value='0'></option>"
				+"<option value='name'>고객사 이름</option>"
				+"<option value='manager'>담당자</option>"
				+"<option value='phone'>담당자 전화번호</option>"
				+"<option value='email'>담당자 이메일</option>"
				+"<option value='address'>고객사 주소</option>";
													
			}else if(category_select == "Main_info"){
				document.getElementById("list_select").innerHTML = "<option value='0'></option>"
					+"<option value='go_date'>날짜</option>"
					+"<option value='sort'>구분</option>"
					+"<option value='type'>타입</option>"
					+"<option value='title'>작업 제목</option>"
					+"<option value='content'>작업 내용</option>"
					+"<option value='op'>작업자</option>"
					+"<option value='customer'>고객사 명</option>";
				
			}else{
				document.getElementById("list_select").innerHTML = null;
				
			}
		}
		
		function search_data_selete() {
			var list_select = document.getElementById("list_select").value;
			if(list_select == "go_date"){
				document.getElementById("input_group").innerHTML = "<input class='form-control' type='date' name='search_data'>"
				+"<span class='input-group-btn'>"
				+"<button type='submit'><i class='fa fa-search'></i></button>"
				+"</span>";
													
			}else if(list_select != "go_date"){
				document.getElementById("input_group").innerHTML = "<input class='form-control' placeholder='검색 할 내용을 적어주세요' type=text' name='search_data'>"
					+"<span class='input-group-btn'>"
					+"<button type='submit'><i class='fa fa-search'></i></button>"
					+"</span>";
			}else{
				document.getElementById("input_group").innerHTML = null;
				
			}
		}
		
		function del_state_change(){
	        var result = document.getElementById('name_select');
	                $.ajax({
	                    url : "test.do?sort="+document.getElementById("state_select").value ,// test.jsp 에서 받아옴
	                    dataType :"json", // 데이터타입을 json 으로 받아옴
	                    success : function(data) {
	                        result.innerHTML = data;
	                    },
	                    error : function(e) {
	                        result.innerHTML = e.responseText;
	                    }
	                });
	            
	}	