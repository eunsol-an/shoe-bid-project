document.addEventListener('DOMContentLoaded', printReviewList);

function cutSecond(regAt) {
    return regAt.substring(0, regAt.lastIndexOf(" "));
}

// 서버로부터 리뷰 리스트 받아오기
async function getReviewListFromServer(mno, pageNo) {
    try {
        const resp = await fetch("/review/list/" + mno + "/" + pageNo);
        const pagingHandler = await resp.json();
        return await pagingHandler;
    } catch (error) {
        console.log(error);
    }
}

function spreadReviewList(result) {
    document.getElementById('reviewQty').innerText = ` (${result.totalCount})`;
    for (const rvvo of result.reviewList) {
        let html = `<tr class="bg-transparent">
                        <td>
                            <div class="text-warning">`;
                            for (let i = 0; i < `${rvvo.score}`; i++) {
                                html += `<i class="fas fa-star"></i>`;
                            }
                            for (let i = 0; i < `${5 - rvvo.score}`; i++) {
                                html += `<i class="far fa-star"></i>`;
                            }
                    html += `</div>
                            <h3 class="mt-2">${rvvo.score }/5</h3>
                        </td>
                        <td class="text-start">
                            <a href="/product/detail?pno=${rvvo.pno }&mno=0" class="h6">[상품명] ${rvvo.pname }</a>
                            <div class="mt-3">${rvvo.content }</div>
                        </td>
                        <td>
                            <div>${rvvo.sendNick }</div>
                            <small>${cutSecond(rvvo.regAt)}</small>
                        </td>
                    </tr>`;
        document.getElementById('reviewZone').innerHTML += html;
    }
    if (result.pgvo.pageNo < parseInt(Math.ceil(result.totalCount / 10.0))) {
        let moreBtnZone = document.getElementById('moreBtnZone');
        moreBtnZone.innerHTML = '';
        moreBtnZone.innerHTML += `<button type="button" class="btn btn-outline-secondary moreBtn" data-page="${result.pgvo.pageNo}">MORE +</button>`;
    } else {
        document.getElementById('moreBtnZone').innerHTML = '';
    }
}

// 리뷰 리스트 출력하기
function printReviewList() {
    let pvoWriter = document.getElementById('pvoWriter').innerText;
    const reviewTable = document.getElementById('reviewTable');
    const reviewEmpty = document.getElementById('reviewEmpty');
    getReviewListFromServer(pvoWriter, page=1).then(result => {
        document.getElementById('reviewZone').innerHTML = '';
        if (result.reviewList.length > 0) {
            reviewEmpty.style.display = 'none';
            reviewTable.style.display = 'table';
            spreadReviewList(result);
        } else {
            reviewEmpty.style.display = 'block';
            reviewTable.style.display = 'none';
        }
    });
}

document.addEventListener('click', (e) => {
    if (e.target.classList.contains('moreBtn')) {
        e.preventDefault();
        let pageNo = parseInt(e.target.dataset.page) + 1;
        let pvoWriter = document.getElementById('pvoWriter').innerText;
        getReviewListFromServer(pvoWriter, pageNo).then(result => {
            if (result.reviewList.length > 0) {
                spreadReviewList(result);
            }
        })
    }
});