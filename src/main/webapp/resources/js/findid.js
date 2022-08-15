async function emailCheckFromServer(emailVal){
  try {
    const url = "/member/searchIDResult";
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({email: emailval})
    }
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.getElementById('findBtn').addEventListener('click', (e) => {
  e.preventDefault();
  let emailInputed = document.getElementById('email');
  let emailVal = emailInputed.value;
  
  if(emailVal == ''){
    alert('이메일을 입력하세요!');
    emailInputed.focus();
    return
  }else{
    emailCheckFromServer(emailval).then(result => {
      if(emailVal != null){
        console.log(result);
        
      }
    });
  }
})