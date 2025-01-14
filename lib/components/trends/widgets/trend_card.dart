import 'package:dart_twitter_api/twitter_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpy/components/components.dart';
import 'package:harpy/core/core.dart';
import 'package:intl/intl.dart' as intl;

class TrendCard extends ConsumerWidget {
  const TrendCard({
    required this.trend,
  });

  final Trend trend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final numberFormat = intl.NumberFormat.compact(locale: locale);

    return HarpyListCard(
      leading: const Icon(FeatherIcons.trendingUp, size: 18),
      title: Text(
        trend.name ?? '',
        textDirection: TextDirection.ltr,
      ),
      subtitle: trend.tweetVolume != null
          ? Text('${numberFormat.format(trend.tweetVolume)} tweets')
          : null,
      onTap: () => ref.read(routerProvider).pushNamed(
        TweetSearchPage.name,
        queryParams: {'query': trend.name ?? ''},
      ),
    );
  }
}
