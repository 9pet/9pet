part of pestisland.post.post_edit.bloc;

abstract class PostEditEvent extends BaseEvent {
  @override
  String toString() => '$runtimeType';
}

class TitleInputChange extends PostEditEvent {
  final String title;

  TitleInputChange(this.title);

  @override
  String toString() => 'TitleInputChange:: title: $title';
}

class PriceInputChange extends PostEditEvent {
  final double price;

  PriceInputChange(this.price);

  @override
  String toString() => 'PriceInputChange:: price: ${price?.toString()}';
}

class AddImageEvent extends PostEditEvent {
  final String imageLocalPath;

  AddImageEvent(this.imageLocalPath);

  @override
  String toString() => 'AddImageEvent: images: ${imageLocalPath?.toString()}';
}

class RemoveImageEvent extends PostEditEvent {
  final int index;
  final ImageSources type;

  RemoveImageEvent(this.index, this.type);

  @override
  String toString() => 'RemoveImageEvent: index: $index';
}

class ExpandChange extends PostEditEvent {
  @override
  String toString() => 'ExpandChange';
}

class LocationChange extends PostEditEvent {
  @override
  String toString() => 'ExpandChange';
}
