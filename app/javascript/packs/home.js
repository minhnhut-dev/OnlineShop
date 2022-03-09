import $ from "jquery";
$(document).ready(function () {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
  });
  $('#search').keyup(function () {
    var keyword = $('#search').val();
    var data = {
      keyword: keyword
    }
    if(keyword == "")
    {
        $('.guaven_woos_suggestion').css('display', 'none');
    }
    else
    {
      $('.guaven_woos_suggestion').css('display', 'block');

      $.ajax({
        type: "post",
        url: "/api/search",
        data: data,
        dataType: "JSON",
        success: function (response) {
          console.log(response);
          var html = "";
          var data = response.data;
          data.forEach(function (element) {
            html+= '<a href="/products/'+element.id+'">';
            html+= '<li class="guaven_woos_suggestion_list">';
            html+= '<div class="guaven_woos_div">';
            html+= '<img class="guaven_woos_img" src='+element.images_path+' alt="image" >';
            html+= '</div>';
            html+= '<div class="guaven_woos_titlediv">';
            html+= '<span><div class="woos_sku">'+ element.name +'</div></span>';
            html+= '<small> <span class="amount">'+element.price+'đ</span> </small>';
            html+= '</div>';
            html+= '</li>';
            html+= '</a>';
            $('.guaven_woos_final_results').html(html);
          });
        }
      });
    }
 
  })
});
