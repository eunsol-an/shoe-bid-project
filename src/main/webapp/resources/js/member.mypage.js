document.getElementById('memberRemove').addEventListener('click', (e) => {
e.preventDefault();
const mnoVal = document.getElementById('mnoVal').value;
document.getElementById('membernum').value = mnoVal;
const delForm = document.getElementById('memberRmForm');
delForm.setAttribute('action', '/member/remove');
delForm.submit();
mnoVal.substring(mnoVal.lastIndexOf(":"))
});