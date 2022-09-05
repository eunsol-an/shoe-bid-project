# 신발 경매는? 슈비드에서!
![gitbg](https://user-images.githubusercontent.com/87196958/188445356-3096ffbd-5744-4167-8c42-b32345e11e94.png)

## 👟 Introduction

**슈비드(SHOE-BID)** 는 개인의 신발을 경매로 사고 팔 수 있는 서비스입니다.
<br/>
<br/>

## 📝 Summary

-   슈비드는 중고 거래에 경매 방식을 더해 신발을 합리적인 가격으로 거래할 수 있는 서비스입니다. 구매자가 구매하고 싶은 가격을 설정해 낙찰받아 거래할 수 있는 경매 개념을 도입하여 다른 중고거래 서비스와 차별화를 두었습니다.
-   판매자는 자신이 판매하려는 가격을 설정한 후 해당 가격을 수용할 구매자가 나타날 때까지 일방적으로 기다리는 시간을 줄일 수 있습니다. 또 구매자는 일방적으로 정해진 가격이 아닌 원하는 가격에 물건을 낙찰받을 수 있습니다.
-   물품 거래를 위한 채팅이 가능하고, 판매자와 구매자는 서로에 대한 리뷰를 작성할 수 있어 신뢰도를 확인할 수 있습니다.

- [슈비드 이용해보기](http://shoebid.shop/)
<br/>

## ⏱ Period

> 2022.07.29 ~ 2022.08.19 (3주)
<br/>

## 📈 ERD
![shoe-bid-erd](https://user-images.githubusercontent.com/87196958/188445497-183cc1a4-66a3-44b1-b434-3ad0f387add3.png)
<br/>
<br/>

## 🛠 Core Tools

**Frontend**

![image](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![image](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) ![image](https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E)

**Backend**

![image](https://img.shields.io/badge/OpenJDK-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white) ![image](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)

**Infrastructure**

![image](https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)

**DB**

![image](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)

**Dev Tools**

![image](https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=eclipse&logoColor=white) ![image](https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=whit) ![image](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white) ![image](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

**Design**

![image](https://img.shields.io/badge/Adobe%20Illustrator-FF9A00?style=for-the-badge&logo=adobe%20illustrator&logoColor=white) ![image](https://img.shields.io/badge/Adobe%20Photoshop-31A8FF?style=for-the-badge&logo=Adobe%20Photoshop&logoColor=black)
<br/>
<br/>

## 💻 Core Tech

### ⏰ Spring scheduler를 이용한 경매 종료 자동화 시스템

-   경매 마감 시간과 현재 시간을 비교하고 스케줄러를 활용하여 경매 상태 자동 업데이트
-   업데이트된 결과는 판매자와 구매자, 각 회원의 마이페이지에서 조회 가능

### 📧 회원간의 1:1 채팅 시스템
    
-   경매가 성사되었을 경우, 판매자와 구매자가 거래 방식에 대한 대화를 나눌 수 있도록 프라이빗한 채팅방 활성화
-   DB를 이용하여 회원 간의 대화가 저장될 수 있도록 구현

### 🏅 회원의 활동에 따라 업데이트 되는 회원 등급 시스템
    
-   트랜잭션 처리를 통해 회원의 활동에 대한 등급 점수를 부여
-   5단계로 나눠진 등급에 따라 회원 등급 자동 승급
<br/>

## 👾 Trouble shooting

### Issue1 - [QnA] 이벤트 위임

**🚨 Situation**
-   비동기 통신을 이용한 QnA 게시판의 특성상, 브라우저에서 같은 기능을 하는 button 태그가 동적으로 추가되는 경우가 많았다. 이때 추가된 태그에는 이벤트가 실행되지 않았다. 또한 div 태그 안에 있는 여러 개의 button 태그를 클릭했을 때, 해당 이벤트의 콜백 함수가 실행되지 않았다.

**💥 Cause**

-   html 태그들이 중첩되어 있고, 동일한 요소에 이벤트가 여러 개 등록되어 있는 구조 때문에 이벤트 제어가 복잡해지고 흐름의 파악이 어려워졌다.

**💡 Solution**

-   button 하나하나에 이벤트를 등록하지 않고, button을 감싸고 있는 div 태그에 이벤트를 등록하였다. querySelector()를 사용하면, 사용자가 button을 클릭했을 때 이벤트 버블링이 일어나 상위에 있는 요소까지 이벤트가 전파되어 콜백 함수가 실행될 수 있다.

### Issue2 - [채팅] 데이터 컨트롤

**🚨 Situation**

-   사용자 간의 채팅 과정 중 본인이 채팅을 보냈음에도 불구하고 데이터베이스에 저장되는 상대방의 mno 값과 본인의 mno 값이 동일하게 저장되는 문제가 발생하였다.

**💥 Cause**

-   처음 채팅 시 데이터베이스에 본인 mno 값과 상대 mno 값이 저장되는데 다시 상대가 채팅을 보낼 경우 상대 입장에서는 본인 mno와 상대 mno 값이 서로 바뀌어서 들어가야 하는 상황이었기 때문이다.

**💡 Solution**

-   데이터베이스에 저장하기 전에 if 문을 사용하여 본인 mno와 로그인한 mno가 같으면 보낸 사람의 mno 값에 넣고 같지 않으면 상대의 mno 값에 넣어 해결하였다.

### Issue3 - [관심 상품] 요소 컨트롤

**🚨 Situation**

-   나의 관심 상품 페이지에서 여러 개의 상품 리스트 중 가장 상단의 상품만 찜 삭제가 되는 문제가 발생하였다.

**💥 Cause**

-   jsp 부분 관심 상품 리스트의 for문 구조에서 첫 상품의 id 값만 가져오는 것이 문제였다.

**💡 Solution**

-   삭제 버튼을 클릭하였을 때 button 태그 안에 비표준 속성(data set)을 사용하여 해당 상품 각각의 id 값을 담아 해결하였다.

### Issue4 - [경매] 상품 마감 처리

**🚨 Situation**

-   경매가 마감된 상품의 리스트를 불러올 경우와 상품 디테일 페이지에서 경매 마감 시간이 지날 경우에 경매 상태를 업데이트하는 분기 처리를 하였다. 그렇지만 마이페이지에서 판매 상품, 구매 상품을 확인할 때 마감 처리 부분은 상품 리스트 또는 상품 디테일을 거친 후에야 분기 처리가 가능했다.

**💡 Solution**

-   상품마다 마감되는 시간이 다른 상황에서 스케줄러를 통해 10초마다 경매가 진행 중인 상품 리스트를 불러와 현재 시간과 마감시간을 비교해 경매 상태를 업데이트하는 로직을 구현하였다.

### Issue5 - [회원] JSTL 문법

**🚨 Situation**

-   아이디 찾기 결과 화면에서 아이디를 출력할 때, 뒤의 3자리를 마스킹 처리하기 위해 jstl에서 substring과 length를 이용하여 다음과 같이 만들었다.
 `${fn:substring(id, 0, length-3) }`
    그러나 length를 인식하지 못하는 문제가 발생했다.

**💥 Cause**

-   jstl로 함수를 작성하면서 length의 대상을 지정해 주지 않았던 것이 원인이었다.

**💡 Solution**

-   id의 length를 구하는 함수를 사용하여 다음과 같이 해결하였다.
`${fn:substring(id, 0, fn:length(id)-3) }`

### Issue6 - [입찰] 쿼리 조건절 위치

**🚨 Situation**

-   회원이 실제로 입찰한 내역과 마이페이지의 입찰 내역이 일치하지 않는 오류가 발생했다. 경매 상태에 따른 필터링을 적용했을 때, 회원이 입찰한 내역이 있음에도 화면에는 내역이 보이지 않았다.

**💥 Cause**

-   페이징을 위해서 from절에 서브쿼리를 이용하여 limit을 적용하였다. 이 서브쿼리 안쪽으로 회원을 특정하는 where 조건절이 포함되어 있지 않았던 것이 원인이었다.

**💡 Solution**

-   회원을 특정하는 where절을 서브쿼리 안쪽으로 이동시켜 해결하였다.
<br/>

## 👨‍💻 Members
| &nbsp;name&nbsp; | work | contact |
|--|--|--|
| [안은솔](https://github.com/eunsol-an) | 프로젝트 일정 관리 / 경매 입찰 CRUD / 거래 후기 CRUD / 이미지 파일 첨부 기능 / Github 관리 / 서버 도메인 연결  | [dev.eunsol@gmail.com](mailto:dev.eunsol@gmail.com) |
| [이우진](https://github.com/woojin999) | 회원 간 1:1 채팅 기능 / 관심상품 CRUD / 신고 게시글 CRUD / ABOUT 메뉴 디자인 | [24864@naver.com](mailto:24864@naver.com) |
| [이운산](https://github.com/Lee-Unsan) | 회원 관련 CRUD / 상품 데이터 수집 | [sleeus1007@naver.com](mailto:sleeus1007@naver.com) |
| [정수연](https://github.com/suyeonese) | 질문 답변 CRUD / 전체 페이지 CSS 구현 | [dev.suyeon@gmail.com](mailto:dev.suyeon@gmail.com) |
| [최성열](https://github.com/sungyeol702) | 경매 상품 CRUD / 경매 종료 스케줄러 구현 / 게시글 검색 필터 | [tjdfuf802@naver.com](mailto:tjdfuf802@naver.com) |
