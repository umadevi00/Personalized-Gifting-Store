<%@page import="gifts.Product"%>
<%@page import="java.util.List"%>
<%@page import="gifts.Springsql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GiftsGalore</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
  body {
      font-family: 'Arial', sans-serif;
      background-color: #e5f8fd;
    }

    .navbar-brand {
      font-size: 1.8rem;
      font-style: italic;
      font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
      font-weight: bold;
      color: rgb(65, 28, 133);
    }
    @keyframes typing {
      from { width: 0; }
      to { width: 100%; }
    }
    .typing-effect {
      border-right: .1em solid #000;
      white-space: nowrap;
      overflow: hidden;
      animation: typing 3s steps(30, end) infinite;
    }
    .highlight-on-hover {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .highlight-on-hover:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .card:hover .card-body,
    .card:hover .card-title,
    .card:hover .card-text {
      color: #0056b3;
      transition: color 0.3s ease;
    }
    .filter-sort {
      display: flex;
      justify-content: space-around;
      margin-bottom: 20px;
    }
    .filter-sort select,
    .filter-sort input {
      margin-right: 10px;
    }
    .sidebar {
      background-color: #333;
      color: #fff;
      padding: 15px;
    }
    .sidebar a {
      color: #fff;
      text-decoration: none;
    }
    .sidebar .menu-header {
      font-weight: bold;
      margin-top: 10px;
      margin-bottom: 5px;
    }
    .sidebar .menu-item {
      margin-left: 15px;
      margin-bottom: 10px;
    }
    .nav-item .nav-link {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .nav-item .nav-link .fas {
      font-size: 1.5em;
      margin-bottom: 4px;
    }
    #popularSearches {
	  border: 1px solid #ddd;
	  border-top: none;
	  max-height: 300px;
	  overflow-y: auto;
	}
	
	#popularSearches a:hover {
	  background-color: #f8f9fa;
	  text-decoration: none;
	}
	.navbar-main {
	  background-image: url('https://static.vecteezy.com/system/resources/previews/008/947/265/non_2x/colorful-pastel-watercolor-abstract-background-free-vector.jpg');
	  background-size: cover;
	  background-repeat: no-repeat;
	  width: 100%;
	}
	
	.navbar-main .nav-link {
	  color: #111111;
	  width: max-content;
	  height: 0vmax;
	}
	
	.navbar-main .nav-link:hover {
	  color:  #e4e0e0;
	}
	
	.navbar-occasions {
	  background-color: #b171e6;
	  width: 100%;
	  margin: 0 auto;
	}
	
	.navbar-occasions .nav-link {
	  color:  #dacccc;
	}
	
	.navbar-occasions .nav-link:hover {
	  color: #0e0e0;
	}
	
	.navbar-main .nav-link .fas {
	  color: #111111;
	}
.nav {
	  position: fixed;
	  right: 20px;
	  top: 350px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  width: 75px;
	  height: 75px;
	  border-radius: 50%;
	  background: #343a40;
	  box-shadow: rgb(50 50 93 / 10%) 0 30px 60px -12px,
	    rgb(0 0 0 / 15%) 0 18px 36px -18px;
	  z-index: 1000;
	}
	
	.nav [type="checkbox"] {
	  position: absolute;
	  left: -9999px;
	}
	
	.nav [type="checkbox"] + label {
	  position: relative;
	  width: 75px;
	  height: 75px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  font-size: 16px;
	  cursor: pointer;
	  z-index: 1;
	  background: #343a40;
	  border-radius: 50%;
	  color: white;
	  transition: all 0.2s;
	}
	
	.nav [type="checkbox"] + label:hover {
	  background: #23272b;
	}
	
	.menu {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  pointer-events: none;
	}
	
	.menu li {
	  position: absolute;
	  top: 0;
	  left: 50%;
	  transform: translateX(-50%);
	  transition: all 0.4s;
	  opacity: 0;
	}
	
	.nav input:checked ~ .menu li {
	  opacity: 1;
	  pointer-events: auto;
	}
	
	.nav input:checked ~ .menu li:nth-child(1) { top: -210px; transition-delay: 0.1s; }
	.nav input:checked ~ .menu li:nth-child(2) { top: -160px; transition-delay: 0.2s; }
	.nav input:checked ~ .menu li:nth-child(3) { top: -110px; transition-delay: 0.3s; }
	.nav input:checked ~ .menu li:nth-child(4) { top: -60px; transition-delay: 0.4s; }
	.nav input:checked ~ .menu li:nth-child(5) { top: -10px; transition-delay: 0.5s; }
	
	.menu li a {
	  width: 50px;
	  height: 50px;
	  border-radius: 50%;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  background: #343a40;
	  color: white;
	}
	
	.menu li a span {
	  position: absolute;
	  right: 100%;
	  top: 50%;
	  transform: translateY(-50%);
	  font-size: 13px;
	  white-space: nowrap;
	  pointer-events: none;
	  opacity: 0;
	  transition: opacity 0.3s;
	  color: white;
	  font-weight: bold;
	  background: #343a40;
	  padding: 5px 10px;
	  border-radius: 5px;
	  margin-right: 10px;
	}
	
	.nav input:checked ~ .menu li a span {
	  opacity: 1;
	  transition-delay: 0.9s;
	}
	.card-img-top{
	    height: 200px;
	    object-fit: cover;
	    }
	#imageContainer {
	  position: relative;
	  width: 500px;
	  height: 500px;
	}
	
	#first {
	  width: 100%;
	  height: 100%;
	  background-size: 100% 100%;
	  position: relative;
	  overflow: hidden;
	}
	
	#second {
	  position: absolute;
	  top: 0;
	  left: 105%;
	  width: 100%;
	  height: 100%;
	  background-size: 400% 400%;
	  display: none;
	}
	
	#lens {
	  width: 150px;
	  height: 150px;
	  background: rgba(0, 0, 0, .4);
	  position: absolute;
	  border: 3px solid #00b050;
	  transform: translate(-50%, -50%);
	  pointer-events: none;
	  display: none;
	}
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light navbar-main">
  <a class="navbar-brand" href="homepage.jsp">GiftsGalore</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <form class="form-inline mx-auto position-relative">
      <input class="form-control mr-sm-2 typing-effect" type="search" id="searchInput" placeholder="Search for gifts" aria-label="Search">
      <div id="popularSearches" class="position-absolute w-100 bg-white shadow-sm d-none" style="top: 100%; z-index: 1000;">
        <h6 class="px-3 py-2 mb-0 text-muted">Popular Searches</h6>
        <a href="christmas.jsp" class="d-block px-3 py-2 text-dark">Christmas</a>
        <a href="easter.jsp" class="d-block px-3 py-2 text-dark">Easter</a>
        <a href="diwali.jsp" class="d-block px-3 py-2 text-dark">Diwali</a>
        <a href="father.jsp" class="d-block px-3 py-2 text-dark">Father's Day</a>
      </div>
    </form>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="trackorder.html"><i class="fas fa-shipping-fast"></i> Track Your Order</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" id="giftFinderLink"><i class="fas fa-gift"></i> Gift Finder</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart <span class="badge badge-pill badge-danger"></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="signin.jsp"><i class="fas fa-sign-in-alt"></i> Sign In</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="wishlist.jsp"><i class="fas fa-heart"></i> Wishlist</a>
      </li>
    </ul>
  </div>
</nav>
  <!-- New "More" Menu -->
  <nav class="nav">
    <input id="menu" type="checkbox">
    <label for="menu">More</label>
    <ul class="menu">
      <li>
        <a href="faq.html">
          <span>FAQ's</span>
          <i class="fas fa-question-circle"></i>
        </a>
      </li>
      <li>
        <a href="aboutus.html">
          <span>About Us</span>
          <i class="fas fa-info-circle"></i>
        </a>
      </li>
      <li>
        <a href="sellwithus.html">
          <span>Sell With Us</span>
          <i class="fas fa-store"></i>
        </a>
      </li>
      <li>
        <a href="contact.html">
          <span>Contact Us</span>
          <i class="fas fa-envelope"></i>
        </a>
      </li>
      <li>
        <a href="#" id="recentlyViewedLink">
          <i class="fas fa-history"></i>
        </a>
      </li>
    </ul>
  </nav>
  
  <!-- Occasions Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark navbar-occasions">
  <div class="collapse navbar-collapse" id="navbarOccasions">
    <ul class="navbar-nav mx-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Festivals
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="diwali.jsp">Diwali</a>
            <a class="dropdown-item" href="christmas.jsp">Christmas</a>
            <a class="dropdown-item" href="easter.jsp">Easter</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Special Days
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="mother.jsp">Mother's Day</a>
            <a class="dropdown-item" href="father.jsp">Father's Day</a>
            <a class="dropdown-item" href="valentine.jsp">Valentine's Day</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Personal Celebrations
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="birthday.jsp">Birthdays</a>
            <a class="dropdown-item" href="anniversaries.jsp">Anniversaries</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Seasonal
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="spring.jsp">Spring</a>
            <a class="dropdown-item" href="summer.jsp">Summer</a>
            <a class="dropdown-item" href="fall.jsp">Fall</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>

    <!-- Product Details -->
       
       <div class="container mt-5">
       <div class="row">
    <%
      int productId = Integer.parseInt(request.getParameter("id"));
      Springsql mysqlCon = new Springsql();
      Product product = mysqlCon.getProductById(productId);
    %>
    <div class="col-md-6">
      <div id="imageContainer">
        <div id="first" style="background-image: url('<%= product.getImageUrl() %>');">
          <span id="lens"></span>
        </div>
        <div id="second" style="background-image: url('<%= product.getImageUrl() %>');"></div>
      </div>
    </div>
    <div class="col-md-6 product-details">
        
        <h2><%= product.getName() %></h2>
        <p class="lead price">$ <%= product.getPrice() %></p>
        <span class="rating">★ <%= product.getRatings() %></span><br><br>
        <p style="font-size: 20px"> Description: </p>
        <p><%= product.getDescription() %></p>
        <button class="btn btn-primary add-to-cart" data-product-id="<%= product.getId() %>">Add to Cart</button>
           <a href="homepage.jsp" class="btn btn-link">Continue Shopping</a><br>
           <!-- Additional Offer Information -->
        <div class="mt-4 ">
    <div>
   <p style="font-size: 20px"> <img src="https://assets.winni.in/groot/2023/12/11/desktop/discount.png" alt="Available offers" style="width: 20px; height: auto; margin-right: 5px;">
      Available Offers:</p>
        <ul>
            <li>Get upto ₹750 Cashback on paying via Mobikwik *T&C</li>
            <li>Use Coupon Code: TRYWINNI to get 20% off</li>
            <li>Use Coupon Code: WIN50 to get ₹50 off</li>
        </ul>
    </div>
</div>
<p>
 <p style="font-size: 20px">Reviews : </p>
    <span class="rating">★ <%= product.getRatings() %></span>
    <strong style="margin-left: 10px;"><%= product.getBuyerName() %></strong>
</p>
        <p> <%= product.getReview() %></p>
      </div>
    </div>
  </div>
    <!-- Gift Finder Modal -->
  <div class="modal fade" id="giftFinderModal" tabindex="-1" aria-labelledby="giftFinderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="giftFinderModalLabel">Gift Finder</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="giftFinderForm">
            <div class="form-group">
              <label for="occasion">Occasion</label>
              <select class="form-control" id="occasion">
                <option value="diwali">Diwali</option>
                <option value="easter">Easter</option>
                <option value="mothersday">Mother's Day</option>
                <option value="christmas">Christmas</option>
                <option value="fathersday">Father's Day</option>
              </select>
            </div>
            <div class="form-group">
              <label for="recipient">Recipient</label>
              <select class="form-control" id="recipient">
                <option>Friend</option>
                <option>Family</option>
                <option>Partner</option>
                <option>Colleague</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">Find Gifts</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  
  <footer class="bg-dark text-light mt-4">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h5>About Us</h5>
          <p>GiftsGalore is your one-stop shop for finding the perfect gift for any occasion. We offer a wide selection of unique and personalized gifts to suit every taste and budget.</p>
        </div>
        <div class="col-md-4">
          <h5>Contact Us</h5>
          <ul class="list-unstyled">
            <li><a href="#" class="text-light">Email: support@giftsgalore.com</a></li>
            <li><a href="#" class="text-light">Phone: (123) 456-7890</a></li>
            <li><a href="#" class="text-light">Address: 123 Gift Lane, Present City, PC 12345</a></li>
          </ul>
        </div>
        <div class="col-md-4">
          <h5>Follow Us</h5>
          <ul class="list-unstyled">
            <li><a href="#" class="text-light">Facebook</a></li>
            <li><a href="#" class="text-light">Twitter</a></li>
            <li><a href="#" class="text-light">Instagram</a></li>
            <li><a href="#" class="text-light">Pinterest</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="bg-secondary text-center py-3">
      <p class="mb-0">&copy; 2023 GiftsGalore. All rights reserved.</p>
    </div>
  </footer>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
  
  $(document).ready(function() {
	  // Function to update cart count
	  function updateCartCount() {
	    var cart = JSON.parse(localStorage.getItem('cart')) || [];
	    var totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
	    $('#cartCount').text(totalItems);
	    $('#cartCount').toggle(totalItems > 0);
	  }

	  // Call updateCartCount on page load
	  updateCartCount();

	  // Add to cart functionality
	  $('.add-to-cart').on('click', function() {
	    var productId = $(this).data('product-id');
	    var cart = JSON.parse(localStorage.getItem('cart')) || [];
	    
	    var existingProduct = cart.find(item => item.id == productId);
	    if (existingProduct) {
	      existingProduct.quantity += 1;
	    } else {
	      cart.push({
	        id: productId,
	        quantity: 1
	      });
	    }
	    
	    localStorage.setItem('cart', JSON.stringify(cart));
	    alert('Product added to cart!');
	    updateCartCount();
	  });
	  $('#giftFinderLink').on('click', function(event) {
		    event.preventDefault();
		    $('#giftFinderModal').modal('show');
		  });

		  $('#moreLink').on('click', function(event) {
		    event.preventDefault();
		    $('#moreMenu').collapse('toggle');
		  });

		  $('#giftFinderForm').on('submit', function(event) {
		    event.preventDefault();
		    var occasion = $('#occasion').val();
		    var url = '';
		    
		    switch (occasion) {
		      case 'diwali':
		        url = 'diwali.jsp';
		        break;
		      case 'easter':
		        url = 'easter.jsp';
		        break;
		      case 'mothersday':
		        url = 'mothersday.jsp';
		        break;
		      case 'christmas':
		        url = 'christmas.jsp';
		        break;
		      case 'fathersday':
		        url = 'fathersday.jsp';
		        break;
		      default:
		        break;
		    }

		    if (url !== '') {
		      window.location.href = url;
		    }
		  });

	  // Gift Finder Modal
	  
	  // Wishlist functionality
	  $('.wishlist-icon').on('click', function() {
	    $(this).toggleClass('fas far');
	    $(this).toggleClass('text-danger');
	    
	    var productId = $(this).data('product-id');
	    var wishlist = JSON.parse(localStorage.getItem('wishlist')) || [];
	    
	    if ($(this).hasClass('fas')) {
	      if (!wishlist.includes(productId)) {
	        wishlist.push(productId);
	      }
	    } else {
	      var index = wishlist.indexOf(productId);
	      if (index > -1) {
	        wishlist.splice(index, 1);
	      }
	    }
	    
	    localStorage.setItem('wishlist', JSON.stringify(wishlist));
	  });

	  // Load wishlist state
	  var wishlist = JSON.parse(localStorage.getItem('wishlist')) || [];
	  wishlist.forEach(function(productId) {
	    $('.wishlist-icon[data-product-id="' + productId + '"]').removeClass('far').addClass('fas text-danger');
	  });

	  // Search functionality
	  const searchInput = $('#searchInput');
	  const popularSearches = $('#popularSearches');

	  searchInput.on('focus', function() {
	    popularSearches.removeClass('d-none');
	  });

	  $(document).on('click', function(event) {
	    if (!$(event.target).closest('.form-inline').length) {
	      popularSearches.addClass('d-none');
	    }
	  });

	  popularSearches.on('click', 'a', function(e) {
	    e.preventDefault();
	    const searchTerm = $(this).text();
	    searchInput.val(searchTerm);
	    popularSearches.addClass('d-none');
	    
	    // Perform search or redirect based on the term
	    switch(searchTerm) {
	      case 'Birthdays':
	        window.location.href = 'birthday.jsp';
	        break;
	      case 'New Year':
	        window.location.href = 'newyear.jsp';
	        break;
	      case 'Diwali':
	        window.location.href = 'diwali.jsp';
	        break;
	      case 'Father\'s Day':
	        window.location.href = 'fathersday.jsp';
	        break;
	      default:
	        // Perform a general search
	        // You can add code here to submit the search form
	        break;
	    }
	  });
	});
  function updateCartIconOnLoad() {
	    var cartCount = localStorage.getItem('cartCount') || 0;
	    $('.fa-shopping-cart').siblings('.badge').text(cartCount);
	  }

	  updateCartIconOnLoad();

	// Image zoom functionality
	document.addEventListener('DOMContentLoaded', function() {
	  var lens = document.getElementById('lens');
	  var first = document.getElementById('first');
	  var second = document.getElementById('second');
	  
	  first.addEventListener('mousemove', function(e) {
	    var rect = first.getBoundingClientRect();
	    var x = e.clientX - rect.left;
	    var y = e.clientY - rect.top;
	    
	    lens.style.display = "block";
	    lens.style.left = x + 'px';
	    lens.style.top = y + 'px';
	    
	    second.style.display = "block";
	    second.style.backgroundPosition = ((x / first.offsetWidth) * 100) + '% ' + ((y / first.offsetHeight) * 100) + '%';
	  });
	  
	  first.addEventListener('mouseout', function() {
	    lens.style.display = "none";
	    second.style.display = "none";
	  });
	});
	</script>
	</body>
	</html>