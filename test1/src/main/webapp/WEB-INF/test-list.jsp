<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>테스트 샘플 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<input type="text" placeholder="1~15 입력 pk값"  v-model=productNo>
		<button @click="fnGetList"  style="margin-left : 20px;">검색</button>
		<div>제품번호 : {{list.productName}}</div>
		<div>제품명 : {{list.productNo}}</div>
		<div>제품가격 : {{list.productPrice}}</div>
		<div>
			<button style="margin-left : 20px;" @click="fnGo(list.productNo)">수정</button>
			<button style="margin-left : 20px;" @click="fnDelte">삭제</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo : "",
				list : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {productNo : self.productNo};
				$.ajax({
					url:"test.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.list);
						self.list=data.list;
						
						
					}
				});
            },
			fnDelte(){
				var self = this;
				var nparmap = {productNo : self.productNo};
				$.ajax({
					url:"delete.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert('삭제됨');
						location.href="/test.do";
					}
				});
			          },
			  fnGo(productNo){
				var url = "/test-insert.do?productNo="+productNo;
				location.href=url;
			  }
        },
        mounted() {
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>
​