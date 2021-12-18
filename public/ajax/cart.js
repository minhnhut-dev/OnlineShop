$(document).ready(function() {
console.log('connected')
  $.ajax({
    url: '/api/province',
    type: 'GET',
    dataType: 'json',
    success: function(response){
      var html= "";
      response.data.forEach(function(element){
        html+='<option value='+element.id+'>'+element.name+'</option>';
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

});