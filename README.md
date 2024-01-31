# GPT ChatBot Project

## 📋 개요

OpenAI API를 이용한 챗봇 프로젝트

### 🙋 팀원

| 프로필 사진 | <a href="https://github.com/bamsak"><img src="https://avatars.githubusercontent.com/u/114239407?v=4" width="90" height="90"></a> | <a href="https://github.com/JinUng41"><img src="https://avatars.githubusercontent.com/u/91656206?v=4" width=90></a> | 
| ---- | ---------- | --------- | 
| in Github | [@bamsak](https://github.com/bamsak) | [@JinUng41](https://github.com/JinUng41) 
| in SeSAC | 밤삭 | 벨로

### 🗓️ 기간

24.01.02 ~ 24.01.26

### 📁 프로젝트 파일 구조

```
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── RoomList
│   ├── Controllers
│   │   └── GPTRoomListViewController.swift
│   └── ViewModel
│       └── GPTRoomListViewModel.swift
├── Chat
│   ├── Controllers
│   │   └── GPTChatViewController.swift
│   ├── ViewModels
│   │   └── GPTChatViewModel.swift
│   └── Views
│       ├── ChatBubbleView.swift
│       ├── MessageCell.swift
│       ├── MessageContentConfiguration.swift
│       └── MessageContentView.swift
├── Utilities
│   ├── CoreData
│   │   ├── CoreDataManager
│   │   │   ├── Implementation
│   │   │   │   └── CoreDataManager.swift
│   │   │   └── Interface
│   │   │       └── DataManagable.swift
│   │   └── DataHandler
│   │       ├── ChatRoomDataHandler.swift
│   │       ├── MessageDataHandler.swift
│   │       └── Model
│   │           ├── ChatMessage.swift
│   │           └── ChatRoom.swift
│   ├── Network
│   │   └── NetworkManager.swift
│   └── ServiceProvider
│       ├── Implementation
│       │   └── ServiceProvider.swift
│       └── Interface
│           └── ServiceProvidable.swift
├── Models
│   ├── API
│   │   ├── APIEndPoint
│   │   │   ├── Implementation
│   │   │   │   └── GPTEndPoint.swift
│   │   │   └── Interface
│   │   │       └── APIEndPoint.swift
│   │   ├── Error
│   │   │   └── APIError.swift
│   │   └── HTTPMethod.swift
│   ├── CoreData
│   │   ├── DataModel.xcdatamodeld
│   │   │   └── DataModel.xcdatamodel
│   │   │       └── contents
│   │   ├── MessageEntity+CoreDataClass.swift
│   │   ├── MessageEntity+CoreDataProperties.swift
│   │   ├── RoomEntity+CoreDataClass.swift
│   │   └── RoomEntity+CoreDataProperties.swift
│   ├── DTOs
│   │   ├── Implementation
│   │   │   ├── Common
│   │   │   │   └── GPTMessageDTO.swift
│   │   │   ├── GPTRequestDTO.swift
│   │   │   └── GPTResponseDTO.swift
│   │   └── Interface
│   │       └── RequestEncodable+RequestDecodable.swift
│   └── Messages
│       ├── Implementation
│       │   ├── AssistantMessage.swift
│       │   ├── SystemMessage.swift
│       │   └── UserMessage.swift
│       └── Interface
│           └── GPTMessageable.swift
├── Protocols
│   ├── DataDecodable.swift
│   ├── DataEncodable.swift
│   └── URLSessionProtocol.swift
├── Extensions
│   ├── Bundle+Extension.swift
│   ├── Date+Extension.swift
│   ├── GPTChatRoomViewController+Extension.swift
│   ├── JSONDecoder+Extension.swift
│   ├── JSONEncoder+Extension.swift
│   ├── UITextView+Extension.swift
│   └── URLSession+Extension.swift
│
└── Resources
    ├── Assets.xcassets
    │   ├── AccentColor.colorset
    │   │   └── Contents.json
    │   ├── AppIcon.appiconset
    │   │   └── Contents.json
    │   └── Contents.json
    ├── Base.lproj
    │   └── LaunchScreen.storyboard
    └── Info.plist

```
### 동작 화면
| 채팅방 생성 | CoreData 저장 | 최근 대화순 | 채팅방 삭제|
|-----------|---------|-----------|-----------|
|![채팅방 생성](https://github.com/tasty-code/ios-chat-bot/assets/91656206/20ac62b3-4f85-4998-8be8-e6ccc8ef64e9)|![CoreData 저장](https://github.com/tasty-code/ios-chat-bot/assets/91656206/fc35d7cb-1a0a-4178-9bc9-e4bbd469aa55)|![최근 대화순](https://github.com/tasty-code/ios-chat-bot/assets/91656206/3c304828-41c3-4e66-becf-3fcceaa8f9c1)|![삭제후재실행](https://github.com/tasty-code/ios-chat-bot/assets/91656206/028789c4-486b-44e3-a947-fcfe79fcf36f)

## 🧐 객체의 역할

### View & ViewModel

---

### RoomList

- **GPTRoomListViewController**
    - `final class`
    - 사용자의 채팅 리스트를 보여주며, 새로운 채팅이나 기존 채팅방으로 navigationController를 통해 입장
- **GPTRoomListViewModel**
    - `final class`
    - dataHandler객체와 협력하여 Coredata에서 꺼내온 데이터를 View에 보여주는 역할

### Chat

- **GPTChatViewController**
    - `final class`
    - 사용자의 GPT와의 채팅을 보여주는 View
    - ModernCellConfiguration를 사용하여 입력받은 메세지를 Collection View에 보여줌.
- **GPTChatViewModel**
    - `final class`
    - serviceProvider및 dataHandler와 협력하여 View에 보여질 message데이터를 가공하고, CoreData에 저장.

### Utilities

---

### Network

- **NetworkManager**
    - `final class`
    - URLRequest를 통해 Data타입으로 반환해주며, 네트워크 통신을 해주는 객체
- **ServiceProvidable**
    - `protocol`
    - APIEndPoint를 입력받아 API 통신을 하며, 결과인 Decodable을 반환하기 위한 프로토콜 정의
- **ServieceProvider**
    - `final class`
    - ServiceProvidable 구체 구현타입.
    - NetworkManager와, DataEncodable, DataDecodable을 채택한 객체와 협력하여,
    APIEndPoint를 받아 앱 내부에서 사용될 모델로 변환하여 반환하는 역할

### CoreData (CoreDataManager, DataHandler)

- **CoreDataManager**
    - `final class`
    - NSPersistentContainer를 관리하는 **Singleton** 객체
- **ChatRoomDataHandler** & **MessageDataHandler**
    - `final class`
    - CoreDataManager를 주입받고, context에 채팅방 또는 채팅 메세지를 생성, 삭제를 수행하는 객체

### Models

---

### API

- **APIEndPoint**
    - `protocol`
    - API 통신에 필요한 요구사항을 정의
    - URLRequest 및 URL로 변환이 가능함.
- **GPTEndPoint**
    - `enum`, `APIEndPoint`
    - OpenAI API의 내용을 가지는 모델

### NetworkingDTO

- **GPTRequestDTO** & **GPTResponseDTO**
    - `struct`, `Encodable` / `Decodable`
    - 각각 API 통신에 Request와 Response에 쓰이는 모델
    - 각각의 인코딩, 디코딩 방식을 직접 정의
- **GPTMessageDTO**
    - `struct`, `Codable`
    - API 통신에서 Request와 Response 모두 필요한 하위 모델
    - 실질적 데이터인 메세지에 해당함.

### Presentation

- **ChatRoom**
    - `struct`
    - CoreData로부터 얻은 데이터(채팅방 리스트)를 뷰에 보여주기 위한 모델
- **ChatMessage**
    - `struct`
    - CoreData, URLSession으로부터 얻은 데이터(채팅 메세지)를 뷰에 보여주기 위한 모델

## ⭐ 주요 구현 사항

### MVVM

- 클로저와 `didSet`을 이용한 **데이터 바인딩**

### Model Design

- API 통신의 Request와 Response를 위한 데이터 모델 설계
- `CodingKeys` 프로토콜의 활용

### URLSession

- **Swift Concurrency**을 이용한 API 통신
- API 엔드 포인트를 위한 **프로토콜 추상화** 및 해당 프로토콜을 채택하는 `enum` 설계

### CollectionView

- **Modern Cell Configuration** (`UIContentConfiguration`)
- 테이블뷰의 기능과 마찬가지로 **ListCell**을 이용한 **셀 삭제** 구현
- `CellRegistration` & `DiffableDataSource`

### Core Graphics & Animation

- `CALayer` + `CAKeyframeAnimation`을 이용한 메세지 로딩 애니메이션 구현
- `CAShapeLayer` + `UIBezierPath`를 이용한 말풍선 구현

### CoreData

- `NSPersistentContainer`을 관리하는 싱글톤 객체
- 싱글톤 객체를 이용한 채팅방 **리스트와 채팅을 저장, 삭제** 구현

## 🌠 Trouble Shooting

### 범용적인  ServiceProvider를 위한 APIEndPoint

이전 방식은 ServiceProvider를 OpenAI API에 종속된 ServiceProvider였습니다. 프로토콜로 추상화가 되어 있다고 하지만, 만약 앱에서 사용되는 API가 늘어남에 따라 ServiceProvider를 새로 구현 해야 했습니다.

ServiceProvider가 General한 작업을 하는 성격을 가지게 하기 위해 기존에 excute메소드에서 requestDTO타입을 파라미터로 받는 대신, API 통신에 필요한 EndPoint를 APIEndPoint 프로토콜로 추상화하는 작업을 거쳤습니다. 

ServiceProvider의 excute 메소드를 Generic메소드로 구현하여, APIEndPoint의 구현체를 받고 Decodable타입으로 반환하도록 하였습니다.

이렇게 함으로서, ServiceProvider가 어떤 APIEndPoint에도 대응이 가능한 객체가 되었습니다.

### 네트워크 통신을 위한 DTO와 Diffable DataSource를 통해 View에 보여질 모델 분리

개발 중반까지 초기 API 통신을 위해 Encodable, Decodable을 위한 DTO 모델을 정의하고 해당 모델을 바탕으로 뷰에 보여지고 있었습니다. API 문서에서 요구하는 내용 이외에 DiffableDataSource를 위해서 UUID를 추가로 가지게 해야 했고, DTO 모델의 내용을 변경하게 되었습니다. 게다가 NSSet으로 저장되는 CoreData의 특성을 위해 메세지의 순서를 보장하고자 추가로 Date를 가지도록 구현해야 했습니다.

하지만 이러한 모델 구현 방식에 의구심을 느끼게 되었습니다. 개발이 고도화됨에 따라 추가적으로 필요한 데이터에 DTO가 변화되어야 한다면, Network Layer부터 Presentation Layer까지 많은 객체들이 DTO 하나에 많은 의존 관계를 가지게 되어, 객체 간의 유연성이 좋지 못하다고 판단하였습니다.

따라서 Network Layer에서 사용하는 DTO와 별개로 Presentation Layer에서 사용할 모델을 추가로 정의하여 Layer간에 의존성을 낮추게 되었습니다.

## 🧏 지난 PR 기록들
[AI 챗봇 앱 [STEP 1] 벨로, 밤삭 by bamsak · Pull Request #5 · tasty-code/ios-chat-bot](https://github.com/tasty-code/ios-chat-bot/pull/5)

[AI 챗봇 앱 [STEP 2-1] 벨로, 밤삭 by JinUng41 · Pull Request #9 · tasty-code/ios-chat-bot](https://github.com/tasty-code/ios-chat-bot/pull/9)

[AI 챗봇 앱 [STEP 2-2] 벨로, 밤삭 by JinUng41 · Pull Request #18 · tasty-code/ios-chat-bot](https://github.com/tasty-code/ios-chat-bot/pull/18)

[AI 챗봇 앱 [STEP 3] 벨로, 밤삭 by bamsak · Pull Request #20 · tasty-code/ios-chat-bot](https://github.com/tasty-code/ios-chat-bot/pull/20)

[AI 챗봇 앱 [STEP 4] 벨로, 밤삭 by JinUng41 · Pull Request #29 · tasty-code/ios-chat-bot](https://github.com/tasty-code/ios-chat-bot/pull/29)
