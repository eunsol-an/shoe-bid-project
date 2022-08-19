let pwd = document.querySelector('#pwd');
let repwd = document.querySelector('#repwd');

pwd.addEventListener("focusout", checkPwd);
repwd.addEventListener("focusout", checkRePwd);

function checkPwd() {
  let pwdPattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
  if (pwd.value === "") {
    document.getElementById('pwdCheck').innerText = "비밀번호을 입력해주세요.";
    document.getElementById('pwdCheck').style.color = 'red';
  } else if (!pwdPattern.test(pwd.value)) {
    document.getElementById('pwdCheck').innerText = '8~20자 영문, 숫자, 특수문자의 조합으로 가능합니다.';
    document.getElementById('pwdCheck').style.color = 'red';
    pwd.value = "";
  } else {
    document.getElementById('pwdCheck').innerText = "안전";
    document.getElementById('pwdCheck').style.color = 'green';
  }
}
function checkRePwd() {
  if (repwd.value === pwd.value && repwd.value != "") {
    document.getElementById('repwdCheck').innerText = "비밀번호가 일치합니다.";
    document.getElementById('repwdCheck').style.color = 'green';
    document.getElementById('modifyBtn').disabled = false;
  } else if (repwd.value !== pwd.value) {
    document.getElementById('repwdCheck').innerText = '비밀번호가 일치하지 않습니다.';
    document.getElementById('repwdCheck').style.color = 'red';
    repwd.value = "";
  }
  if(repwd.value === "") {
    document.getElementById('repwdCheck').innerText = '필수정보입니다.';
    document.getElementById('repwdCheck').style.color = 'red';
  }

}