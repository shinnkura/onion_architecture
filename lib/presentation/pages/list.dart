import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onion_architecture/application/di/usecases.dart';
import 'package:onion_architecture/application/di/infrastructure.dart';
import 'package:onion_architecture/application/state/memo_list_provider.dart';
// import 'package:onion_architecture/presentation/router/page_path.dart';
import 'package:onion_architecture/presentation/router/go_router.dart';
import 'package:onion_architecture/presentation/widgets/add_button.dart';
import 'package:onion_architecture/presentation/widgets/memo_card.dart';
import 'package:onion_architecture/presentation/theme/sizes.dart';

/// 一覧画面
class ListPage extends HookConsumerWidget {
  const ListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// logger
    final logger = ref.watch(loggerProvider);
    logger.debug('ListPage.build()');

    // 画面が表示された時に処理をする
    useEffect(() {
      // スプラッシュ画面がないのでここで初期化
      final usecase = ref.read(initAppProvider);
      usecase.execute();
      return null;
    }, const []);

    /// メモ一覧
    final memoList = ref.watch(memoListProvider);

    /// リスト
    final listView = ListView.builder(
      itemCount: memoList.length,
      itemBuilder: (context, index) {
        final memo = memoList[index];
        return MemoCard(
          memo: memoList[index],
          onPressed: () {
            // 編集画面へ進む
            final router = ref.read(goRouterProvider);
            router.pushNamed(
              // PageId.edit.routeName,
              // params: {'id': memo.id},
              '{PageId.edit.routeName}/id=${memo.id}',
            );
          },
          onPressedDelete: () {
            // ユースケースを呼び出す
            final usecase = ref.read(deleteMemoProvider);
            usecase.deleteMemo(memo.id);
          },
        );
      },
    );

    /// 追加ボタン
    final addButton = AddButton(
      onPressed: () {
        // ユースケースを呼び出す
        final usecase = ref.read(addMemoProvider);
        usecase.addNewMemo();
      },
    );

    /// 画面レイアウト
    return Scaffold(
      floatingActionButton: addButton,
      body: Padding(
        padding: const EdgeInsets.all(RawSize.p4),
        child: listView,
      ),
    );
  }
}
