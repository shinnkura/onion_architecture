import 'package:flutter/material.dart';
import 'package:onion_architecture/presentation/theme/colors.dart';
import 'package:onion_architecture/presentation/theme/fonts.dart';
import 'package:onion_architecture/presentation/theme/l10n.dart';
import 'package:onion_architecture/presentation/theme/sizes.dart';
import 'package:onion_architecture/presentation/widgets/gap.dart';

/// 追加ボタン
class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPressed,
  });

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    /// アイコン
    const icon = Icon(Icons.add);

    /// 文字
    const text = Text(
      L10n.createNew,
      style: BrandText.bodyL,
    );

    /// レイアウト
    return FloatingActionButton.extended(
      heroTag: null,
      backgroundColor: BrandColor.bananaYellow,
      onPressed: onPressed,
      label: Row(
        children: [
          icon,
          Gap.w(RawSize.p8),
          text,
        ],
      ),
    );
  }
}
