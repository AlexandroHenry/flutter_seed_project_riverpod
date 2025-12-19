# Forgot Password Feature Migration

## 개요
Bloc + Auto Router에서 Riverpod 3.0 + GoRouter로 마이그레이션 완료

## 변경사항

### 1. Feature 기반 폴더 구조
```
lib/presentation/screen/auth/forgot/
├── feature/
│   ├── forgot_password/          # 이메일 입력 및 코드 전송
│   │   ├── provider/
│   │   │   ├── forgot_password_provider.dart
│   │   │   ├── forgot_password_state.dart
│   │   │   └── forgot_password_state.freezed.dart
│   │   └── forgot_password_screen.dart
│   ├── verify_code/              # 인증 코드 확인
│   │   ├── provider/
│   │   │   ├── verify_code_provider.dart
│   │   │   ├── verify_code_state.dart
│   │   │   └── verify_code_state.freezed.dart
│   │   └── verify_code_screen.dart
│   └── change_password/          # 비밀번호 변경
│       ├── provider/
│       │   ├── change_password_provider.dart
│       │   ├── change_password_state.dart
│       │   └── change_password_state.freezed.dart
│       └── change_password_screen.dart
└── [기존 파일들 - 삭제 예정]

```

### 2. Riverpod 3.0 변경사항

#### Provider 정의
- `NotifierProvider` → `NotifierProvider.autoDispose` 사용
- `Notifier` → `AutoDisposeNotifier` 상속

**Before (Riverpod 2.x):**
```dart
final forgotPasswordProvider = NotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>(
  ForgotPasswordNotifier.new,
);

class ForgotPasswordNotifier extends Notifier<ForgotPasswordState> {
  // ...
}
```

**After (Riverpod 3.0):**
```dart
final forgotPasswordProvider = NotifierProvider.autoDispose<ForgotPasswordNotifier, ForgotPasswordState>(
  ForgotPasswordNotifier.new,
);

class ForgotPasswordNotifier extends AutoDisposeNotifier<ForgotPasswordState> {
  // ...
}
```

### 3. GoRouter 네비게이션

#### 라우트 정의
```dart
// app_go_router.dart에 추가
GoRoute(
  path: '/forgot-password',
  name: 'forgot_password',
  builder: (context, state) => const ForgotPasswordScreen(),
),
GoRoute(
  path: '/forgot-password/verify',
  name: 'verify_code',
  builder: (context, state) {
    final email = state.extra as String;
    return VerifyCodeScreen(email: email);
  },
),
GoRoute(
  path: '/forgot-password/change-password',
  name: 'change_password',
  builder: (context, state) {
    final params = state.extra as Map<String, String>;
    return ChangePasswordScreen(
      email: params['email']!,
      code: params['code']!,
    );
  },
),
```

#### 네비게이션 코드 변경

**Before (MaterialPageRoute):**
```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (_) => VerifyCodeScreen(email: email),
  ),
);
```

**After (GoRouter):**
```dart
context.push('/forgot-password/verify', extra: email);
```

### 4. 주요 개선사항

1. **State Management**
   - AutoDispose로 메모리 관리 개선
   - Provider가 자동으로 dispose되어 메모리 누수 방지

2. **Navigation**
   - GoRouter로 선언적 라우팅
   - Deep linking 지원 가능
   - Type-safe 파라미터 전달

3. **Code Organization**
   - Feature 기반 구조로 관심사 분리
   - 각 feature별로 독립적인 provider와 state 관리

## 마이그레이션 체크리스트

### ✅ 완료
- [x] Feature 기반 폴더 구조 생성
- [x] ForgotPasswordScreen을 Riverpod 3.0으로 마이그레이션
- [x] VerifyCodeScreen을 Riverpod 3.0으로 마이그레이션
- [x] ChangePasswordScreen을 Riverpod 3.0으로 마이그레이션
- [x] GoRouter 라우트 추가
- [x] Provider를 AutoDisposeNotifier로 변경
- [x] Navigation을 GoRouter로 변경

### 🔄 진행 필요
- [ ] `dart run build_runner build --delete-conflicting-outputs` 실행하여 freezed 파일 생성
- [ ] 기존 파일 삭제:
  - [ ] `/forgot/forgot_password_screen.dart`
  - [ ] `/forgot/verify/verify_code_screen.dart`
  - [ ] `/forgot/verify/change_password_with_code_screen.dart`
  - [ ] `/forgot/provider/` 폴더 전체
  - [ ] `/forgot/verify/` 폴더 내 event, state 파일들
- [ ] 앱 실행 및 테스트

## 실행 방법

1. Freezed 코드 생성:
```bash
cd /Users/seungchulha/Developer/projects/hsc/photoberry
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

2. 앱 실행:
```bash
fvm flutter run
```

## 테스트 시나리오

1. **비밀번호 찾기 플로우**
   - 로그인 화면에서 "비밀번호 찾기" 탭
   - 이메일 입력 후 "코드 전송하기" 탭
   - 인증 코드 입력 및 확인
   - 새 비밀번호 입력 및 변경
   - 로그인 화면으로 자동 이동

2. **에러 처리**
   - 잘못된 이메일 입력 시
   - 잘못된 인증 코드 입력 시
   - 비밀번호 불일치 시

3. **네비게이션**
   - 뒤로가기 버튼 동작
   - 완료 후 로그인 화면으로 이동

## 주의사항

1. **Provider AutoDispose**
   - Provider가 자동으로 dispose되므로 화면 이동 시 상태가 초기화됩니다
   - 필요한 경우 keepAlive를 사용하여 상태 유지 가능

2. **GoRouter Extra Parameter**
   - `extra` 파라미터로 데이터 전달
   - Type casting 필요 (email: state.extra as String)

3. **Freezed 코드 생성**
   - State 클래스 변경 시 반드시 build_runner 실행 필요
   - `.freezed.dart` 파일이 없으면 컴파일 에러 발생
