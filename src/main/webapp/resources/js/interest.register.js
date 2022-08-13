async function registerInterestToServer(itData){
    console.log(itData);
    try {
      const url = '/interest/register';
      const config = {
        method: 'post',
        headers: {
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: JSON.stringify(itData)
      };
      const resp = await fetch(url, config);
      const result = await resp.text();
      return result;  
    } catch (error) {
      console.log(error);
    }  
  }

  if(document.getElementById('itSbmBtn') != null){

    document.getElementById('itSbmBtn').addEventListener('click', (e) => {
        let itData = {
            mno : document.getElementById('mnoVal').innerText,
            pno : document.getElementById('pnoVal').innerText
        };
        registerInterestToServer(itData).then(result => {
            if(parseInt(result)) {
                location.reload();
            }
        });
    });
};

  async function interestRemoveFromServer(itData) {
    try {
      const url = "/interest/remove";
      const config = {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: JSON.stringify(itData)
      };
      const resp = await fetch(url, config);
      const result = await resp.text();
      return result;
    } catch (error) {
      console.log(error);
    }
  }



if(document.getElementById('itDelBtn') != null){

    document.getElementById('itDelBtn').addEventListener('click', (e) => {
      let itData = {
        mno : document.getElementById('mnoVal').innerText,
        pno : document.getElementById('pnoVal').innerText,
        readCk : document.getElementById('readCk').innerText
    };
        interestRemoveFromServer(itData).then(result => {
            if(parseInt(result)){
                location.reload();
            }
        });
    });
};