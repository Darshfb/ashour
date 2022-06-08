class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
    image: 'assets/images/onboarding1.png',
    title: 'On Board 1 Title',
    body: 'On Board 1 Body',
  ),
  BoardingModel(
    image: 'assets/images/onboarding2.png',
    title: 'On Board 2 Title',
    body: 'On Board 2 Body',
  ),
  BoardingModel(
    image: 'assets/images/onboarding3.png',
    title: 'On Board 3 Title',
    body: 'On Board 3 Body',
  ),
  BoardingModel(
    image: 'assets/images/onboarding4.png',
    title: 'On Board 4 Title',
    body: 'On Board 4 Body',
  ),
];
