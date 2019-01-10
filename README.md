# 푸드파이터
음식을 정복한다 😃  
> 먹을 일정들을 기록하고 먹었던 일정은 자동으로 기록된다.

## 개발
- Language: Swift
- Tool: Xcode
- library: RealmSwift, RevealingSplashView

### Realm을 선택한 이유
개인 프로젝트 ‘SEEFOOD’<https://github.com/kimhyeri/SeeFood>를 통해 SQLite, Realm , Coredata, UserDefault와 
같은 로컬 데이터베이스들의 특징을 파악한 후 다방면에서 이점이 있다고 생각된 Realm을 푸드파이터 로컬 데이터베이스로 선택함. 

### Realm 선택 결과
* Realm은 디비 설계가 간편함.
* 빠르게 성장하는 모바일 DataBase. (오픈소스) = 모바일을 위한 것으로 효율적으로 사용 가능.
* C++ 기반의 크로스 플랫폼.
* 쓰레드 암호화 등 다양한 기능 지원.
* Object 상속 사용 가능.
* 기존 ORM은 복사 필요 Realm은 불필요 - in memory 방식 사용.

### Architecture
> MVC  
(Model - View - Controller)

### Example DB
> main database model example
  
```
class MainList : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var descript : String = ""
    @objc dynamic var image : Int = 0
    @objc dynamic var done : Bool = false
    @objc dynamic var createdTime : Date? 
}
```

## App store
<a href="https://itunes.apple.com/us/app/%ED%91%B8%EB%93%9C%ED%8C%8C%EC%9D%B4%ED%84%B0/id1419747262?mt=8"><img src="./screenshot/AppStore.png" width="170" height="58"></a>

## Version 1.2
> 색상 변경, 카테고리 아이템 변경

## Screen 📸 
![텍스트목록](./screenshot/screen.png)
