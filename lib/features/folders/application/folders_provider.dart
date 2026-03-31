import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../domain/entities/folder.dart';
import '../domain/repositories/i_folder_repository.dart';

part 'folders_provider.g.dart';

@riverpod
class FoldersNotifier extends _$FoldersNotifier {
  @override
  Future<List<Folder>> build() async {
    return ref.read(folderRepositoryProvider).getAll();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(folderRepositoryProvider).getAll(),
    );
  }

  Future<Folder> createFolder({
    required String name,
    String? parentId,
    String icon = 'folder',
    String colorHex = '#6C63FF',
  }) async {
    final folder = Folder(
      id: const Uuid().v4(),
      parentId: parentId,
      name: name,
      icon: icon,
      colorHex: colorHex,
      createdAt: DateTime.now(),
    );
    await ref.read(folderRepositoryProvider).save(folder);
    await refresh();
    return folder;
  }

  Future<void> deleteFolder(String id) async {
    await ref.read(folderRepositoryProvider).delete(id);
    await refresh();
  }

  Future<void> updateFolder(Folder folder) async {
    await ref.read(folderRepositoryProvider).save(folder);
    await refresh();
  }

  Future<void> renameFolder(String id, String newName) async {
    final folder = state.valueOrNull?.where((f) => f.id == id).firstOrNull;
    if (folder != null) {
      await updateFolder(folder.copyWith(name: newName));
    }
  }

  Future<void> toggleFavorite(String id) async {
    final folder = state.valueOrNull?.where((f) => f.id == id).firstOrNull;
    if (folder != null) {
      await updateFolder(folder.copyWith(isFavorite: !folder.isFavorite));
    }
  }
}

@riverpod
IFolderRepository folderRepository(Ref ref) {
  throw UnimplementedError('Register via get_it override');
}
