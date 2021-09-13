import 'package:fcsc_admin/component/fscs_card.dart';
import 'package:fcsc_admin/component/nerc_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CardComponent(),
      ),
    );
  }
}
