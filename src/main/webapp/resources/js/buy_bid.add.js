document.getElementById('flexCheckDefault').addEventListener('click', (e) => {
    const addBtn = document.getElementById('addBtn');
    if (document.getElementById('flexCheckDefault').checked) {
        addBtn.disabled = false;
    } else {
        addBtn.disabled = true;
    }
});

document.getElementById('addBtn').addEventListener('click', (e) => {
    document.getElementById('bidPrice').value = document.getElementById('bidPriceVal').value;
    document.getElementById('bidAddForm').submit();
});