async function postChatToServer(ctData){
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

function trimSendAt(sendAt){
  return sendAt.substring(0, sendAt.length-3);
}

  function getChatList(roomVal){
    spreadChatFromServer(roomVal).then(result => {
      if (result.length) {
       const sesmno = document.getElementById('ctmno').innerText;
       let tag = '';
        for(const cvo of result){
          if(cvo.recvNick == sesmno){
              
            tag += `<div class="item mymsg">`
            tag += `<div class="chatbox">`
            tag += ` <p class="msg text-break">${cvo.content}</p>`
            tag += `<div class="chatbox">`
            tag += `<span class="time">${trimSendAt(cvo.sendAt)}</span>`
            tag += `</div>`
            tag += `</div>`
            tag += `</div>`
            
          } else  {
            tag += `<div class="item">`
            tag += `<div class="chatbox">`
            tag += ` <p class="msg text-break">${cvo.content}</p>`
            tag += `<span class="time">${trimSendAt(cvo.sendAt)}</span>`
            tag += `</div>`
            tag += `</div>`
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
  if(ctInputObj.value == null || ctInputObj.value == ''){
    ctInputObj.focus();
    return false;
  } else {
    let ctData = {
      content : document.getElementById('ctText').value,
      readChk : document.getElementById('readChk').innerText,
      sendNick : document.getElementById('sendNick').innerText,
      recvNick : document.getElementById('recvNick').innerText,
      room : parseInt(document.getElementById('roomVal').innerText)
    };
    postChatToServer(ctData).then(result => {
      if(parseInt(result)){
        ctInputObj.value ="";
        getChatList(document.getElementById('roomVal').innerText);
      }
    });

  }
 
});






