async function postChatToServer(ctData){
    console.log(ctData);
    try {
      const url = '/chat/post';
      const config = {
        method: 'post',
        headers: {
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: JSON.stringify(ctData)
      };
      const resp = await fetch(url, config);
      const result = await resp.text();
      return result;  
    } catch (error) {
      console.log(error);
    }  
  }

  async function spreadChatFromServer(roomVal) {
    try {
        const resp = await fetch('/chat/'+roomVal);
        const ctList = await resp.json();
        return await ctList;
    } catch (error) {
      console.log(error);
    }
  }

  function getChatList(roomVal){
    spreadChatFromServer(roomVal).then(result => {
      console.log(result);
      if (result.length) {
       const sesmno = document.getElementById('ctmno').innerText;
       let tag = '';
        for(const cvo of result){
          if(cvo.recvNick == sesmno){
             tag += `<span class="" style="float: right;">${cvo.content}</span><br>`
            tag += `<span class="" style="float: right; font-size: 14px"">${cvo.sendAt}</span><br>` 
            
          } else  {
            tag += `<span class="" >${cvo.content}</span><br>`
            tag += `<span class="" float: left; font-size: 14px">${cvo.sendAt}</span><br>`
          }
        }
        document.getElementById('ctZone').innerHTML = tag;
        var objDiv = document.getElementById("ctZone");
         objDiv.scrollTop = objDiv.scrollHeight;
      }else{
      }
    });
  }

document.getElementById('ctSbmBtn').addEventListener('click', (e) => {
  const ctInputObj = document.getElementById('ctText');
 
    let ctData = {
      content : document.getElementById('ctText').value,
      readChk : document.getElementById('readChk').innerText,
      sendNick : document.getElementById('sendNick').innerText,
      recvNick : document.getElementById('recvNick').innerText,
      room : parseInt(document.getElementById('roomVal').innerText)
    };
    console.log(typeof document.getElementById('roomVal').innerText);
    postChatToServer(ctData).then(result => {
      if(parseInt(result)){
        ctInputObj.value ="";
        getChatList(document.getElementById('roomVal').innerText);
      }
    });
 
});