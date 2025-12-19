enum AppPath {
  root(path: '/', fullPath: '/'),

  splash(path: 'splash', fullPath: '/splash'),

  main(path: 'main', fullPath: '/main'),
  home(path: 'home', fullPath: '/home'),

  // AUTH
  login(path: 'login', fullPath: '/login'),
  signup(path: 'signup', fullPath: '/signup'),
  verifyEmail(path: 'verify-email', fullPath: '/verify-email'),
  
  // FORGOT PASSWORD
  forgotPassword(path: 'forgot-password', fullPath: '/forgot-password'),
  forgotPasswordVerify(path: 'forgot-password/verify', fullPath: '/forgot-password/verify'),
  forgotPasswordChange(path: 'forgot-password/change-password', fullPath: '/forgot-password/change-password'),

  // ACCOUNT
  userDetail(path: 'user-detail', fullPath: '/user-detail'),
  userEdit(path: 'user-edit', fullPath: '/user-edit'),
 

  // search(path: 'search', fullPath: '/search'),

  // notFound(path: '/404', fullPath: '/404'),
  ;

  const AppPath({
    required this.path,
    required this.fullPath,
  });

  final String path;
  final String fullPath;
}