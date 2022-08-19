async function idDupleCheckFromServer(idVal){
  try {
    const url = "/member/idDupleCheck";
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({id: idVal})
    }
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.getElementById('idDupleCheck').addEventListener('click', (e) => {
  e.preventDefault();
  let idInputed = document.getElementById('id');
  let idVal = idInputed.value;

  if(idVal == ''){
    alert('아이디를 입력하세요.');
    idInputed.focus();
    return;
  } else {
    idDupleCheckFromServer(idVal).then(result => {
      console.log(typeof result, result);
      if(parseInt(result)){
        alert("이미 사용중인 아이디 입니다.");
        idInputed.value = "";
        idInputed.focus();
      }else{
        alert("사용 가능한 아이디 입니다.");
        document.getElementById("nickName").focus();
      }
    });
  }
});

async function nickNameDupleCheckFromServer(nickNameVal){
  try {
    const url = "/member/nickNameDupleCheck";
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({nickName: nickNameVal})
    }
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.getElementById('nickNameDupleCheck').addEventListener('click', (e) => {
  e.preventDefault();
  let nickNameInputed = document.getElementById('nickName');
  let nickNameVal = nickNameInputed.value;

  if(nickNameVal == ''){
    alert('닉네임를 입력하세요.');
    nickNameInputed.focus();
    return;
  } else {
    nickNameDupleCheckFromServer(nickNameVal).then(result => {
      console.log(typeof result, result);
      if(parseInt(result)){
        alert("이미 사용중인 닉네임 입니다.");
        nickNameInputed.value = "";
        nickNameInputed.focus();
      }else{
        alert("사용 가능한 닉네임 입니다.");
        document.getElementById("email").focus();
      }
    });
  }
});

async function emailDupleCheckFromServer(emailVal){
  try {
    const url = "/member/emailDupleCheck";
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({email: emailVal})
    }
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.getElementById('emailDupleCheck').addEventListener('click', (e) => {
  e.preventDefault();
  let emailInputed = document.getElementById('email');
  let emailVal = emailInputed.value;

  if(emailVal == ''){
    alert('이메일을 입력하세요.');
    emailInputed.focus();
    return;
  } else {
    emailDupleCheckFromServer(emailVal).then(result => {
      console.log(typeof result, result);
      if(parseInt(result)){
        alert("이미 사용중인 이메일 입니다.");
        emailInputed.value = "";
        emailInputed.focus();
      }else{
        alert("사용 가능한 이메일 입니다.");
        document.getElementById("pwd").focus();
      }
    });
  }
});

let id = document.querySelector('#id');
	let nick = document.querySelector('#nickName');
	let email = document.querySelector('#email');
	let pwd = document.querySelector('#pwd');
	let repwd = document.querySelector('#repwd');

	id.addEventListener("focusout", checkId);
	nick.addEventListener("focusout", checkNick);
	email.addEventListener("focusout", checkEmail);
	pwd.addEventListener("focusout", checkPwd);
	repwd.addEventListener("focusout", checkRePwd);

	function checkId() {
		let idPattern = /^[a-z0-9]{5,12}$/;
		if (id.value === "") {
			document.getElementById('idCheck').innerText = "아이디를 입력해주세요.";
			document.getElementById('idCheck').style.color = 'red';
			
		} else if (!idPattern.test(id.value)) {
			document.getElementById('idCheck').innerText = '아이디는 5~12자 영문소문자와 숫자만 입력가능합니다';
			document.getElementById('idCheck').style.color = 'red';
			id.value = "";
		} else {
			document.getElementById('idCheck').innerText = "멋진 아이디네요!";
			document.getElementById('idCheck').style.color = 'green';
		}
	}
	function checkNick() {
		let nickPattern = /^[가-힣a-zA-Z0-9]{2,8}$/;
		if (nick.value === "") {
			document.getElementById('nickCheck').innerText = "닉네임을 입력해주세요";
			document.getElementById('nickCheck').style.color = 'red';
		} else if (!nickPattern.test(nick.value)) {
			document.getElementById('nickCheck').innerText = '닉네임은 2~8자까지만 입력가능합니다';
			document.getElementById('nickCheck').style.color = 'red';
			nick.value = "";
		} else {
			document.getElementById('nickCheck').innerText = "멋진 닉네임이네요!";
			document.getElementById('nickCheck').style.color = 'green';
		}
	}
	function checkEmail() {
		let emailPattern = /^[-0-9A-Za-z!#$%&'*+/=?^_`{|}~.]+@[-0-9A-Za-z!#$%&'*+/=?^_`{|}~]+[.]{1}[0-9A-Za-z]/;
		if (email.value === "") {
			document.getElementById('emailCheck').innerText = "이메일을 입력해주세요.";
			document.getElementById('emailCheck').style.color = 'red';
		} else if (!emailPattern.test(email.value)) {
			document.getElementById('emailCheck').innerText = '이메일이 올바르지않습니다.';
			document.getElementById('emailCheck').style.color = 'red';
			email.value = "";
		} else {
			document.getElementById('emailCheck').innerText = "올바른 이메일입니다.";
			document.getElementById('emailCheck').style.color = 'green';
		}
	}
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
		} else if (repwd.value !== pwd.value) {
			document.getElementById('repwdCheck').innerText = '비밀번호가 일치하지 않습니다.';
			document.getElementById('repwdCheck').style.color = 'red';
			repwd.value = "";
		}
		if(repwd.value === "") {
			document.getElementById('repwdCheck').innerText = '필수 정보입니다.';
			document.getElementById('repwdCheck').style.color = 'red';
		}

	}