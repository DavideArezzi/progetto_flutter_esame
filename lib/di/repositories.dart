part of 'dependency_injector.dart';

List<RepositoryProvider> get _repositories => [
  RepositoryProvider(create: (context) => PokedexRepository(context.read(), context.read())),
];