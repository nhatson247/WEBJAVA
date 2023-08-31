const $ = document.querySelector.bind(document) //goi 1 lop
const $$ = document.querySelectorAll.bind(document) // goi nhieu lop

//1. scrolltop
var scrollTop = function() {
	var header = $('.header')
	header.scrollIntoView({ behavior: "smooth", block: "start" }
	)
}

var scrollBtn = $('.scroll-top')
scrollBtn.addEventListener("click", scrollTop)
window.addEventListener("scroll", scrollBtnDisplay)

function scrollBtnDisplay() {
	if (
		document.body.scrollTop > 200 ||
		document.documentElement.scrollTop > 200 // khi mà cái kéo của mình quá 200px thì hz sẽ hiện 
	) {
		scrollBtn.style.display = "block" // hiện 
	}
	else {
		scrollBtn.style.display = "none" // ko hiện

	}
}

//2 
document.addEventListener('DOMContentLoaded', function() {
	// Lấy danh sách tất cả các phần tử có lớp 'price-range'
	const priceRangeLinks = document.querySelectorAll('.price-range');

	// Gắn sự kiện click cho từng phần tử khoảng giá
	priceRangeLinks.forEach(link => {
		link.addEventListener('click', function(event) {
			event.preventDefault();
			const minPrice = link.getAttribute('data-min');
			const maxPrice = link.getAttribute('data-max');

			// Chuyển hướng đến trang tìm kiếm với tham số khoảng giá
			window.location.href = 'giayController?minPrice=' + minPrice + '&maxPrice=' + maxPrice;
		});
	});
});

// size
function submitForm(selectedSize) {
	// Lấy biểu mẫu bằng ID
	var form = document.getElementById("sizeForm");

	// Tạo một thẻ input ẩn để gửi giá trị kích thước đã chọn
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "size");
	input.setAttribute("value", selectedSize);

	// Thêm thẻ input vào biểu mẫu
	form.appendChild(input);

	// Gửi biểu mẫu tự động sau khi thêm thẻ input ẩn
	form.submit();
}
// price 
function sortByPrice() {
	var sortOption = document.getElementById("sortOption").value;
	var form = document.getElementById("sortForm");
	form.action = "giayController?sort=" + sortOption;
	form.submit();
}