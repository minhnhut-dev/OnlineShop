import $ from "jquery";
import "jquery-validation";
$(document).ready(function() {
  $.ajaxSetup({
    headers: {
        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
});
console.log('connected')
    $.ajax({
      url: '/api/province',
      type: 'GET',
      dataType: 'json',
      success: function(response){
        var html= "";
        response.data.forEach(function(element){
          html+='<option value='+element.id+'>'+ element.name +'</option>';
        });
        $('#province').html(html);
      },
    });
   $('#province').change(function() {
     
    var province = $(this).val();
     $.ajax({
      url: '/api/district/'+ province ,
      type: 'GET',
      dataType: 'json',
      success: function(response){
        var data = response.data;
        var html = "";
        data.forEach(function(element){
          html+= '<option value='+element.id+'>'+element.name+'</option>';
        }); 
        $('#district').html(html);
      }
    });
  });
  $('#district').change(function(){
    var district = $(this).val();
    $.ajax({
      url: '/api/ward/'+ district,
      type: 'GET',
      dataType: 'json',
      success: function(response){
        var html= "";
        response.data.forEach(function(element){
          html+= '<option value='+element.id+'>'+element.name+'</option>';
        });
        $('#ward').html(html);
      },
    });
  });

  $.validator.addMethod("customemail", 
  function(value, element) {
    return value.match(/^[a-zA-Z0-9_\.%\+\-]+@[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,}$/);
  }, 
  "Your E-mail is wrong!"
);

  $('#form_user').validate({
    rules: {
      email: {
        required: true,
        customemail: true,
      },
      name :'required',
      address: 'required',
    },
    messages:{
      name: "Please enter your name",
      address: "Please enter your address",
    },
  });

  $('#save').click(function(e){
    e.preventDefault();
    
    var id= $('#id').val();
    var name = $('#name').val();
    var email = $('#email').val();
    var address = $('#address').val();
    var province = $('#province option:selected').text();
    var district = $('#district option:selected').text();
    var ward = $('#ward option:selected').text();
    var select = address+', '+'xã '+ward +','+' huyện '+ district+ ', '+ province;
    var phone= $('#phone').val();
    var data= {
      id: id,
      name: name,
      email: email,
      address: select,
      phone: phone
    };
    
    if(!$('#form_user').valid())
    {
      $('.error').css('color', 'red');
    }
    else
    {
      Swal.fire({
        title: 'Notification',
        text: 'Do you want to save',
        icon: 'question',
        confirmButtonText: 'Save',
        showCancelButton: true,
      }).then((result) => {
        if(result.isConfirmed)
        {
            $.ajax({
              type: "post",
              url: "/api/update_user",
              data: data,
              dataType: "json",
              success: function (response) {
                Swal.fire({
                  title: 'Success',
                  text: 'Save information success',
                  icon: 'success',
                  confirmButtonText: 'OK',
                })
               $('#address').val(response.data.address);
              },
              error: function(error) {
                console.log('error:', error.response.message);
              }
            });
        }
      });
    }
  
  });
 
  $('#close').click(function () {
    $(this).closest('.modal').fadeOut();  
  }); 

  $('#payment_1').click(function() {
    $('#payment_momo_2').prop('checked', false);
  });

  $('#payment_momo_2').click(function() {
    $('#payment_1').prop('checked', false);
  });
  
  // default shipping is Free Shipping
  $('#shipping_1').prop('checked', true);

  $('#order').click(function () {
    var user_id= $('#id').val();
    var payment_id= $('#payment_1').val();
    var date_order= new Date().toLocaleString();
    var data= {
      user_id: user_id,
      payment_id: payment_id,
      orderdate: date_order
    }
    $.ajax({
      type: "POST",
      url: "/api/create_order",
      data: data,
      dataType: "json",
      success: function (response) {
        console.log(response);
        Swal.fire({
          title: 'Success',
          text: 'Chúc mừng bạn đã đặt hàng thành công',
          icon: 'success',
          confirmButtonText: 'OK',
        }).then((result) => {
          if (result.isConfirmed) {
            var url = "http://127.0.0.1:3000/order-detail";
            window.location.href= url;
          }       
        });
      
      },
      error: function(request, status, error) {
        var err = JSON.parse(request.responseText);
        Swal.fire({
          title: 'error',
          text: err.message,
          icon: 'error',
          confirmButtonText: 'OK',
        })
      }
    });
  })
});
window.updatecart= function (id) {  
  var data= ($('#updatecart'+id).serialize());
  $.ajax({
    type: "POST",
    url: "/api/update_quantity",
    data: data,
    dataType: "json",
    success: function (response) {
      var data= response.data;
      var total= 0;
      data.forEach(function(element){
        total+= element.sub_total;
      });
      total = total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
        $('#amount').html(total);
    }
  });
}

window.remove_cart= function (id) {
  var data= ($('#remove_cart'+id).serialize());
  $.ajax({
    type: "POST",
    url: "/api/remove_item",
    data: data,
    dataType: "json",
    success: function (response) {
      var quantiy_item_cart= response.data.length;
      $('#product'+id).remove();
      $('.online-shop-number').text(quantiy_item_cart);
    },
  });
}
