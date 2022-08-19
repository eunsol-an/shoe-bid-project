document.getElementById('regBtn').addEventListener('click',()=>{
    let mainImg = document.getElementById('mainFileAttached');
    let subImg = document.getElementById('fileAttached');
 
    console.log(mainImg.value);
    console.log(subImg.value);
    if(mainImg.value.length >0 && subImg.value.length>0){
        document.getElementById('formTag').submit();
    } else if(mainImg.value.length ==0 && subImg.value.length==0){
        document.getElementById('formTag').submit();
    } else{
        document.getElementById('errorMsg').innerText="대표이지미 또는 서브이미지 변경 시 모든 이미지를 추가해주세요."
        return false;
    }

})