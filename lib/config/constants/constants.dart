import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/location_model.dart';
import 'package:trend_marketplace2/data/models/orderFilter_modal.dart';
//fonts

const String segoeFont = 'assets/font/SegoeUI.ttf';

//images
const String splashImage = 'assets/images/splashImage.png';
const String banner1Image = 'assets/images/banner1.png';
const String banner2Image = 'assets/images/banner2.png';
const String manImage = 'assets/images/manImage.png';
const String brand1Image = 'assets/images/brand1.png';
const String brand2Image = 'assets/images/brand2.png';
const String brand3Image = 'assets/images/brand3.png';
const String brand4Image = 'assets/images/brand4.png';
const String brand5Image = 'assets/images/brand5.png';
const String woman1Image = 'assets/images/woman1.png';
const String woman2Image = 'assets/images/woman2.png';
const String woman3Image = 'assets/images/woman3.png';
const String woman4Image = 'assets/images/woman4.png';
const String woman5Image = 'assets/images/woman5.png';
const String woman6Image = 'assets/images/woman6.png';
const String woman7Image = 'assets/images/woman7.png';
const String woman8Image = 'assets/images/woman8.png';
const String woman9Image = 'assets/images/woman9.png';
const String woman10Image = 'assets/images/woman10.png';
const String woman11Image = 'assets/images/woman11.png';
const String woman12Image = 'assets/images/woman12.png';
const String manCloth1Image = 'assets/images/manCloth1.png';
const String manCloth2Image = 'assets/images/manCloth2.png';
const String manCloth3Image = 'assets/images/manCloth3.png';
const String cartPhotoImage = 'assets/images/cartPhoto.png';
const String storeBackgroundImage = 'assets/images/storeBackground.png';
const String avvaBrandImage = 'assets/images/avvaBrand.png';
const String coatImage = 'assets/images/coat.png';
const String jeansImage = 'assets/images/jeans.png';
const String jumperImage = 'assets/images/jumper.png';
const String trousersImage = 'assets/images/trousers.png';
const String storeBannerImage = 'assets/images/storeBanner.png';
const String storeSmallBanner1Image = 'assets/images/storeSmallBanner1.png';
const String storeSmallBanner2Image = 'assets/images/storeSmallBanner2.png';
const String storeSmallBanner3Image = 'assets/images/storeSmallBanner3.png';
const String storeSmallBanner4Image = 'assets/images/storeSmallBanner4.png';

//icons
const String homeIcon = 'assets/icons/home.svg';
const String homeBoldIcon = 'assets/icons/homeBold.svg';
const String categoryIcon = 'assets/icons/category.svg';
const String categoryBoldIcon = 'assets/icons/categoryBold.svg';
const String heartIcon = 'assets/icons/heart.svg';
const String heartBoldIcon = 'assets/icons/heartBold.svg';
const String shoppingBagIcon = 'assets/icons/shoppingBag.svg';
const String shoppingBagBoldIcon = 'assets/icons/shoppingBagBold.svg';
const String userIcon = 'assets/icons/user.svg';
const String userBoldIcon = 'assets/icons/userBold.svg';
const String starIcon = 'assets/icons/star.svg';
const String cartIcon = 'assets/icons/cart.svg';
const String sortIcon = 'assets/icons/sort.svg';
const String filterIcon = 'assets/icons/filter.svg';
const String eyeIcon = 'assets/icons/eye.svg';
const String eyeSlashIcon = 'assets/icons/eyeSlash.svg';
const String arrowLeftIcon = 'assets/icons/arrowLeft.svg';
const String searchIcon = 'assets/icons/search.svg';
const String arrowDownIcon = 'assets/icons/arrowDown.svg';
const String arrowUpIcon = 'assets/icons/arrowUp.svg';
const String arrowRightIcon = 'assets/icons/arrowRight.svg';
const String verifyIcon = 'assets/icons/verify.svg';
const String barcodeIcon = 'assets/icons/barcode.svg';
const String trashIcon = 'assets/icons/trash.svg';
const String callIcon = 'assets/icons/call.svg';
const String call1Icon = 'assets/icons/call1.svg';
const String locationIcon = 'assets/icons/location.svg';
const String locationBoldIcon = 'assets/icons/locationBold.svg';
const String buildingIcon = 'assets/icons/building.svg';
const String walletIcon = 'assets/icons/wallet.svg';
const String errorMarkIcon = 'assets/icons/errorMark.svg';
const String notificationIcon = 'assets/icons/notification.svg';
const String boxIcon = 'assets/icons/box.svg';
const String shopIcon = 'assets/icons/shop.svg';
const String clockIcon = 'assets/icons/clock.svg';
const String bagTimerIcon = 'assets/icons/bagTimer.svg';
const String favoriteIcon = 'assets/icons/favorite.svg';
const String carIcon = 'assets/icons/car.svg';
const String handUpIcon = 'assets/icons/handUp.svg';
const String closeCircleIcon = 'assets/icons/closeCircle.svg';
const String refreshSquareIcon = 'assets/icons/refreshSquare.svg';
const String smsIcon = 'assets/icons/sms.svg';
const String calendarIcon = 'assets/icons/calendar.svg';
const String routingIcon = 'assets/icons/routing.svg';
const String addSquareIcon = 'assets/icons/addSquare.svg';
const String documentIcon = 'assets/icons/document.svg';
const String boxTimeIcon = 'assets/icons/boxTime.svg';
const String messagesIcon = 'assets/icons/messages.svg';

//need for bottomNavBar for routing
List<String> indexRouteNames = [
  'home',
  'category',
  'favorite',
  'bag',
  'profile',
];
//category slider name
List<String> categoryName = [
  'Woman',
  'Male',
  'Child',
  'Cosmetic',
  'Sport & Out',
];
List<String> categoryGenderName = [
  'Woman',
  'Male',
];

//bottomNavBar label and icon
List<Map<String, dynamic>> bottomNavBarItemName = [
  {
    'icon': homeIcon,
    'iconBold': homeBoldIcon,
    'label': 'Homepage',
  },
  {
    'icon': categoryIcon,
    'iconBold': categoryBoldIcon,
    'label': 'Category',
  },
  {
    'icon': heartIcon,
    'iconBold': heartBoldIcon,
    'label': 'Favourites',
  },
  {
    'icon': shoppingBagIcon,
    'iconBold': shoppingBagBoldIcon,
    'label': 'Bag',
  },
  {
    'icon': userIcon,
    'iconBold': userBoldIcon,
    'label': 'Profile',
  },
];

//top products
List<CartItem> topProducts = [
  CartItem(
    id: 1,
    image: manImage,
    discount: 10,
    price: 1289,
    previousPrice: 128,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 2,
    image: manImage,
    discount: null,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 3,
    image: manImage,
    discount: 15,
    price: 1500,
    previousPrice: 225,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 4,
    image: manImage,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 5,
    image: manImage,
    discount: 75,
    price: 1289,
    previousPrice: 966,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 6,
    image: manImage,
    discount: 20,
    price: 257,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 7,
    image: manImage,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 8,
    image: manImage,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 9,
    image: manImage,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 10,
    image: manImage,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 11,
    image: manImage,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
  CartItem(
    id: 12,
    image: manImage,
    price: 1289,
    brand: 'Mavi',
    desc: '530 Lifestyle Unisex Beyaz Spor Ayakkabı Mr5',
    starRating: '4.9',
  ),
];

//brands
List<Map<String, dynamic>> brands = [
  {'image': brand1Image, 'title': 'Pull & Bear'},
  {'image': brand2Image, 'title': 'Dyson'},
  {'image': brand3Image, 'title': 'Stradivarius'},
  {'image': brand4Image, 'title': 'Adidas'},
  {'image': brand5Image, 'title': 'Defacto'},
];
List<Map<String, dynamic>> categoryTypes = [
  {
    'title': 'Sale',
    'images': [
      {'image': woman1Image, 'title': 'Final Sale'},
      {'image': woman2Image, 'title': 'View all'},
      {'image': woman3Image, 'title': 'New in Sale'},
      {'image': woman4Image, 'title': 'Sweaters & Cardigans'},
      {'image': woman5Image, 'title': 'Jackets & Coasts'},
      {'image': woman6Image, 'title': 'Blazers'},
      {'image': woman7Image, 'title': 'Boots & Shoes'},
      {'image': woman8Image, 'title': 'Shirts & Blousers'},
      {'image': woman9Image, 'title': 'Sweatshirts & Hoodies'},
      {'image': woman10Image, 'title': 'T-shirts & Tops'},
      {'image': woman11Image, 'title': 'Dresses'},
      {'image': woman12Image, 'title': 'Skirts & Shorts'},
    ],
  },
  {
    'title': 'New in',
    'images': [
      {'image': woman1Image, 'title': 'Final Sale'},
      {'image': woman2Image, 'title': 'View all'},
      {'image': woman3Image, 'title': 'New in Sale'},
      {'image': woman4Image, 'title': 'Sweaters & Cardigans'},
    ],
  },
  {
    'title': 'Clothing',
    'images': [
      {'image': woman5Image, 'title': 'Jackets & Coasts'},
      {'image': woman6Image, 'title': 'Blazers'},
      {'image': woman7Image, 'title': 'Boots & Shoes'},
      {'image': woman8Image, 'title': 'Shirts & Blousers'},
      {'image': woman9Image, 'title': 'Sweatshirts & Hoodies'},
    ],
  },
  {
    'title': 'Dresses',
    'images': [
      {'image': woman10Image, 'title': 'T-shirts & Tops'},
      {'image': woman11Image, 'title': 'Dresses'},
      {'image': woman12Image, 'title': 'Skirts & Shorts'},
    ],
  },
  {
    'title': 'Tops',
    'images': [
      {'image': woman1Image, 'title': 'Final Sale'},
      {'image': woman2Image, 'title': 'View all'},
      {'image': woman3Image, 'title': 'New in Sale'},
    ],
  },
  {
    'title': 'Pants & Jeans',
    'images': [
      {'image': woman9Image, 'title': 'Sweatshirts & Hoodies'},
      {'image': woman10Image, 'title': 'T-shirts & Tops'},
      {'image': woman11Image, 'title': 'Dresses'},
      {'image': woman12Image, 'title': 'Skirts & Shorts'},
    ],
  },
  {
    'title': 'Shoes & Accessories',
    'images': [
      {'image': woman5Image, 'title': 'Jackets & Coasts'},
      {'image': woman6Image, 'title': 'Blazers'},
      {'image': woman7Image, 'title': 'Boots & Shoes'},
      {'image': woman8Image, 'title': 'Shirts & Blousers'},
    ],
  },
  {
    'title': 'Sportswear',
    'images': [
      {'image': woman5Image, 'title': 'Jackets & Coasts'},
      {'image': woman6Image, 'title': 'Blazers'},
      {'image': woman7Image, 'title': 'Boots & Shoes'},
      {'image': woman8Image, 'title': 'Shirts & Blousers'},
      {'image': woman9Image, 'title': 'Sweatshirts & Hoodies'},
      {'image': woman10Image, 'title': 'T-shirts & Tops'},
      {'image': woman11Image, 'title': 'Dresses'},
      {'image': woman12Image, 'title': 'Skirts & Shorts'},
    ],
  },
  {
    'title': 'Trending Now',
    'images': [
      {'image': woman7Image, 'title': 'Boots & Shoes'},
      {'image': woman8Image, 'title': 'Shirts & Blousers'},
      {'image': woman9Image, 'title': 'Sweatshirts & Hoodies'},
    ],
  },
];

List<Map<String, dynamic>> filterSortList = [
  {
    'title': 'Sort',
    'icon': sortIcon,
    'subCategory': [
      'By popularity',
      'Ascending price',
      'Descending price',
      'New products',
    ],
  },
  {
    'title': 'Filters',
    'icon': filterIcon,
    'subCategory': [],
  },
  {
    'title': 'Category',
    'icon': null,
    'subCategory': [
      'Sale',
      'New in',
      'Clothing',
      'Dresses',
      'Tops',
      'Pants & Jeans',
      'Shoes & Accessories',
      'Sportswear',
      'Trending Now',
    ],
  },
  {
    'title': 'Brand',
    'icon': null,
    'subCategory': [
      'Adidas',
      'Nike',
      'H&m',
      'New york',
      'Pull & bear',
      'Mavi',
      'Lacoste',
    ],
  },
  {
    'title': 'Seller',
    'icon': null,
    'subCategory': [
      'plany Planyyew',
      'plany1 Planyyew1',
      'plany2 Planyyew2',
      'plany3 Planyyew3',
      'plany4 Planyyew4',
    ],
  },
];
List<Map<String, dynamic>> signInAgreement = [
  {
    'text':
        'I give my express consent to the processing and sharing of my personal data in order to provide me with advantageous offers.',
    'value': false,
  },
  {
    'text':
        'I have read and understood the information text regarding the processing of my personal data.',
    'value': false,
  }
];

List<String> sizeList = [
  '37',
  '38',
  '39',
  '40',
  '41',
  '42',
];
List<Map<String, dynamic>> productDesc = [
  {
    'title': 'Vendor code',
    'desc': '147852',
  },
  {
    'title': 'Compound',
    'desc': 'Cotton 85%; polyester 15%',
  },
  {
    'title': 'Season',
    'desc': 'Year-round',
  },
  {
    'title': 'Year-round',
    'desc': '147852',
  },
  {
    'title': 'Modal features',
    'desc': 'Wear resistance',
  },
  {
    'title': 'Modal\'s size',
    'desc': '46',
  },
];
List<String> manClothList = [
  manCloth1Image,
  manCloth2Image,
  manCloth3Image,
];

List<Map<String, dynamic>> filterNameList = [
  //0 means need to go next screen
  //1 means need to open dropdown
  //2 means need switcher
  {
    'title': 'Brand',
    'openingStyle': 0,
    'subCategory': [
      'Adidas',
      'Nike',
      'H&m',
      'New york',
      'Pull & bear',
      'Mavi',
      'Lacoste',
    ],
  },
  {
    'title': 'Gender',
    'openingStyle': 0,
    'subCategory': [
      'Male',
      'Female',
      'Unisex',
    ],
  },
  {
    'title': 'Store',
    'openingStyle': 0,
    'subCategory': [
      'store1',
      'store2',
      'store3',
    ],
  },
  {
    'title': 'Price',
    'openingStyle': 1,
    'subCategory': null,
  },
  {
    'title': 'Color',
    'openingStyle': 0,
    'subCategory': [
      'Red',
      'Black',
      'Gold',
      'Orange',
    ],
  },
  {
    'title': 'Category',
    'openingStyle': 0,
    'subCategory': [
      'Sale',
      'New in',
      'Clothing',
      'Dresses',
      'Tops',
      'Pants & Jeans',
      'Shoes & Accessories',
      'Sportswear',
      'Trending Now',
    ],
  },
  {
    'title': 'Size',
    'openingStyle': 0,
    'subCategory': [
      '37',
      '38',
      '39',
      '40',
      '41',
      '42',
    ],
  },
  {
    'title': 'Material',
    'openingStyle': 0,
    'subCategory': [
      'Leather',
    ],
  },
  {
    'title': 'Pattern',
    'openingStyle': 0,
    'subCategory': [
      'pattern1',
      'pattern2',
      'pattern3',
    ],
  },
  {
    'title': 'Discount products',
    'openingStyle': 0,
    'subCategory': null,
  },
  {
    'title': 'Raiting up to 4.5',
    'openingStyle': 2,
    'subCategory': null,
  },
  {
    'title': 'Original product',
    'openingStyle': 2,
    'subCategory': null,
  },
  {
    'title': 'Pemium seller',
    'openingStyle': 2,
    'subCategory': [],
  },
];

List<Map<String, dynamic>> checkOutCardSelection = [
  {
    'icon': locationIcon,
    'title': 'Adress Info',
  },
  {
    'icon': walletIcon,
    'title': 'Payment options',
  }
];

///regions
final List<Region> regions = [
  Region(id: 1, name: 'Ahal'),
  Region(id: 2, name: 'Mary'),
  Region(id: 3, name: 'Lebap'),
  Region(id: 4, name: 'Balkan'),
  Region(id: 5, name: 'Dashoguz'),
];

///district
final List<District> districts = [
  District(id: 1, regionId: 1, name: 'Babadaýhan'),
  District(id: 2, regionId: 1, name: 'Bäherden'),
  District(id: 3, regionId: 1, name: 'Gökdepe'),
  District(id: 4, regionId: 1, name: 'Kaka'),
  District(id: 5, regionId: 1, name: 'Sarahs'),
  District(id: 6, regionId: 1, name: 'Tejen'),
  District(id: 1, regionId: 2, name: 'Baýramaly'),
  District(id: 2, regionId: 2, name: 'Mary'),
  District(id: 3, regionId: 2, name: 'Sakarçäge'),
  District(id: 4, regionId: 2, name: 'Tagtabazar'),
  District(id: 1, regionId: 3, name: 'Çarjew'),
  District(id: 2, regionId: 3, name: 'Halaç'),
  District(id: 3, regionId: 3, name: 'Kerki'),
  District(id: 1, regionId: 4, name: 'Bereket'),
  District(id: 2, regionId: 4, name: 'Etrek'),
  District(id: 3, regionId: 4, name: 'Esenguly'),
  District(id: 1, regionId: 5, name: 'Akdepe'),
  District(id: 2, regionId: 5, name: 'Boldumsaz'),
  District(id: 3, regionId: 5, name: 'Shabat'),
];

///vilages
final List<Village> villages = [
  Village(id: 1, regionId: 1, name: 'VillageAhal 1'),
  Village(id: 2, regionId: 1, name: 'VillageAhal2'),
  Village(id: 3, regionId: 1, name: 'VillageAhal 3'),
  Village(id: 4, regionId: 1, name: 'VillageAhal 4'),
  Village(id: 5, regionId: 1, name: 'VillageAhal 5'),
  Village(id: 6, regionId: 1, name: 'VillageAhal 6'),
  Village(id: 1, regionId: 2, name: 'VillageMary 1'),
  Village(id: 2, regionId: 2, name: 'VillageMary 2'),
  Village(id: 3, regionId: 2, name: 'VillageMary 3'),
  Village(id: 4, regionId: 2, name: 'VillageMary 4'),
  Village(id: 1, regionId: 3, name: 'VillageLebap 1'),
  Village(id: 2, regionId: 3, name: 'VillageLebap 2'),
  Village(id: 3, regionId: 3, name: 'VillageLebap 3'),
  Village(id: 1, regionId: 4, name: 'VillageBalkan 1'),
  Village(id: 2, regionId: 4, name: 'VillageBalkan 2'),
  Village(id: 3, regionId: 4, name: 'VillageBalkan 3'),
  Village(id: 1, regionId: 5, name: 'VillageDz 1'),
  Village(id: 2, regionId: 5, name: 'VillageDz 2'),
  Village(id: 3, regionId: 5, name: 'VillageDz 3'),
];

//pay methods
final List payMethod = [
  'Pay cash',
  'Terminal',
];
//months
final List month = [
  'January',
  'Februrary',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'Septeber',
  'October',
  'November',
  'December',
];
//month 30
final List<String> monthsWith31Days = [
  'January',
  'March',
  'May',
  'July',
  'August',
  'October',
  'December',
];
//month 31
final List<String> monthsWith30Days = [
  'April',
  'June',
  'September',
  'November',
];
//profile screen container names
final List<Map<String, dynamic>> profileCarditems = [
  {'title': 'All My Orders', 'icon': boxIcon},
  {'title': 'Products visited before', 'icon': clockIcon},
  {'title': 'Following stores', 'icon': shopIcon},
  {'title': 'Buy again', 'icon': bagTimerIcon},
];
//profile Screen my accaunt cards

final List<Map<String, dynamic>> userAccauntitems = [
  {'title': 'User Information', 'icon': userBoldIcon},
  {'title': 'Address Information', 'icon': locationBoldIcon},
  {'title': 'Help', 'icon': errorMarkIcon},
];
//order dropdown
final List<OrderFilterModal> orderFilter = [
  OrderFilterModal(id: 0, name: 'All'),
  OrderFilterModal(id: 1, name: 'Canceled'),
  OrderFilterModal(id: 2, name: 'Processed'),
  OrderFilterModal(id: 3, name: 'Received'),
];
//help question and answer
List<Map<String, dynamic>> popularAskedQuestions = [
  {
    'title': 'What are the privileges of elite membership?',
    'answer':
        '''What are the privileges of elite membership?', 'answer': 'The refund of the product you canceled may vary depending on your bank. This period may take approximately 1 week.
The refund process for the product you returned is as follows;
• After the product reaches the seller, its compliance with the return conditions is checked within 48 hours at the latest.
• If the product meets the return conditions, your return will be approved and your refund will be reflected on your payment card within 2-10 business days, depending on your bank.
• If the product does not meet the return conditions, it will be sent back to your address.
''',
  },
  {
    'title': 'What is the pick up point?',
    'answer':
        '''What are the privileges of elite membership?', 'answer': 'The refund of the product you canceled may vary depending on your bank. This period may take approximately 1 week.
The refund process for the product you returned is as follows;
• After the product reaches the seller, its compliance with the return conditions is checked within 48 hours at the latest.
• If the product meets the return conditions, your return will be approved and your refund will be reflected on your payment card within 2-10 business days, depending on your bank.
• If the product does not meet the return conditions, it will be sent back to your address.
''',
  },
  {
    'title':
        'If I cancel or return an order that benefits from the campaign, will the campaign be cancelled?',
    'answer': 'Yes',
  },
  {'title': 'How do I become an elite?', 'answer': 'I dont know'},
  {
    'title': 'What is a health declaration?',
    'answer': 'What is a health declaration.',
  },
];
List<String> allTopicslist = [
  'What is a closet? How to use?',
  'My account',
  'Fast market',
  'Return',
  'Communication',
  'Transaction guide',
  'Orders',
  'Corporate invoice',
  'Shipping and Delivery',
  'Lucky draw',
];
//orderDtails card
List<Map<String, dynamic>> ordersDetailsCard = [
  //color is 0 ==blue
  //color is 1 == green
  ///color is 2 ==black
  {
    'icon': walletIcon,
    'title': 'Amount',
    'subtitle': '1250.00 tmt',
    'color': 0,
    'textColor': 0,
  },
  {
    'icon': carIcon,
    'title': 'Status',
    'subtitle': 'Shipped',
    'color': 1,
    'textColor': 1,
  },
  {
    'icon': calendarIcon,
    'title': 'Order date',
    'subtitle': '12 march - 2024',
    'color': 0,
    'textColor': 2,
  },
  {
    'icon': boxIcon,
    'title': 'Order summary',
    'subtitle': '1 delivery 2 products',
    'color': 0,
    'textColor': 2,
  },
];

// store profile clothes
List<Map<String, dynamic>> storeClothes = [
  {
    'image': coatImage,
    'name': 'Coat',
  },
  {
    'image': jeansImage,
    'name': 'Jeans',
  },
  {
    'image': jumperImage,
    'name': 'Jumber',
  },
  {
    'image': trousersImage,
    'name': 'Trousers',
  },
];
//store scrolling banner list
List scrollingBanner = [avvaBrandImage, manCloth1Image];
//store seller profile card
List<Map<String, dynamic>> sellerProfileCard = [
  {
    'icon': calendarIcon,
    'title': 'Duration at Trend',
    'subTitle': '5 years',
  },
  {
    'icon': locationBoldIcon,
    'title': 'Location',
    'subTitle': 'Ashgabat',
  },
  {
    'icon': documentIcon,
    'title': 'Corporate Invoice',
    'subTitle': 'Suitable',
  },
];
//store seller profile time card
List<Map<String, dynamic>> sellerProfileTime = [
  {
    'icon': boxTimeIcon,
    'title': 'Average Shipping Time',
    'time': '14 days',
  },
  {
    'icon': messagesIcon,
    'title': 'Question Answering Time',
    'time': '10 min',
  }
];
