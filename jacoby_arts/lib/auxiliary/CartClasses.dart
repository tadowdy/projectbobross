//TODO: make ItemInfo instead
class ArtInfo {
  String artworkName;
  String artistName;
  int price;
  String imageUrl;

  ArtInfo(String artworkName, String artistName, int price, String imageUrl) {
    this.artworkName = artworkName;
    this.artistName = artistName;
    this.price = price;
    this.imageUrl = imageUrl;
  }
}