document.getElementById("productRemove").addEventListener("click",(e)=>{
    e.preventDefault();
    
    const pnoVal = document.getElementById('pnoVal').innerText;
    document.getElementById('pno').value = pnoVal;
    const delForm = document.getElementById('productRmForm');
  delForm.setAttribute('action', '/product/remove');
  delForm.submit();
  pnoVal.substring(pnoVal.lastIndexOf(":"))
})


document.addEventListener("click",(e)=>{
if(e.target.classList.contains("xzoom-gallery5")){
    let mainImageZone = document.getElementById('xzoom-magnific');
    let subimgSrc =e.target.getAttribute("src").toString();
    mainImageZone.src=subimgSrc;
    console.log(mainImageZone)
    console.log(subimgSrc)
}
})

document.addEventListener("click",(e)=>{
   if(e.target.classList.contains('modBtnFake')){
document.getElementById("modBtn").click();
   }
});


async function  updateProductStatus(statusData){
try {
  const url = "/product/" + statusData.pno;
        const config = {
            method: 'PUT', // PATCH도 가능
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(statusData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
  
} catch (error) {
  console.log(error);
}
}

function stringNumberToInt(stringNumber){
  return parseInt(stringNumber.replace(/,/g , ''));
}

function formatTime(time) {
    return time <10 ? '0' + time : time
}
let timeInterval = setInterval( function time() {
      const endTimeVal= document.getElementById("endTime").innerText
      const now = new Date();
      const endTime = new Date(endTimeVal);
      const dday = (endTime.getTime()- now.getTime()) / 1000 ;
      
      const days =Math.floor(dday / 3600 / 24);
      const hours = Math.floor(dday / 3600) % 24;
      const minutes = Math.floor(dday / 60)%60;
      const seconds = Math.floor(dday)%60;
      document.getElementById("days").innerText = formatTime(days);
      document.getElementById("hours").innerText= formatTime(hours);
      document.getElementById("minutes").innerText= formatTime(minutes);
      document.getElementById("seconds").innerText= formatTime(seconds);
    if(now > endTime){
        clearInterval(timeInterval);
       document.getElementById("timeBoard").innerHTML =`<li><span  id="days">상품경매가 종료되었습니다</span></li>`;

      

      let maxPriceVal =stringNumberToInt(document.getElementById("maxPrice").innerText)
      let statuVal= maxPriceVal >0 ? 1 : 2;
      console.log(maxPriceVal)
      let pnoVal = document.getElementById("pnoVal").innerText;
      const statusData ={
        pno:pnoVal,
        highestPrice: maxPriceVal.toString(),
        status:statuVal
      }
      updateProductStatus(statusData).then(result =>{
        if(result>0){
          if(document.getElementById("bidModal")!=null&& document.getElementById("interestBtn")!= null){
            document.getElementById("bidModal").remove()
            document.getElementById("interestBtn").remove()
          }
        }
      })
    }
}, 1000);

document.getElementById('flexCheckDefault').addEventListener('click', (e) => {
  const addBtn = document.getElementById('addBtn');
  if (document.getElementById('flexCheckDefault').checked) {
      addBtn.disabled = false;
  } else {
      addBtn.disabled = true;
  }
});

if(document.getElementById('bidModal') != null) {
  document.getElementById('bidModal').addEventListener('click', (e) => {
    let reservePrice =stringNumberToInt(document.getElementById("reservePriceVal").innerText);
    let maxPrice =stringNumberToInt(document.getElementById("maxPrice").innerText);
      document.getElementById("bidPriceVal").value = maxPrice > 0? maxPrice+parseInt(1000) : reservePrice+parseInt(1000)
  });
}

document.getElementById('addBtn').addEventListener('click', (e) => {
  let bidPrice = stringNumberToInt(document.getElementById("bidPriceVal").value);
  let reservePrice =stringNumberToInt(document.getElementById("reservePriceVal").innerText);
  let maxPrice =stringNumberToInt(document.getElementById("maxPrice").innerText);
  console.log(bidPrice)
  console.log(reservePrice)
  console.log(maxPrice)
if(bidPrice > reservePrice+parseInt(999)){
  if(bidPrice > maxPrice+parseInt(999)){
    document.getElementById('bidAddForm').submit();
  }else{
    document.getElementById("errorMsg").innerText = maxPrice+parseInt(1000)+" 보다 높은 입찰가를 입력해주세요"
    document.getElementById("bidPriceVal").value ='';
    document.getElementById("bidPriceVal").focus();
  }
}else{
  document.getElementById("errorMsg").innerText = reservePrice+parseInt(1000)+" 시작가 보다 높은 입찰가를 입력해주세요";
  document.getElementById("bidPriceVal").value ='';
  document.getElementById("bidPriceVal").focus();

}
});