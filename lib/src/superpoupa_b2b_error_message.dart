import 'package:flutter/material.dart';
import 'package:superpoupa_b2b_ui_components/src/helpers/enums.dart';
import 'package:superpoupa_b2b_ui_components/src/helpers/screen_definer.dart';
import 'package:superpoupa_b2b_ui_components/src/superpoupa_b2b_button.dart';

class SuperPoupaB2BErrorMessage extends StatelessWidget {
  final VoidCallback? onClick;
  const SuperPoupaB2BErrorMessage({super.key, this.onClick});

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize = ScreenDefiner.define(context);

    return Center(
      child: SizedBox(
        width: screenSize == ScreenSize.xlarge ? MediaQuery.of(context).size.width * 0.3 : MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(bottom: 16), child: Icon(Icons.info_outline, size: 100, color: Colors.grey[300])),
            Padding(padding: const EdgeInsets.only(bottom: 16), child: Text('Ocorreu um erro, tente novamente.', style: TextStyle(color: Colors.grey[300]))),
            SuperPoupaB2BButton(label: 'Tentar novamente', width: MediaQuery.of(context).size.width, onClick: () {
              if (onClick != null) {
                onClick!();
              }
            }),
          ],
        ),
      ),
    );
  }
}