const sesWriter = document.getElementById("ses").innerText;
const pvoWriter = document.getElementById("pvoWriter").innerText
async function spreadQuestionFromServer(pnoVal, pageNo){
  try {
      const resp = await fetch('/question/'+pnoVal+"/"+pageNo); // RESTful
      const pagingHandler = await resp.json();
      return await pagingHandler; 
  } catch (error) {
    console.log(error);
  }

}


function stringReplace(string){
  return string.replace(/\\/g,'/');
}
function getQuestionList(pnoVal, pageNo=1) {
  spreadQuestionFromServer(pnoVal, pageNo).then(result =>{
    document.getElementById('qnaQty').innerText=` (${result.totalCount})`
    let html = '';

    if (result.questionList.length && pageNo == 1) {
      document.getElementById('moreBtn').dataset.page = 1;
        for (const qvo of result.questionList) {
    html += `<div class="comment-box mb-3">
    <div class="author-thumb">
    </div>
    <div class="comment-info">
        <h6 class="mb-0">`;
        html +=  `<img src="/upload/${stringReplace(String(qvo.memberImg))}" alt="…" class="img-fluid rounded-circle img-thumbnail">`;
        html +=  `<a href="#">${qvo.nickName}</a> `;
        html +=  `</h6>
            <span class="display-31"> &lt;${qvo.modAt}&gt;</span>`;
            if (qvo.isDeleted == 1) {
              html += `<div>작성자에 의해 삭제된 질문입니다.</div>`;                
            } else {
              html += `<div class="contentVal">${qvo.content}</div>`;
            }
            
        if(parseInt(qvo.isAnswer) == 0){
          html +=  `<div class="reply">`
          if(qvo.isDeleted == 0  ) {
            if(parseInt(pvoWriter) == parseInt(sesWriter)){
            html += `<button class="btn btn-sm btn-light me-2 postAnsBtn" data-qno="${qvo.qno}">답글작성</button>`;
            }
          } else {
            html += '';
          }
        } else{
          html += `<div class="reply">`
          html += `<button class="btn btn-sm btn-light me-2 getAnsBtn" data-qno="${qvo.qno}">답글보기</button>`;
        }
        if (qvo.isDeleted == 0 && qvo.writer == sesWriter) {
          html += `<button class="btn btn-sm btn-light me-2 questionMod" data-qno="${qvo.qno}">수정</button>`;
          html += `<button class="btn btn-sm btn-light me-2 questionDel" data-qno="${qvo.qno}">삭제</button>`;   
        }
        html +=  `</div><div></div></div></div>`;
      }   
      document.getElementById('qnaZone').innerHTML= html;

    }else if (pageNo > 1) {
      let html = '';
      for (const qvo of result.questionList) {
        html += `<div class="comment-box mb-3">
    <div class="author-thumb">
    </div>
    <div class="comment-info">
        <h6 class="mb-0">
        <img src=${qvo.memberImg} alt="…" class="rounded-circle">
            <a href="#">${qvo.nickName}</a> 
        </h6>
            <span class="display-31"> &lt;${qvo.modAt}&gt;</span>`
            if (qvo.isDeleted == 1) {
              html += `<div>작성자에 의해 삭제된 질문입니다.</div>`;                
            } else {
              html += `<div>${qvo.content}</div>`;
            }
            console.log()
        if(parseInt(qvo.isAnswer) == 0){
          html +=  `<div class="reply">`
          if(qvo.isDeleted == 0 && pvoWriter == sesWriter) {
            html += `<button class="btn btn-sm btn-light me-2 postAnsBtn" data-qno="${qvo.qno}">답글작성</button>`;
            
          } else {
            html += '';
          }
        } else{
          html += `<div class="reply">`
          html += `<button class="btn btn-sm btn-light me-2 getAnsBtn" data-qno="${qvo.qno}">답글보기</button>`;
        }
        if (qvo.isDeleted == 0 && qvo.writer == sesWriter) {
          html += `<button class="btn btn-sm btn-light me-2 questionMod" data-qno="${qvo.qno}">수정</button>`;
          html += `<button class="btn btn-sm btn-light me-2 questionDel" data-qno="${qvo.qno}">삭제</button>`;   
        }
        html +=  `</div><div></div></div></div>`;
      
      }
      document.getElementById('qnaZone').innerHTML +=  html;
    
    } else {
      // 리스트가 존재하지 않을 때 DOM
    }
    const moreBtn = document.getElementById('moreBtn');
    if(pageNo < parseInt(Math.ceil(result.totalCount / 10.0))) {
      moreBtn.style.visibility = 'visible';
      let pageIdx = moreBtn.dataset.page;
      console.log(pageIdx);
      moreBtn.dataset.page = parseInt(pageIdx) + 1;
      console.log(moreBtn.dataset.page);
    }else{
      moreBtn.style.visibility = 'hidden';
    }
  });
};


async function postQuestionToServer(questionData){
try {
  const url = '/question/post';
  const config = {
    method: 'post',
    headers: {
      'Content-Type': 'application/json; charset=utf-8'
    },
    body: JSON.stringify(questionData)
  };
  const resp = await fetch(url, config);
  const result = await resp.text();
  return result;  
} catch (error) {
  console.log(error);
}  
}
document.getElementById('questionSbmBtn').addEventListener('click', (e) => {
const questionInputObj = document.getElementById('questionText');
if(questionInputObj.value == null || questionInputObj.value == ''){
  alert('질문 내용을 입력해 주세요!');
  questionInputObj.focus();
  return false;
}else {
  let questionData = {
    pno : document.getElementById('pnoVal').innerText,
    writer : document.getElementById('questionWriter').value,
    content : questionInputObj.value
  };
  console.log(questionData);
  postQuestionToServer(questionData).then(result => {
    if(parseInt(result)) {
      alert('질문을 등록하였습니다');
      questionInputObj.value = "";
      getQuestionList(document.getElementById('pnoVal').innerText);
    }
  });
}
});


async function questionRemoveUpdateFromServer(qnoVal) {
try {
  const url = "/question/"+qnoVal;
  const config = {
    method: 'PUT'
  };
  const resp = await fetch(url, config);
  const result = await resp.text();
  return result;
} catch (error) {
  console.log(error);
}
}
document.addEventListener('click', (e) => {
if(e.target.classList.contains('questionDel')){
const qnoVal = e.target.dataset.qno;
const modBtn = document.querySelector('.questionMod');
const delBtn = document.querySelector('.questionDel');
questionRemoveUpdateFromServer(qnoVal).then(result => {
  if(parseInt(result)){
    alert("삭제되었습니다");
    getQuestionList(document.getElementById('pnoVal').innerText);      
    modBtn.style.visibility = 'hidden';
    delBtn.style.visibility = 'hidden';
  }
});
}
});


async function questionUpdateToServer(questionData) {
try {
  const url = "/question/"+questionData.qno;
  const config = {
    method: 'PUT', // PATCH도 가능
    headers: {
      'Content-Type':'application/json; charset=utf-8'
    },
    body: JSON.stringify(questionData)
  };
  const resp = await fetch(url, config);
  const result = await resp.text();
  return result;  
} catch (error) {
  console.log(error);
}
}
document.addEventListener('click', (e) => {
if(e.target.classList.contains('questionMod')){ 
  const qnoVal = e.target.dataset.qno;
  const div = e.target.closest('div');
  const divContent = div.previousSibling.innerText;
    
    console.log(divContent);
    let tag = '';
      tag += '<div class="col-12 mb-4">';
      tag += '<div class="form-group mb-1">';
      tag +=  `<textarea rows="2" class="form-control" id="questionModifiedText" style="resize: none;">${divContent}</textarea>`;
      tag += '</div>';
      tag += '</div>';
      tag += `<button type="button" class="butn-style2 modSbmBtn" data-qno="${qnoVal}">수정</button>`;
      tag += `<button type="button" class="butn-style2 cancelModSbmBtn" >취소</button>`;

      div.previousSibling.innerHTML = tag;
}
if(e.target.classList.contains('modSbmBtn')){
  let textVal = document.getElementById('questionModifiedText').value;
  let qnoVal = e.target.dataset.qno;
  if(textVal == '') {
    alert('수정 내용을 입력하세요');
    textVal.focus();
    return false;
  }else{
    const questionData = {
      qno: qnoVal,
      content: textVal
    };
    questionUpdateToServer(questionData).then(result => {
      if(parseInt(result)){
        alert('질문이 수정되었습니다.');
        textVal = "";       
      }
      getQuestionList(document.getElementById('pnoVal').innerText);
    });
  }
}
if(e.target.classList.contains("cancelModSbmBtn")){
  const div = e.target.closest('div')
  const contentVal= div.children[0].children[0].children[0].value;
  div.innerText = contentVal
}
if(e.target.classList.contains('postAnsBtn')){
  const div = e.target.closest('div')
  const ansBox = div.nextSibling;
  const parent = e.target.dataset.qno;
  const pnoVal = document.getElementById("pnoVal").innerText;
  let tag = '';
  tag += '<div class="col-12 mb-4">';
  tag += '<div class="form-group mb-1">';
  tag += `<input type="hidden" class="form-control " name="writer"  value=${parent } id="">`;
  tag +=  `<textarea rows="2" class="form-control ansContent"  style="resize: none;"></textarea>`;
  tag += '</div>';
  tag += '</div>';
  tag += `<button type="button" class="butn-style2 ansSbmBtn" data-qno=${parent} >작성</button>`;
  tag += `<button type="button" class="butn-style2 cancelAnsSbmBtn" >취소</button>`;
  ansBox.innerHTML =tag;
}
if(e.target.classList.contains('cancelAnsSbmBtn')){
  e.target.closest('div').innerText = "";
}
if(e.target.classList.contains('ansSbmBtn')){
  const parent = e.target.dataset.qno;
  const content = document.querySelector('.ansContent').value;
  if(content == '') {
    alert('내용을 입력하세요');
    document.querySelector('.ansContent').focus();
    return false;
  }else{
    const answerData = {
      pno: document.getElementById('pnoVal').innerText,
      parent: parent,
      content: content,
      writer:sesWriter
    };
    postQuestionToServer(answerData).then(result => {
      if(parseInt(result)){
        alert('답변이 등록 되었습니다.');
        e.target.closest('div').innerText = "";       
      }
      getQuestionList(document.getElementById('pnoVal').innerText);
    });
  }

}
if(e.target.classList.contains('getAnsBtn')){
  let parent = e.target.dataset.qno
  const div = e.target.closest('div')
  const ansResult = div.nextSibling;

  spreadAnswerFromServer(parent).then(result => {
    console.log(result.content);
    let html = '';
    html += `<div class="comment-box ms-5 mt-3">
    <div class="author-thumb">`;
    html += `</div>
    <div class="comment-info">`;
    html += `<h6 class="mb-0"><img src="/upload/${stringReplace(result.memberImg)}" alt="..." class="img-fluid rounded-circle img-thumbnail">`;
    html += `<a href="#">${result.nickName}</a></h6>`;
    html +=  `<span class="display-31"> &lt;${result.modAt}&gt;</span>`;
        if (result.isDeleted == 1) {
          html += `<div>작성자에 의해 삭제 된 답글입니다.</div>`;
        } else {
          html += `<div class="contentVal">${result.content}</div>`;
        }
          html += `<div style="display: none">${result.parent}</div>`;
          html += `<button class="btn btn-sm btn-light me-2 closeAnsBtn">닫기</button>`;
        if (result.isDeleted == 0 && result.writer == sesWriter) { 
          html += `<button class="btn btn-sm btn-light me-2 answerMod" data-qno="${result.qno}">수정</button>`;
          html += `<button class="btn btn-sm btn-light me-2 questionDel" data-qno="${result.qno}">삭제</button>`;   
        }
        html += `</div></div></div>`;
ansResult.innerHTML = html;
  });
}

if (e.target.classList.contains('closeAnsBtn')) {
  const div = e.target.closest('div')
  div.innerText = "";
}
if (e.target.classList.contains('answerMod')) {
  const div = e.target.closest('div')
  const contentVal = div.children[2].innerText;
  const qno = e.target.dataset.qno;
  const parent = div.children[1].value; 
  console.log("qno",qno);
  console.log("parent",parent);
  let tag = '';
      tag += '<div class="col-12 mb-4">';
      tag += '<div class="form-group mb-1">';
      tag +=  `<textarea rows="2" class="form-control answerModifiedText" data-parent="${parent}" style="resize: none;">${contentVal}</textarea>`;
      tag += '</div>';
      tag += '</div>';
      tag += `<button type="button" class="butn-style2 modAnsSbmBtn" data-qno="${qno}">수정</button>`;
      tag += `<button type="button" class="butn-style2 cancelModSbmBtn" >취소</button>`;
      div.children[2].innerHTML = tag;

}
if(e.target.classList.contains('modAnsSbmBtn')){
  let textVal = document.querySelector('.answerModifiedText').value;
  let qnoVal = e.target.dataset.qno;
  let parent = document.querySelector('.answerModifiedText').dataset.parent;
  const div = e.target.closest('div')
  if(textVal == '') {
    alert('수정 내용을 입력하세요');
    textVal.focus();
    return false;
  }else{
    const questionData = {
      qno: qnoVal,
      content: textVal
    };
    questionUpdateToServer(questionData).then(result => {
      if(parseInt(result)){
        alert('답변이 수정되었습니다.');
        textVal = "";       
      }
      div.innerHTML = `<div class="contentVal">${questionData.content}</div>`;
    });
  }
}
if(e.target.id == 'moreBtn'){
  e.preventDefault();
  const pnoVal = document.getElementById('pnoVal').innerText;
  const page = e.target.dataset.page;
  console.log("페이지", page);
  getQuestionList(pnoVal, parseInt(page));
}
});

async function spreadAnswerFromServer(parent) {
  try {
      const resp = await fetch('/question/'+parent); 
      const answerVO = await resp.json();
      return await answerVO; 
  } catch (error) {
    console.log(error);
  }
}