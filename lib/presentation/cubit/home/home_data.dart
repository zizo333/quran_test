part of 'home_cubit.dart';

class HomeData extends BaseData {
  HomeData._();

  final fromPageController = TextEditingController();
  final toPageController = TextEditingController();
  final fromPageNode = FocusNode();
  final toPageNode = FocusNode();

  @override
  void dispose() {
    fromPageController.dispose();
    toPageController.dispose();
    fromPageNode.dispose();
    toPageNode.dispose();
  }
}
