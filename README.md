# 시공, 시흥시의 장소를 내 손에서 쉽게 빌리자

시흥시 장소 대여 웹사이트 [시소](https://share.siheung.go.kr/index.do)에 대한 안드로이드/iOS 크로스 플랫폼 이식 프로젝트입니다.

<br/>

<div>
<img src = "https://user-images.githubusercontent.com/103064352/230726357-e07cd04b-d83a-48d6-afdf-4ec3f0d7ea59.png" width = "20%" height = "20%" />
<h4> PlayStore [링크] <a>(https://play.google.com/store/apps/details?id=org.tukorea.seegong_flutter)</a> <h4/>

</div>




## 프로젝트 소개
- ### 어떤 시설이 있는지 내 손안에서 쉽게 보세요
    - 대여를 원하는 시설의 카테고리를 먼저 선택하고, 시설들 목록을 간단한 정보와 함께 조회하세요
    
<br/>

- ### 쓰고 싶은 장소를 바로바로 예약하세요
    - 장소의 상세 정보를 조회한 후에 예약 신청을 손쉽게 수행할 수 있습니다

    
<br/>


- ### 내가 어떤 장소를 빌렸는지 즉시 확인하세요
    - 장소의 예약 내역이 사용자 별로 서버에 저장되어 앱 내부 페이지에서 조회 가능합니다 
    
<br/>

## 기획 및 개발 기간
- ### 2022. 10. 01 ~ 2023. 02. 07

## 사용한 언어/개발 환경/SDK/API

![flutter logo](https://img.shields.io/badge/flutter-02569B?style=flat&logo=flutter)
![dart logo](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart)
![android studio logo](https://img.shields.io/badge/Android_Studio-3DDC84?style=flat&logo=androidstudio&logoColor=white)
![google map logo](https://img.shields.io/badge/Google_Map_SDK-4285F4?style=flat&logo=googlemaps&logoColor=white)
![kakao logo](https://img.shields.io/badge/kakao_login_SDK-FFCD00?style=flat&logo=kakao&logoColor=black)
![firebase logo](https://img.shields.io/badge/firebase-ffca28?style=flat&logo=firebase&logoColor=black)
    
    
      
![getx logo](https://raw.githubusercontent.com/jonataslaw/getx-community/master/get.png)

  

## 시연 영상

![공간-소개](https://user-images.githubusercontent.com/103064352/230341580-802d219a-147c-458d-92e2-c6c610ed573a.gif)
> 초기 화면에서 공간 카테고리 선택을 통해 원하는 장소들의 카테고리 필터링을 통한 조회가 가능합니다.

![날짜-및-시간-지정](https://user-images.githubusercontent.com/103064352/230341229-6f2090e0-4a2b-41c4-b8b8-8504708ccda3.gif)
> [syncfusion_flutter_datepicker](https://pub.dev/packages/syncfusion_flutter_datepicker)와 [time_range](https://pub.dev/packages/time_range)를 통해 원하는 날짜와 시간 선택이 가능합니다.

![도움말](https://user-images.githubusercontent.com/103064352/230345680-e7ebe8b4-b1d8-48af-9b7d-7e82e0604147.gif)
> [webview_flutter](https://pub.dev/packages/webview_flutter)를 통해 기존 [시소](https://share.siheung.go.kr/index.do) 사이트의 공지사항 조회가 가능합니다.

![소셜로그인](https://user-images.githubusercontent.com/103064352/230344767-44cbdfb3-c14e-46ca-abb4-5f5a44f80d5d.gif)
> [kakao_flutter_sdk_user](https://pub.dev/packages/kakao_flutter_sdk_user)를 통해 카카오 계정 OAuth 로그인을 지원합니다.

## 시스템 설계
![아키텍처](https://user-images.githubusercontent.com/42719337/230725558-dd836896-e2eb-4e33-b7fd-b4c523b016fc.png)
  
## 서버 소개
- 상황
    - 실제 서비스의 서버 활용 불가 (서버 API 활용 불가)
    - 실제 서비스의 DB전부 활용 어려움
 
- 개발
    - 실제 서비스하는 DB를 훑고 필요한 부분 개발
    - 임시로 활용할 [Google FireBase](https://firebase.google.com/?hl=ko)활용하여 개발
  
  
## DB구축
### fireBase의 Realtime Database를 활용하여 NoSQL 임시 데이터 베이스 구축
- [전체 사진](https://user-images.githubusercontent.com/103064352/230302426-f0c5f7bd-243f-43e2-9ead-bac36686322a.png)
- 공간 소유주 개인정보
<img width="586" alt="스크린샷 2023-04-06 오후 5 50 23" src="https://user-images.githubusercontent.com/103064352/230326338-b315187a-e1c5-4a5b-9ee9-5c4e8e3f262b.png">

- 사용자 개인정보
<img width="1051" alt="스크린샷 2023-04-06 오후 5 51 50" src="https://user-images.githubusercontent.com/103064352/230326043-6cbc24b0-39c2-48a5-ac7e-817f24bb3e00.png">

- 사용자 예약 정보
<img width="414" alt="스크린샷 2023-04-06 오후 5 56 26" src="https://user-images.githubusercontent.com/103064352/230327543-57e44fff-692c-43c1-b91e-9f59039d3ee7.png">

## MVVM

- 장점
  - 뷰와 비즈니스 로직의 분리
  - 뷰의 비대화 문제 해결

- 적용
  - View
    - VM을 통해 Model과 상호작용
    - LoginScreen, NavigationMenu, SpaceListScreen 등 디스플레이에 표시되는 화면
  - View Model
    - 계정, 지도, 공간 데이터 관리
  - Model
    - 서버에서 json으로 받아온 데이터를 저장
    - VM을 통해 업데이트
