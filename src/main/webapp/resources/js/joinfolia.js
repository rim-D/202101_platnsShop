const joinfolia = {};

// 날짜 포맷
joinfolia.DateFormatter = value => {
	let date = value;
	
	const yyyy = date.substring(0, 4);
	const mm = date.substring(4, 6);
	const dd = date.substring(6, 8);
	
	return yyyy + '/' + mm + '/' + dd;
};

// 상품 리스트 출력
joinfolia.getGoodsList = (path, g_l_code, num, name) => {

	let url = path+ "/goods/goodsList?g_l_code=" + g_l_code + "&order_num=" + num;
	
	if(typeof name != "undefined")
		url += "&name=" + name;
	
		console.log(url);
	
	$.ajax({
		type: "get",
		url: url,
		success: function(result){
			document.querySelector(".goods_list_box").innerHTML = result;
			document.querySelector(".goods_count").innerText = "상품 " + document.getElementById("goodsCount").value + "개";
		}
	});

};




