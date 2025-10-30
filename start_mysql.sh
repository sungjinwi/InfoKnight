#!/bin/bash

# 1. 스크립트에서 사용할 컨테이너 이름 변수 지정
CONTAINER_NAME="my-mysql"

# 2. 컨테이너의 현재 상태('running', 'exited')를 확인
#    컨테이너가 없으면 '2>/dev/null'에 의해 에러가 무시되고 STATUS 변수는 비어있게 됨
STATUS=$(docker inspect -f '{{.State.Status}}' $CONTAINER_NAME 2>/dev/null)

if [ "$STATUS" == "running" ]; then
    # 3-1. (상태 1: 실행 중)
    echo "MySQL 컨테이너($CONTAINER_NAME)가 이미 실행 중입니다. 바로 접속합니다."
    # 이미 실행 중이므로 sleep이 필요 없음

elif [ "$STATUS" == "exited" ]; then
    # 3-2. (상태 2: 중지됨)
    echo "중지된 MySQL 컨테이너($CONTAINER_NAME)를 시작합니다..."
    docker start $CONTAINER_NAME
    echo "서버가 준비될 때까지 5초간 기다립니다..."
    sleep 5 # 이미 생성된 컨테이너를 재시작하는 것은 초기화보다 빠름

else
    # 3-3. (상태 3: 존재하지 않음)
    echo "MySQL 컨테이너($CONTAINER_NAME)를 새로 생성합니다..."
    docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --name $CONTAINER_NAME mysql
    
    echo "서버 초기화(DB 생성)를 위해 10초간 기다립니다..."
    sleep 10 # 새 컨테이너는 DB 초기화 시간이 필요함
fi

# 4. 컨테이너 IP 주소 추출
HOST_IP=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' $CONTAINER_NAME)

# 5. IP 주소를 잘 가져왔는지 확인
if [ -z "$HOST_IP" ]; then
    echo "오류: $CONTAINER_NAME 컨테이너의 IP 주소를 가져올 수 없습니다."
    exit 1
fi

echo "확인된 IP: $HOST_IP"

# 6. MySQL 클라이언트 접속
echo "MySQL 클라이언트에 접속합니다..."
# 한글 지원 임시 접속 터미널 실행
docker run -it --rm -e LANG=C.UTF-8 mysql mysql -h"${HOST_IP}" -uroot -p --default-character-set=utf8mb4