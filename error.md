# 오류로그 정리

## java.lang.IllegalArgumentException: Not a directory
```
MultipartRequest를 이용한 파일 경로 문제이다.
```
장소별로 프로젝트 옮기고 붙이며 경로가 잘못 지정되었는데   
**해당 경로에 필요한 폴더를 만들거나 작업 경로를 맞춰주면 된다.**

## java.lang.NoClassDefFoundError
```
클래스를 찾지 못할 때 발생한다.
```
작업물을 옮기려다가 삭제해서 다른 곳으로 옮기고 복구시키는 작업 중에 발생했기 때문에 처음엔 경로가 맞지 않는 줄 알았다.   
클래스를 찾아봐도 되지 않았는데 라이브러리의 호환성이 맞지 않아도 발생한다. **Build path로 버전을 맞춰주면 된다**
<hr>

> ### <경로가 문제인 줄 알았을 때 Context Path를 변경하려다 찾은 정보>   
`Context Path`는 프로젝트 생성 시 `server.xml`에 추가되어 서버 구동 시 자동으로 잡히는 경로이다.  
WAS에서 웹 애플리케이션을 구분하기 위한 경로로, 프로젝트명의 URL호스트와 포트명 다음에 나온다.  
집에서 작업 중이었는데 학원작업의 경로가 나오길래 이걸 변경하려고 했다.    
그럴 경우엔 프로젝트 설정의 Context root를 바꾸고 톰캣을 삭제 후 서버에서 재추가해 실행시키거나,   
서버 `werver.xml` 파일의 Context태그의 path 값을 변경하면 된다.   

## java.io.IOException: Posted content type isn't multipart/form-data
```
enctype="multipart/form-data" 가 없으면 발생한다.
```
해당 폴더에 같은 이름의 파일이 있어서 생기는 문제인 줄 알았다. `"multipart/form-data"`를 추가하면 된다.

## Publising to Tomcat v8.5 Server at localhost...' has encountered a problem.   
Could not publish server configuratiln for Tomcat v8.5 Server at localhost
```
다른 서버에 톰캣이 돌아가고 있어서 포트 충돌이 생길 때 발생한다.
```
server - server.xml에서 Context 태그에서 **중복된 프로젝트 중 하나를 지워주면 된다.**




