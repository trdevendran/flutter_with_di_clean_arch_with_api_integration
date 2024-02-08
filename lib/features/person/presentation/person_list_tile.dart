import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';
import '../../../core/domain/entities/person.dart';
import '../../../core/util/text_styles.dart';
import '../../../core/widgets/cached_network_circle_avatar.dart';

/// Generates each item as per the parameter [Person] and returns [ListTile]
class PersonListTile extends StatelessWidget {
  final Person person;

  const PersonListTile({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: CachedNetworkCircleAvatar(
        imageUrl: person.image ?? '',
        radius: Constants.smallAvatarRadius,
      ),
      title: Text(
        "${person.firstname ?? ''} ${person.lastname}",
        style: TextStyles.titleStyle,
      ),
      subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            person.email ?? '',
            style: TextStyles.subtitleStyle,
            maxLines: 1,
          )),
      onTap: () {
        context.pushNamed("details", extra: person);
      },
    );
  }
}
