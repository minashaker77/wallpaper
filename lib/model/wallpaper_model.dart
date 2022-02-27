class WallpaperModel {
  WallpaperModel({
     this.photographer,
     this.photographer_id,
     this.portfolio_url,
     this.profile_image,
  });

  String? photographer, portfolio_url, photographer_id;
  Profile_imageModel? profile_image;

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        profile_image: Profile_imageModel.fromMap(jsonData['src']),
        photographer: jsonData['photographer'],
        photographer_id: jsonData['photographer_id'],
        portfolio_url: jsonData['portfolio_url']);
  }
}

class Profile_imageModel {
  Profile_imageModel(
      {
      required this.large,
      required this.medium,
      required this.small,
      });

  String large, medium, small;

  factory Profile_imageModel.fromMap(Map<String, dynamic> jsonData) {
    return Profile_imageModel(
        large: jsonData['large'],
        medium: jsonData['medium'],
        small: jsonData['small']);
  }
}
