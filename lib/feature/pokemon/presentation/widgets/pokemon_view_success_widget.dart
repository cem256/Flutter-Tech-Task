part of '../view/pokemon_view.dart';

class _PokemonViewSuccessWidget extends StatefulWidget {
  const _PokemonViewSuccessWidget({required this.pokemons, required this.hasReachedMax});

  final List<PokemonEntity> pokemons;
  final bool hasReachedMax;

  @override
  State<_PokemonViewSuccessWidget> createState() => _PokemonViewSuccessWidgetState();
}

class _PokemonViewSuccessWidgetState extends State<_PokemonViewSuccessWidget> {
  late final ScrollController _scrollController;
  late final int _crossAxisCount;

  @override
  void initState() {
    super.initState();
    _crossAxisCount = 2;
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<PokemonListBloc>().add(PokemonListFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: context.defaultValue,
        crossAxisSpacing: context.defaultValue,
        crossAxisCount: _crossAxisCount,
      ),
      itemCount: widget.hasReachedMax ? widget.pokemons.length : widget.pokemons.length + _crossAxisCount,
      itemBuilder: (context, index) {
        return index >= widget.pokemons.length
            ? const Center(child: CircularProgressIndicator.adaptive())
            : GestureDetector(
                onTap: () => context.router.push(PokemonDetailsRoute(pokemon: widget.pokemons[index])),
                child: PokemonViewCardItem(pokemon: widget.pokemons[index]),
              );
      },
    );
  }
}
