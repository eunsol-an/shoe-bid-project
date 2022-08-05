document.getElementById('memberRemove').addEventListener('click', (e) => {
e.preventDefault();
const mnoVal = document.getElementById('mnoVal').value;
console.log(mnoVal);
document.getElementById('membernum').value = mnoVal;
console.log(mnoVal);
const delForm = document.getElementById('memberRmForm');
delForm.setAttribute('action', '/member/remove');
delForm.submit();
});