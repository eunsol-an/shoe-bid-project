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

document.getElementById("modBtnFake").addEventListener("click",(e)=>{
    e.preventDefault();
document.getElementById("modBtn").click();

});
let now = new Date();
let endTime = new Date(document.getElementById("endTime").innerText);
endTime.get