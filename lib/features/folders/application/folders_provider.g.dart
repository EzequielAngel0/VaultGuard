// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$folderRepositoryHash() => r'cf86f11dc36087cb3a46052c9d68fc88d199f0e1';

/// See also [folderRepository].
@ProviderFor(folderRepository)
final folderRepositoryProvider =
    AutoDisposeProvider<IFolderRepository>.internal(
      folderRepository,
      name: r'folderRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$folderRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FolderRepositoryRef = AutoDisposeProviderRef<IFolderRepository>;
String _$foldersNotifierHash() => r'92e666a1aa396ccb3e715b8109b69cc138ab766a';

/// See also [FoldersNotifier].
@ProviderFor(FoldersNotifier)
final foldersNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FoldersNotifier, List<Folder>>.internal(
      FoldersNotifier.new,
      name: r'foldersNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$foldersNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FoldersNotifier = AutoDisposeAsyncNotifier<List<Folder>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
