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
       
       let tag = '';
        for(const cvo of result){
          if(cvo.recvNick == 4){
             tag += `<span class="" style="float: right;">${cvo.content}</span><br>`
            tag += `<span class="" style="float: right; font-size: 14px"">${cvo.sendAt}</span><br>` 
            
          } else  {
            tag += `<span class="" >${cvo.content}</span><br>`
            tag += `<div class="" float: left; font-size: 14px">${cvo.sendAt}</div><br>`
          }
         /*  tag += `<span class="" style="float: right;">${cvo.content}</span><br>`
            tag += `<div class="" style="float: right; font-size: 14px">${cvo.sendAt}</div><br>`dd */
        }
        document.getElementById('ctZone').innerHTML = tag;
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
      room : document.getElementById('readChk').innerText
    };
    console.log(ctData);
    postChatToServer(ctData).then(result => {
      if(parseInt(result)){
        ctInputObj.value ="";
        getChatList(document.getElementById('roomVal').innerText);
      }
    });
 
});