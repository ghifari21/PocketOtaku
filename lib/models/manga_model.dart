import 'package:pocketotaku/models/content_model.dart';

class Manga extends Content {
  int volume;
  String author;
  String artist;
  int chapter;
  String published;

  Manga({
    required this.volume,
    required this.artist,
    required this.author,
    required this.chapter,
    required this.published,
    required String title,
    required String image,
    required String synopsis,
    required double rating,
    required String demographic,
    required String genres,
    required String status,
    required String tag
  }) : super(title: title, image: image, synopsis: synopsis, rating: rating, demographic: demographic,
  genres: genres, status: status, tag: tag);
}

var mangaList = [
  Manga(
    title: 'Kaguya-sama wa Kokurasetai: Tensai-tachi no Renai Zunousen',
    image: 'assets/images/mangas/kaguya-sama.jpg',
    synopsis: 'Considered a genius due to having the highest grades in the country, Miyuki Shirogane leads the prestigious Shuchiin Academy\'s student council as its president, working alongside the beautiful and wealthy vice president Kaguya Shinomiya. The two are often regarded as the perfect couple by students despite them not being in any sort of romantic relationship. However, the truth is that after spending so much time together, the two have developed feelings for one another; unfortunately, neither is willing to confess, as doing so would be a sign of weakness. With their pride as elite students on the line, Miyuki and Kaguya embark on a quest to do whatever is necessary to get a confession out of the other. Through their daily antics, the battle of love begins!',
    rating: 8.92,
    volume: 26,
    artist: 'Akasaka Aka',
    author: 'Akasaka Aka',
    chapter: 267,
    demographic: 'Seinen',
    genres: 'Comedy, Drama, Romance, Slice of Life, School Life',
    published: 'May 19, 2015 to ?',
    status: 'Ongoing',
    tag: 'kaguyasama'
  ),
  Manga(
    title: 'Haikyuu!!',
    image: 'assets/images/mangas/haikyuu.jpg',
    synopsis: 'The whistle blows. The ball is up. A dig. A set. A spike. Volleyball. A sport where two teams face off, separated by a formidable, wall-like net. The "Little Giant," standing at only 170 cm, overcomes the towering net and the wall of blockers. The awe-inspired Shouyou Hinata looks on at the ace\'s crow-like figure. Determined to reach great heights like the Little Giant, small-statured Hinata finally manages to form a team in his last year of junior high school, and enters his first volleyball tournament. However, his team is utterly defeated in their first game against the powerhouse school Kitagawa Daiichi, led by the genius, but oppressive setter dubbed the "King of the Court," Tobio Kageyama. Hinata enrolls into Karasuno High School seeking to take revenge against Kageyama in an official high school match and to follow in the Little Giant\'s footsteps—but his plans are ruined when he opens the gymnasium door to find Kageyama as one of his teammates. Now, Hinata must establish himself on the team and work alongside the problematic Kageyama to overcome his shortcomings and to fulfill his dream of making it to the top of the high school volleyball world.',
    rating: 8.84,
    volume: 45,
    artist: 'Furudate Haruichi',
    author: 'Furudate Haruichi',
    chapter: 407,
    demographic: 'Shounen',
    genres: 'Action, Comedy, Drama, Slice of Life, Sports, School Life',
    published: 'Feb 20, 2012 to Jul 20, 2020',
    status: 'Finished',
    tag: 'haikyuu'
  ),
  Manga(
    title: 'One Punch-Man',
    image: 'assets/images/mangas/opm.jpg',
    synopsis: 'After rigorously training for three years, the ordinary Saitama has gained immense strength which allows him to take out anyone and anything with just one punch. He decides to put his new skill to good use by becoming a hero. However, he quickly becomes bored with easily defeating monsters, and wants someone to give him a challenge to bring back the spark of being a hero. Upon bearing witness to Saitama\'s amazing power, Genos, a cyborg, is determined to become Saitama\'s apprentice. During this time, Saitama realizes he is neither getting the recognition that he deserves nor known by the people due to him not being a part of the Hero Association. Wanting to boost his reputation, Saitama decides to have Genos register with him, in exchange for taking him in as a pupil. Together, the two begin working their way up toward becoming true heroes, hoping to find strong enemies and earn respect in the process.',
    rating: 8.74,
    volume: 26,
    artist: 'Murata Yusuke',
    author: 'ONE',
    chapter: 116,
    demographic: 'Seinen',
    genres: 'Action, Comedy, Drama, Mystery, Sci-Fi, Slice of Life, Superhero, Thriller, Martial Arts, Supernaturals',
    published: 'Jun 14, 2012 to ?',
    status: 'Ongoing',
    tag: 'opm'
  ),
  Manga(
    title: 'Chainsaw Man',
    image: 'assets/images/mangas/chainsawman.jpg',
    synopsis: 'Denji has a simple dream—to live a happy and peaceful life, spending time with a girl he likes. This is a far cry from reality, however, as Denji is forced by the yakuza into killing devils in order to pay off his crushing debts. Using his pet devil Pochita as a weapon, he is ready to do anything for a bit of cash. Unfortunately, he has outlived his usefulness and is murdered by a devil in contract with the yakuza. However, in an unexpected turn of events, Pochita merges with Denji\'s dead body and grants him the powers of a chainsaw devil. Now able to transform parts of his body into chainsaws, a revived Denji uses his new abilities to quickly and brutally dispatch his enemies. Catching the eye of the official devil hunters who arrive at the scene, he is offered work at the Public Safety Bureau as one of them. Now with the means to face even the toughest of enemies, Denji will stop at nothing to achieve his simple teenage dreams.',
    rating: 8.73,
    volume: 11,
    artist: 'Fujimoto Tatsuki',
    author: 'Fujimoto Tatsuki',
    chapter: 97,
    demographic: 'Shounen',
    genres: 'Action, Comedy, Horror, Demons, Monsters, Supernatural, Survival',
    published: 'Dec 3, 2018 to Dec 14, 2020',
    status: 'Finished',
    tag: 'chainsawman'
  ),
  Manga(
    title: 'Kono Oto Tomare!',
    image: 'assets/images/mangas/konoototomare.jpg',
    synopsis: 'Following the graduation of every other member of the Koto Music Club, Takezou Kurata is left alone as the new club president. Now burdened with the arduous task of rebuilding membership, he struggles to recruit anyone due to a lack of interest. Just as Kurata has lost nearly all hope in keeping the club alive, the feared delinquent Chika Kudou appears, claiming he will join and become the club president himself. At first, Kurata refuses to admit such a troublesome person, aware of the dark rumors that have been circulating about Kudou. However, after discovering a more vulnerable side to Kudou and his mysterious connection to the club, Kurata rethinks his decision. The soon-to-be defunct club is saved with the help of koto prodigy Satowa Houzuki, who uses her charms to recruit Kudou\'s lively friends Saneyasu Adachi, Michitaka Sakai, and Kouta Mizuhara. With sufficient numbers to retain the club\'s status, Houzuki declares that they will aim to become the best koto players in the nation, much to Kurata\'s dismay. This ragtag bunch of young musicians have a road filled with challenges and adversities ahead of them, and by overcoming their fears and differences, their aspirations may very well come true.',
    rating: 8.71,
    volume: 26,
    artist: 'Sakura Amyuu',
    author: 'Sakura Amyuu',
    chapter: 113,
    demographic: 'Shounen',
    genres: 'Comedy, Drama, Romance, Slice of Life, Sports, Music, School Life',
    published: 'Aug 4, 2012 to ?',
    status: 'Ongoing',
    tag: 'konoototomare'
  ),
  Manga(
    title: 'Hunter x Hunter',
    image: 'assets/images/mangas/hxh.jpg',
    synopsis: '"Secret treasure hoards, undiscovered wealth... mystical places, unexplored frontiers... \'The mysterious unknown.\' There\'s magic in such words for those captivated by its spell. They are called \'Hunters\'!" Gon Freecss wants to become a Hunter so he can find his father, a man who abandoned him to pursue a life of adventure. But it\'s not that simple: only one in one hundred thousand can pass the Hunter Exam, and that is just the first obstacle on his journey. During the Hunter Exam, Gon befriends many other potential Hunters, such as the mysterious Killua; the revenge-driven Kurapika; and Leorio, who aims to become a doctor. There\'s a world of adventure and peril awaiting, and those who embrace it with open arms can become the greatest Hunters of them all!',
    rating: 8.70,
    volume: 36,
    artist: 'Togashi Yoshihiro',
    author: 'Togashi Yoshihiro',
    chapter: 390,
    demographic: 'Shounen',
    genres: 'Action, Adventure, Comedy, Drama, Fantasy, Philosophical, Psychological, Thriller, Martial Arts, Supernatural',
    published: 'Mar 3, 1998 to Nov 26, 2018',
    status: 'On Hiatus',
    tag: 'hxh'
  ),
  Manga(
    title: 'Spy x Family',
    image: 'assets/images/mangas/spyxfamily.jpg',
    synopsis: 'For the agent known as "Twilight," no order is too tall if it is for the sake of peace. Operating as Westalis\' master spy, Twilight works tirelessly to prevent extremists from sparking a war with neighboring country Ostania. For his latest mission, he must investigate Ostanian politician Donovan Desmond by infiltrating his son\'s school: the prestigious Eden Academy. Thus, the agent faces the most difficult task of his career: get married, have a child, and play family. Twilight, or "Loid Forger," quickly adopts the unassuming orphan Anya to play the role of a six-year-old daughter and prospective Eden Academy student. For a wife, he comes across Yor Briar, an absent-minded office worker who needs a pretend partner of her own to impress her friends. However, Loid is not the only one with a hidden nature. Yor moonlights as the lethal assassin "Thorn Princess." For her, marrying Loid creates the perfect cover. Meanwhile, Anya is not the ordinary girl she appears to be; she is an esper, the product of secret experiments that allow her to read minds. Although she uncovers their true identities, Anya is thrilled that her new parents are cool secret agents! She would never tell them, of course. That would ruin the fun. Under the guise of "The Forgers," the spy, the assassin, and the esper must act as a family while carrying out their own agendas. Although these liars and misfits are only playing parts, they soon find that family is about far more than blood relations.',
    rating: 8.68,
    volume: 9,
    artist: 'Endou Tatsuya',
    author: 'Endou Tatsuya',
    chapter: 64,
    demographic: 'Shounen',
    genres: 'Action, Adventure, Comedy, Slice of Life, Martial Arts, School Life, Supernatural',
    published: 'Mar 25, 2019 to ?',
    status: 'Ongoing',
    tag: 'anya'
  ),
  Manga(
    title: 'Shigatsu wa Kimi no Uso',
    image: 'assets/images/mangas/shigatsuwakiminouso.jpg',
    synopsis: 'At a very young age, Kousei Arima was strictly taught how to play the piano and meticulously follow the score by his mother, to the point where he dominated every competition he entered with ease. He earned the title of "Human Metronome" for performing almost perfectly. Every musician of his age looked up to him. However, after his mother suddenly dies, he became tone-deaf due to the shock and then disappeared, never to be seen onstage since. Two years later, Kousei lives a monotonous life with his childhood friends Tsubaki Sawabe and Ryouta Watari supporting him. He continues to cling to music, although performing is still an impossibility for him. This is until his unexpected encounter with Kaori Miyazono, a violinist who performs freely without the dictations of a score. A story of friendship, love, music, and a single lie, Kousei\'s life begins to change and gain color as Kaori helps him to take up music again.',
    rating: 8.60,
    volume: 11,
    artist: 'Arakawa Naoshi',
    author: 'Arakawa Naoshi',
    chapter: 44,
    demographic: 'Shounen',
    genres: 'Comedy, Drama, Slice of Life, Tragedy, Music, School Life',
    published: 'Apr 6, 2011 to Feb 6, 2015',
    status: 'Finished',
    tag: 'kaori'
  ),
  Manga(
    title: 'Shingeki no Kyojin',
    image: 'assets/images/mangas/aot.jpg',
    synopsis: 'Hundreds of years ago, horrifying creatures which resembled humans appeared. These mindless, towering giants, called "Titans," proved to be an existential threat, as they preyed on whatever humans they could find in order to satisfy a seemingly unending appetite. Unable to effectively combat the Titans, mankind was forced to barricade themselves within large walls surrounding what may very well be humanity\'s last safe haven in the world. In the present day, life within the walls has finally found peace, since the residents have not dealt with Titans for many years. Eren Yeager, Mikasa Ackerman, and Armin Arlert are three young children who dream of experiencing all that the world has to offer, having grown up hearing stories of the wonders beyond the walls. But when the state of tranquility is suddenly shattered by the attack of a massive 60-meter Titan, they quickly learn just how cruel the world can be. On that day, Eren makes a promise to himself that he will do whatever it takes to eradicate every single Titan off the face of the Earth, with the hope that one day, humanity will once again be able to live outside the walls without fear.',
    rating: 8.57,
    volume: 34,
    artist: 'Isayama Hajime',
    author: 'Isayama Hajime',
    chapter: 141,
    demographic: 'Shounen',
    genres: 'Action, Drama, Horror, Mystery, Psychological, Thriller, Tragedy, Survival',
    published: 'Sep 9, 2009 to Apr 9, 2021',
    status: 'Finished',
    tag: 'ereenn'
  ),
  Manga(
    title: 'Wotaku ni Koi wa Muzukashii',
    image: 'assets/images/mangas/wotakoi.jpg',
    synopsis: 'Narumi Momose is a petite and cute young woman who loves idols, games, and everything anime or manga-related, especially in the boys\' love genre. In other words, she is a closet otaku and more specifically, a fujoshi. After a breakup due to these kind of interests, she quits her job and joins a new company. At her new workplace, the only colleagues who know about her secret are her childhood friend Hirotaka Nifuji, a blunt gaming otaku; Hanako Koyanagi, a cool and mature-looking beauty; and Tarou Kabakura, an attractive guy with a scary face who always gets into fights with Hanako. While having drinks to catch up, Hirotaka advises Narumi to date someone who would understand her hobbies. But she is hesitant—otakus are typically perceived as gross, and the only ones who can understand them are otakus themselves. Or could a relationship between two otakus work? Following the relationship of Narumi and Hirotaka as they begin dating, Wotaku ni Koi wa Muzukashii is a light-hearted story about those who try to balance work, relationships, and hobbies.',
    rating: 8.36,
    volume: 11,
    artist: 'Fujita',
    author: 'Fujita',
    chapter: 85,
    demographic: 'Josei',
    genres: 'Comedy, Office Workers, Romance, Slice of Life',
    published: 'Apr 30, 2015 to Jul 16, 2021',
    status: 'Finished',
    tag: 'wotakoi'
  ),
];