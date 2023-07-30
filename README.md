# My-app

팀 프로젝트에 사용한 모놀로식 어플리케이션과 MSA 리팩토링 된 어플리케이션 입니다. 

작동 순서 

1. EKS 클러스터를 먼저 배포해주세요 (EKS cluster repo 를 참조해주세요) https://github.com/Minki-An/eks-cluster

2. 로드밸런서 컨트롤러, 서비스 어카운트 , OIDC 연결 , iam policy 부착이 완료되어있어야 합니다.

3. 데이터베이스 또한 구축 되어 있어야 하며, 예제 스크립트는 추후에 올리도록 하겠습니다.  

4. store 어플리케이션을 도커 이미지로 빌드 후 ECR 로 Push 해주세요

5. 매니패스트의 store service, deployment, ingress 를 배포해주세요 (deployment image 수정)

6. ingress 배포시 생성된 로드밸런서 주소를 order/app.py , frontend/templates/index.html 의 url 부분을 대체해주세요

7. frontend order user 세 어플리케이션을 빌드 후 ECR 로 push 해주세요

8. 다시 매니패스트로 돌아가 frontend order user 의 service, deployment, ingress 를 모두 배포해주세요 (이미지 태그 수정 해주세요)

9. 그 상태로 로드밸런서 주소로 접속하면 데이터 정보를 가져오지 못 할 것입니다.

10. 로드밸런서의 리스너 규칙을 수정해주셔야 합니다
    - 우선순위 1번인 /* 규칙을 / 으로 수정해주세요
    - 규칙을 추가해 주세요 (경로기반 , /* , 타겟 frontend 쿠버네티스 파드, 우선순위 5)

11. 이제 정상적으로 작동할 것입니다.  
