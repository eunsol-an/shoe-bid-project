document.getElementById('reportRemove').addEventListener('click', (e) => {
    e.preventDefault();
    const rpnoVal = document.getElementById('rpnoVal').innerText;
    document.getElementById('rpno').value = rpnoVal;
    const delForm = document.getElementById('reportRmForm');
    delForm.setAttribute('action', '/report/remove');
    delForm.submit();
});