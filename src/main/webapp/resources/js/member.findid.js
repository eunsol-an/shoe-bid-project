let email = document.querySelector('#email');

email.addEventListener("focusout", checkEmail);
function checkEmail() {
  let emailInputed = document.getElementById('email');
  let emailVal = emailInputed.value;
  console.log(emailVal);
  if(emailVal != ""){
    document.getElementById('emailCheck').innerText = "";
  }else{
    document.getElementById('emailCheck').innerText = "이메일을 입력하세요.";
    document.getElementById('emailCheck').style.color = 'red';
  }
}