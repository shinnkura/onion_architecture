import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onion_architecture/domain/types/memo.dart';
import 'package:onion_architecture/application/state/memo_list_notifier.dart';

/// メモ一覧のプロバイダー
final memoListProvider = StateNotifierProvider<MemoListNotifier, List<Memo>>(
  (ref) {
    return MemoListNotifier([]);
  },
);
