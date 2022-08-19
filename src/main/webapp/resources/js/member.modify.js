async function removeFileAtServer(uuid) {
  try {
      const url = '/member/file/'+uuid;
      const config = {
          method: 'delete'
      };
      const resp = await fetch(url, config);
      const result = await resp.text();
      return result;
  } catch (error) {
      console.log(error);
  }
}

document.addEventListener('click', (e) => {
  if(e.target.classList.contains('fileDelBtn')){
      removeFileAtServer(e.target.dataset.uuid).then(result => {
          console.log(result);
          alert('파일 삭제'+ (parseInt(result) > 0 ? "완료" : "실패"));
          if(parseInt(result)){
              e.target.closest('li').remove();
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
  const sesnick = document.getElementById('sesnick').innerText;
  let nickNameInputed = document.getElementById('nickName');
  let nickNameVal = nickNameInputed.value;

  if(nickNameVal == ''){
    alert('닉네임를 입력하세요.');
    nickNameInputed.focus();
    return;
  } else {
    nickNameDupleCheckFromServer(nickNameVal).then(result => {
      console.log(typeof result, result);
      if(nickNameVal == sesnick){
        alert("현재 사용중인 닉네임입니다.");
        document.getElementById('regBtn').disabled = false;
      }else if(parseInt(result)) {
        alert("이미 사용중인 닉네임 입니다.");
        nickNameInputed.value = "";
        nickNameInputed.focus();
      }else{
        alert("사용 가능한 닉네임 입니다.");
        document.getElementById('regBtn').disabled = false;
      }
    });
  }
  console.log(nickNameVal);
  console.log(sesnick);
});

let nick = document.querySelector('#nickName');
nick.addEventListener("focusout", checkNick);
function checkNick() {
  let nickPattern = /^[가-힣a-zA-Z0-9]{2,8}$/;
  if (nick.value === "") {
    document.getElementById('nickCheck').innerText = "닉네임을 입력해주세요.";
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
let pwd = document.querySelector('#pwd');
let repwd = document.querySelector('#repwd');
pwd.addEventListener("focusout", checkPwd);
repwd.addEventListener("focusout", checkRePwd);
function checkPwd() {
  let pwdPattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
  if (pwd.value === "") {
    document.getElementById('pwdCheck').innerText = "비밀번호을 입력해주세요";
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
    document.getElementById('regBtn').disabled = false;
    
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