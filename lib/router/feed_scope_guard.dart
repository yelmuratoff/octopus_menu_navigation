import 'dart:async';

import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/router/router.dart';

class FeedWrapperGuard extends OctopusGuard {
  String get screenName => Routes.feedWrapper.name;

  String get bucketName => 'feed-wrapper';

  final Set<String> allowedScreens;

  FeedWrapperGuard({
    super.refresh,
    required this.allowedScreens,
  });

  @override
  FutureOr<OctopusState> call(
    List<OctopusHistoryEntry> history,
    OctopusState$Mutable state,
    Map<String, Object?> context,
  ) {
    final screenWithBucket = state.findByName(Routes.feed.name);
    if (screenWithBucket == null) return state;

    final scopedBucket = screenWithBucket.putIfAbsent(
      bucketName,
      () => OctopusNode.mutable(bucketName),
    );

    // remove not allowed screens
    scopedBucket.children.removeWhere(
      (node) => !allowedScreens.contains(
        node.name,
      ),
    );

    if (!scopedBucket.hasChildren) {
      scopedBucket.add(OctopusNode.mutable(Routes.feed.name));
    }

    return state;
  }
}
