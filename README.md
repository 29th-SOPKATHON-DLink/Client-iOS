# Client-iOS

#  드링크 
> **서비스 한 줄 소개** <br>
> 공동체 모임을 더 특별하게, 
모임을 위한 술자리 기억 공유 플랫폼 드링크
>
> SOPT 29th SOPKATHON <br>
> 프로젝트 기간 : 2021.11.20 ~ 2021.11.21

##  Dlink iOS Developers
 <img src="https://user-images.githubusercontent.com/63277563/142728448-8dddd57d-47cf-4c28-8872-77495c01a6a5.png" width="500"> | <img src="https://user-images.githubusercontent.com/63277563/142728452-9d56017e-30e5-4caf-b412-f323b71faa43.png" width="500"> | <img src="https://user-images.githubusercontent.com/63277563/142728450-f066f30f-c427-4288-9840-592f73c8e98e.png" width="500"> |
 :---------:|:----------:|:---------:|
 🍎 **Kim So Yeon** 🍎| 🍎 **Hong Seung Hyun** 🍎 | 🍎 **Choi Eun Ju** 🍎 | 
모임 만들기 뷰 | 인증하기 뷰 | 메인 뷰 |

##  역할 분담
- 소연 : 모임 만들기 뷰, 화면 flow 연결, 서버 연결 구현
- 승현 : 인증하기 뷰 didset 이용한 개수 +-기능 구현, 서버 연결, 깃 충돌 해결
- 은주 : 메인 상단 뷰 StackView 이용해 구현, 메인 하단 뷰 TableView Xib를 이용해 구현, 리드미 작성

## Foldering Convention

 ```
Dlinnk-iOS
  │
  |── Sources
  │   |── Extensions
  |   |── Protocols
  │   |── Models
  │   |── Components
  │   |── Cells
  │   |── ViewControllers
  │   └── Supports
  │       |── AppDelegate.swift
  │       └── SceneDelegate.swift
  └── Resources
      |── Views
      │   |── Storyboards
      │   |    └── LaunchScreen.storyboard
      │   └── Xibs
      |── Fonts
      |── APIServices
      |── Assets.xcassets
      └── Info.plist
```
<details>
<summary> Code Convention </summary> 

### 들여쓰기 및 띄어쓰기

- 들여쓰기에는 탭(tab) 대신 2개의 space를 사용합니다.
- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.

    ```swift
    let names: [String: String]?
    ```

- 연산자 오버로딩 함수 정의에서는 연산자와 괄호 사이에 한 칸 띄어씁니다.

    ```swift
    func ** (lhs: Int, rhs: Int)
    ```

### 줄바꿈

- 함수 정의가 최대 길이를 초과하는 경우에는 아래와 같이 줄바꿈합니다.

    ```swift
    func collectionView(
      _ collectionView: UICollectionView,
      cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
      // doSomething()
    }

    func animationController(
      forPresented presented: UIViewController,
      presenting: UIViewController,
      source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
      // doSomething()
    }
    ```

- 함수를 호출하는 코드가 최대 길이를 초과하는 경우에는 파라미터 이름을 기준으로 줄바꿈합니다.

    ```swift
    let actionSheet = UIActionSheet(
      title: "정말 계정을 삭제하실 건가요?",
      delegate: self,
      cancelButtonTitle: "취소",
      destructiveButtonTitle: "삭제해주세요"
    )
    ```

    단, 파라미터에 클로저가 2개 이상 존재하는 경우에는 무조건 내려쓰기합니다.

    ```swift
    UIView.animate(
      withDuration: 0.25,
      animations: {
        // doSomething()
      },
      completion: { finished in
        // doSomething()
      }
    )
    ```

- `if let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다.

    ```swift
    if let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
      let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
      user.gender == .female {
      // ...
    }
    ```

- `guard let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다. `else`는 `guard`와 같은 들여쓰기를 적용합니다.

    ```swift
    guard let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
      let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
      user.gender == .female
    else {
      return
    }
    ```

### 최대 줄 길이

- 한 줄은 최대 99자를 넘지 않아야 합니다.

    Xcode의 **Preferences → Text Editing → Display**의 'Page guide at column' 옵션을 활성화하고 99자로 설정하면 편리합니다.

### 빈 줄

- 빈 줄에는 공백이 포함되지 않도록 합니다.
- 모든 파일은 빈 줄로 끝나도록 합니다.
- MARK 구문 위와 아래에는 공백이 필요합니다.

    ```swift
    // MARK: Layout

    override func layoutSubviews() {
      // doSomething()
    }

    // MARK: Actions

    override func menuButtonDidTap() {
      // doSomething()
    }
    ```

### 임포트

모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

```swift
import UIKit

import SwiftyColor
import SwiftyImage
import Then
import URLNavigator
```

## 네이밍

### 클래스

- 클래스 이름에는 UpperCamelCase를 사용합니다.
- 클래스 이름에는 접두사<sup>Prefix</sup>를 붙이지 않습니다.

### 함수

- 함수 이름에는 lowerCamelCase를 사용합니다.
- 함수 이름 앞에는 되도록이면 `get`을 붙이지 않습니다.

    **좋은 예:**

    ```swift
    func name(for user: User) -> String?
    ```

    **나쁜 예:**

    ```swift
    func getName(for user: User) -> String?
    ```

- Action 함수의 네이밍은 '주어 + 동사 + 목적어' 형태를 사용합니다.

    - *Tap(눌렀다 뗌)*은 `UIControlEvents`의 `.touchUpInside`에 대응하고, *Press(누름)*는 `.touchDown`에 대응합니다.
    - *will~*은 특정 행위가 일어나기 직전이고, *did~*는 특정 행위가 일어난 직후입니다.
    - *should~*는 일반적으로 `Bool`을 반환하는 함수에 사용됩니다.

    **좋은 예:**

    ```swift
    func backButtonDidTap() {
      // ...
    }
    ```

    **나쁜 예:**

    ```swift
    func back() {
      // ...
    }

    func pressBack() {
      // ...
    }
    ```

### 변수

- 변수 이름에는 lowerCamelCase를 사용합니다.

### 상수

- 상수 이름에는 lowerCamelCase를 사용합니다.

    **좋은 예:**

    ```swift
    let maximumNumberOfLines = 3
    ```

    **나쁜 예:**

    ```swift
    let kMaximumNumberOfLines = 3
    let MAX_LINES = 3
    ```

### 열거형

- enum의 각 case에는 lowerCamelCase를 사용합니다.

    **좋은 예:**

    ```swift
    enum Result {
      case .success
      case .failure
    }
    ```

    **나쁜 예:**

    ```swift
    enum Result {
      case .Success
      case .Failure
    }
    ```

### 약어

- 약어로 시작하는 경우 소문자로 표기하고, 그 외의 경우에는 항상 대문자로 표기합니다.

    **좋은 예:**

    <pre>
    let user<strong>ID</strong>: Int?
    let <strong>html</strong>: String?
    let website<strong>URL</strong>: URL?
    let <strong>url</strong>String: String?
    </pre>

    **나쁜 예:**

    <pre>
    let user<strong>Id</strong>: Int?
    let <strong>HTML</strong>: String?
    let website<strong>Url</strong>: NSURL?
    let <strong>URL</strong>String: String?
    </pre>

### Delegate

- Delegate 메서드는 프로토콜명으로 네임스페이스를 구분합니다.

    **좋은 예:**

    ```swift
    protocol UserCellDelegate {
      func userCellDidSetProfileImage(_ cell: UserCell)
      func userCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```

    **나쁜 예:**

    ```swift
    protocol UserCellDelegate {
      func didSetProfileImage()
      func followPressed(user: User)

      // `UserCell`이라는 클래스가 존재할 경우 컴파일 에러 발생
      func UserCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```

## 클로저

- 파라미터와 리턴 타입이 없는 Closure 정의시에는 `() -> Void`를 사용합니다.

    **좋은 예:**

    ```swift
    let completionBlock: (() -> Void)?
    ```

    **나쁜 예:**

    ```swift
    let completionBlock: (() -> ())?
    let completionBlock: ((Void) -> (Void))?
    ```

- Closure 정의시 파라미터에는 괄호를 사용하지 않습니다.

    **좋은 예:**

    ```swift
    { operation, responseObject in
      // doSomething()
    }
    ```

    **나쁜 예:**

    ```swift
    { (operation, responseObject) in
      // doSomething()
    }
    ```

- Closure 정의시 가능한 경우 타입 정의를 생략합니다.

    **좋은 예:**

    ```swift
    ...,
    completion: { finished in
      // doSomething()
    }
    ```

    **나쁜 예:**

    ```swift
    ...,
    completion: { (finished: Bool) -> Void in
      // doSomething()
    }
    ```

- Closure 호출시 또다른 유일한 Closure를 마지막 파라미터로 받는 경우, 파라미터 이름을 생략합니다.

    **좋은 예:**

    ```swift
    UIView.animate(withDuration: 0.5) {
      // doSomething()
    }
    ```

    **나쁜 예:**

    ```swift
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
      // doSomething()
    })
    ```

## 클래스와 구조체

- 클래스와 구조체 내부에서는 `self`를 명시적으로 사용합니다.
- 구조체를 생성할 때에는 Swift 구조체 생성자를 사용합니다.

    **좋은 예:**

    ```swift
    let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    ```

    **나쁜 예:**

    ```swift
    let frame = CGRectMake(0, 0, 100, 100)
    ```

## 타입

- `Array<T>`와 `Dictionary<T: U>` 보다는 `[T]`, `[T: U]`를 사용합니다.

    **좋은 예:**

    ```swift
    var messages: [String]?
    var names: [Int: String]?
    ```

    **나쁜 예:**

    ```swift
    var messages: Array<String>?
    var names: Dictionary<Int, String>?
    ```

</details>
 
 <details>
<summary> 깃 사용 전략 </summary>
  
  1. Issue를 생성한다.
2. feature Branch를 생성한다.
3. Add - Commit - Push - Pull Request 의 과정을 거친다.
4. Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.
5. Code Review가 완료되면 Pull Request 작성자가 develop Branch로 merge 한다.
6. 종료된 Issue와 Pull Request의 Label과 Project를 관리한다.
  
  ## 📍Commit Message

- 🚑️[HOTFIX] issue나, QA에서 급한 버그 수정에 사용
- 🔨[FIX] 버그, 오류 해결
- ➕[ADD] Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- ✨[FEAT] 새로운 기능 구현
- ⚰️[DEL] 쓸모없는 코드 삭제
- 📝[DOCS] README나 WIKI 등의 문서 개정
- 💄[MOD] storyboard 파일,UI 수정한 경우
- ✅[CHORE] 코드 수정, 내부 파일 수정
- ✏️[CORRECT] 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- 🚚[MOVE] 프로젝트 내 파일이나 코드의 이동
- ⏪️[RENAME] 파일 이름 변경이 있을 때 사용합니다.
- ⚡️[IMPROVE] 향상이 있을 때 사용합니다.
- ♻️[REFACTOR] 전면 수정이 있을 때 사용합니다
- 🔀[MERGE] 다른브렌치를 merge 할 때 사용합니다.
 </details>

