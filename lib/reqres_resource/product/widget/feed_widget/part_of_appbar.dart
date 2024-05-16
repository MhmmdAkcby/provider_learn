part of './feed_widget.dart';

class _PartOfAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartOfAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.deepPurpleColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      title: const _LoadingAppBar(),
      actions: const [IconButtonWidget()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LoadingAppBar extends StatelessWidget {
  const _LoadingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        context.watch<FeedWidgetProvider>().isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: ProjectColors.whiteColor,
              ))
            : Text(
                ProjectString.appBarName.languageItem(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: ProjectColors.whiteColor,
                    ),
              ),
      ],
    );
  }
}
