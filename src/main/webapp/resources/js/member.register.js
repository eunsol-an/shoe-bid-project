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
    alert('아이디를 입력하세요!');
    idInputed.focus();
    return;
  } else {
    idDupleCheckFromServer(idVal).then(result => {
      console.log(typeof result, result);
      if(parseInt(result)){
        alert("이미 사용중인 아이디 입니다!");
        idInputed.value = "";
        idInputed.focus();
      }else{
        alert("사용 가능한 아이디 입니다!");
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
    alert('닉네임를 입력하세요!');
    nickNameInputed.focus();
    return;
  } else {
    nickNameDupleCheckFromServer(nickNameVal).then(result => {
      console.log(typeof result, result);
      if(parseInt(result)){
        alert("이미 사용중인 닉네임 입니다!");
        nickNameInputed.value = "";
        nickNameInputed.focus();
      }else{
        alert("사용 가능한 닉네임 입니다!");
        document.getElementById("email").focus();
      }
    });
  }
});