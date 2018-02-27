$(document).ready(function() {
	$("#login").on("click", function() {
    if($('#user_email').val() == '' || $('#user_password').val() == ''){
			alert('Todos os campos são obrigatórios');
			return false;
		}else{
			$('#login_form').submit()
		}
  });
});