$(document).ready(function() {
  $(document).on('click','#check_all', function(){
      $('input:checkbox').prop('checked',this.checked);
  });
});
