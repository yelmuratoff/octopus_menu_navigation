/// RootTabsEnum enumeration
enum RootTabsEnum implements Comparable<RootTabsEnum> {
  home(bucket: 'home-tab'),
  products(bucket: 'products-tab'),
  menu(bucket: 'menu-tab'),
  notifications(bucket: 'notifications-tab'),
  profile(bucket: 'profile-tab');

  const RootTabsEnum({
    required this.bucket,
  });

  /// Creates a new instance of [RootTabsEnum] from a given string.
  static RootTabsEnum fromValue(String? value, {RootTabsEnum? fallback}) => switch (value?.trim().toLowerCase()) {
        'home' => home,
        'products' => products,
        'menu' => menu,
        'notifications' => notifications,
        'profile' => profile,
        _ => fallback ?? (throw ArgumentError.value(value)),
      };

  /// Returns the bucket of the current [RootTabsEnum].
  final String bucket;

  /// Pattern matching
  T map<T>({
    required T Function() home,
    required T Function() products,
    required T Function() menu,
    required T Function() notifications,
    required T Function() profile,
  }) =>
      switch (this) {
        RootTabsEnum.home => home(),
        RootTabsEnum.products => products(),
        RootTabsEnum.menu => menu(),
        RootTabsEnum.notifications => notifications(),
        RootTabsEnum.profile => profile(),
      };

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? home,
    T Function()? products,
    T Function()? menu,
    T Function()? notifications,
    T Function()? profile,
  }) =>
      map<T>(
        home: home ?? orElse,
        products: products ?? orElse,
        menu: menu ?? orElse,
        notifications: notifications ?? orElse,
        profile: profile ?? orElse,
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? home,
    T Function()? products,
    T Function()? menu,
    T Function()? notifications,
    T Function()? profile,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        home: home,
        products: products,
        menu: menu,
        notifications: notifications,
        profile: profile,
      );

  @override
  int compareTo(RootTabsEnum other) => index.compareTo(other.index);

  @override
  String toString() => name;
}
