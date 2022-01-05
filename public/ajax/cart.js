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
    var data= {
      id: id,
      name: name,
      email: email,
      address: select
    };
    if(!$('#form_user').valid())
    {
      $('.error').css('color', 'red');
    }    
    else
    {
      $.ajax({
        type: "post",
        url: "/api/update_user",
        data: data,
        dataType: "json",
        success: function (response) {
          console.log(response);
         $('.modal').show();
         $('#notification').html(response.message);
         $('#address').val(response.data.address);
         
        },
        error: function(error) {
          console.log('error:', error.response.message);
        }
      });
    }
  });

  $('#close').click(function () {
    $(this).closest('.modal').fadeOut();  
  }); 


});
function updatecart(id) {
  var data= ($('#updatecart'+id).serialize());
  $.ajax({
    type: "POST",
    url: "/api/update_quantity",
    data: data,
    dataType: "json",
    success: function (response) {
      console.log(response);
      var sub_total= response.data;
      sub_total.forEach(function(element){
        var currency= element.total;
        currency = currency.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
        $('#amount').html(currency);
      })
    }
  });
}
