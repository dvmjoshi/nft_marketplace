class NftModel{
  final String  userName;
  final String  nftName;
  final String  sellType;
  final String  nftImage;
  final String   buttonType;
  final  double  price;
  final String ? nftVideo;
  bool video;

  NftModel({required this.userName, required this.nftName, required this.sellType, required this.buttonType,
    required this.price,required this.nftImage,required this.video, this.nftVideo});
}
 List<NftModel> nftList=[
   NftModel(
     userName: "Itachi",
     price: 1.10,
     nftImage: "https://cdn.dribbble.com/users/288987/screenshots/2416384/exodus.png?compress=1&resize=800x600",
     buttonType: "Buy now",
     sellType: "Fixed price",
     nftName: "The Way",
     video: true,
     nftVideo: "https://cdn.dribbble.com/users/288987/screenshots/14035262/media/0300d15fcd6fd16e6206b420c0f09602.mp4"
   ),
   NftModel(
     userName: "Elon",
     price: 1.2,
     nftImage: "https://cdn.dribbble.com/users/43342/screenshots/10506987/media/b075f17fd2b7b66993c7fc55f2a9c1e8.jpg?compress=1&resize=1600x1200",
     buttonType: "Buy now",
     sellType: "Fixed price",
     nftName: "space x",
     video: false,
   ),
   NftModel(
       userName: "Divyam",
       price: 1.1,
       nftImage: "https://cdn.dribbble.com/users/43342/screenshots/14595369/media/478448af7ceac18b147b5f488cf9b475.jpg?compress=1&resize=1600x1200",
       buttonType: "Buy now",
       sellType: "Fixed price",
       nftName: "The Way",
       video: true,
       nftVideo: "https://cdn.dribbble.com/users/288987/screenshots/13797725/media/eb2abbe0e70f592e3760e59db603e418.mp4"
   ),
   NftModel(
       userName: "Pawan",
       price: 0.800,
       nftImage: "https://cdn.dribbble.com/users/2035533/screenshots/6099659/14_4x.jpg?compress=1&resize=1600x1200",
       buttonType: "Buy now",
       sellType: "Fixed price",
       nftName: "hand with power",
       video: false,
   ),
   NftModel(
       userName: "Pusp",
       price: 0.840,
       nftImage: "https://cdn.dribbble.com/users/43342/screenshots/14587724/media/06ea6d90477e373369306d3f679d7f38.jpg?compress=1&resize=1600x1200",
       buttonType: "Buy now",
       sellType: "Fixed price",
       nftName: "Flying above **",
       video: false,
   ),
   NftModel(
     userName: "Anchal",
     price: 0.800,
     nftImage: "https://cdn.dribbble.com/users/43342/screenshots/14105022/media/6597df5622f1c4552180d213c3b9b183.jpg?compress=1&resize=1600x1200",
     buttonType: "Buy now",
     sellType: "Fixed price",
     nftName: "don't give a **",
     video: false,
     nftVideo:"https://cdn.dribbble.com/users/1378520/screenshots/15945546/media/40a6baeea767d2696eeae934801b2de3.mp4"
   ),
 ];