import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/domain/entities/person.dart';
import '../../../core/util/text_styles.dart';
import '../../../core/widgets/cached_network_circle_avatar.dart';
import '../../../features/person/domain/person_bloc.dart';
import '../../../core/constants/constants.dart';

/// Displays the detailed information of [Person] which is extract from [PersonBloc], [PersonState]
class PersonDetailPage extends StatelessWidget {
  final Person person;

  const PersonDetailPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("${Constants.personID}: #${person.id}"),
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
            child: Column(
          children: [
            CachedNetworkCircleAvatar(
              imageUrl: person.image ?? '',
              radius: Constants.largeAvatarRadius,
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "${person.firstname ?? ''} ${person.lastname ?? ''}",
                  style: TextStyles.titleStyle,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getRowView(Constants.email, person.email ?? ''),
                getRowView(Constants.phone, person.phone ?? ''),
                getRowView(Constants.birthday, person.birthday ?? ''),
                getRowView(Constants.gender, person.gender ?? ''),
                getRowView(Constants.address, person.address.toString() ?? ''),
                getRowView(
                    Constants.geoPoints,
                    "${person.address?.latitude}, ${person.address?.longitude}" ??
                        ''),
              ],
            )
          ],
        )),
      );
    });
  }

  getRowView(String name, String value) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(name, style: TextStyles.titleStyle),
          ),
          Text(value, style: TextStyles.subtitleStyle)
        ]);
  }
}
