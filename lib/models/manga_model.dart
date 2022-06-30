class Manga {
  String title;
  String image;
  String synopsis;
  double rating;
  String volume;
  String status;
  String genres;
  String author;
  String artist;
  String demographic;
  String chapter;
  String published;

  Manga({
    required this.title,
    required this.image,
    required this.synopsis,
    required this.rating,
    required this.volume,
    required this.artist,
    required this.author,
    required this.chapter,
    required this.demographic,
    required this.genres,
    required this.published,
    required this.status,
  });
}

var mangaList = [
  Manga(
    title: 'Kaguya-sama wa Kokurasetai: Tensai-tachi no Renai Zunousen',
    image: 'assets/images/mangas/kaguya-sama.jpg',
    synopsis: 'Considered a genius due to having the highest grades in the country, Miyuki Shirogane leads the prestigious Shuchiin Academy\'s student council as its president, working alongside the beautiful and wealthy vice president Kaguya Shinomiya. The two are often regarded as the perfect couple by students despite them not being in any sort of romantic relationship. However, the truth is that after spending so much time together, the two have developed feelings for one another; unfortunately, neither is willing to confess, as doing so would be a sign of weakness. With their pride as elite students on the line, Miyuki and Kaguya embark on a quest to do whatever is necessary to get a confession out of the other. Through their daily antics, the battle of love begins!',
    rating: 8.92,
    volume: '26 Volumes.',
    artist: 'Akasaka Aka',
    author: 'Akasaka Aka',
    chapter: '267 Chapters',
    demographic: 'Seinen',
    genres: 'Comedy, Drama, Romance, Slice of Life, School Life',
    published: 'May 19, 2015 to ?',
    status: 'Ongoing'
  ),
  Manga(
    title: 'Haikyuu!!',
    image: 'assets/images/mangas/haikyuu.jpg',
    synopsis: 'The whistle blows. The ball is up. A dig. A set. A spike. Volleyball. A sport where two teams face off, separated by a formidable, wall-like net. The "Little Giant," standing at only 170 cm, overcomes the towering net and the wall of blockers. The awe-inspired Shouyou Hinata looks on at the ace\'s crow-like figure. Determined to reach great heights like the Little Giant, small-statured Hinata finally manages to form a team in his last year of junior high school, and enters his first volleyball tournament. However, his team is utterly defeated in their first game against the powerhouse school Kitagawa Daiichi, led by the genius, but oppressive setter dubbed the "King of the Court," Tobio Kageyama. Hinata enrolls into Karasuno High School seeking to take revenge against Kageyama in an official high school match and to follow in the Little Giant\'s footsteps—but his plans are ruined when he opens the gymnasium door to find Kageyama as one of his teammates. Now, Hinata must establish himself on the team and work alongside the problematic Kageyama to overcome his shortcomings and to fulfill his dream of making it to the top of the high school volleyball world.',
    rating: 8.84,
    volume: '45 Volumes',
    artist: 'Furudate Haruichi',
    author: 'Furudate Haruichi',
    chapter: '407 Chapters',
    demographic: 'Shounen',
    genres: 'Action, Comedy, Drama, Slice of Life, Sports, School Life',
    published: 'Feb 20, 2012 to Jul 20, 2020',
    status: 'Finished'
  ),
];