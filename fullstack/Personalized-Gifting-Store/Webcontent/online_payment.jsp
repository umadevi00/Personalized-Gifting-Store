<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Online Payment</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .payment-option {
      border: 1px solid #ccc;
      padding: 10px;
      margin-bottom: 10px;
      cursor: pointer;
    }
    .payment-option.selected {
      background-color: #007bff;
      color: white;
    }
  </style>
</head>
<body>
  <div class="container mt-5">
    <h2>Choose Payment Method</h2>
    <div class="payment-option" data-method="phonepay">
      <h3>PhonePe</h3>
    </div>
    <div class="payment-option" data-method="debitcard">
      <h3>Debit Card</h3>
    </div>
    <div class="payment-option" data-method="creditcard">
      <h3>Credit Card</h3>
    </div>
    <button id="proceedBtn" class="btn btn-primary mt-3">Proceed</button>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function() {
      $('.payment-option').on('click', function() {
        $('.payment-option').removeClass('selected');
        $(this).addClass('selected');
      });

      $('#proceedBtn').on('click', function() {
        if($('.payment-option.selected').length) {
          // Show the order confirmation modal
          $('#orderModal').modal('show');
        } else {
          alert('Please select a payment method');
        }
      });
    });
  </script>

  <!-- Order Confirmation Modal -->
  <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-body text-center">
          <img src="https://cdn.dribbble.com/users/583807/screenshots/5187139/v5.gif" alt="Order is on its way!" style="max-width: 100%; height: auto;">
          <a href="homepage.jsp" class="btn btn-link">Continue Shopping</a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>