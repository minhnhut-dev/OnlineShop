$(document).ready(function() {
  $(document).on('click','#check_all', function(e){
    var val = this.checked;
      $('input:checkbox').prop('checked',this.checked);
  });
});