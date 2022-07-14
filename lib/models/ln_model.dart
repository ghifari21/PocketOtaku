import 'package:pocketotaku/models/content_model.dart';

class LightNovel extends Content {
  int volume;
  int chapter;
  String published;
  String author;
  String artist;

  LightNovel({
    required this.volume,
    required this.chapter,
    required this.published,
    required this.author,
    required this.artist,
    required String title,
    required String image,
    required String synopsis,
    required double rating,
    required String demographic,
    required String genres,
    required String status,
    required String tag
  }) : super(title: title, image: image, synopsis: synopsis, rating: rating, demographic: demographic, genres: genres, status: status, tag: tag);
}

var lightNovelList = [
  LightNovel(
    title: 'Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e',
    image: 'assets/images/lns/classroomoftheelite.jpg',
    synopsis: 'Receiving funding from the government to nurture the next generation\'s hopefuls, Tokyo Metropolitan Advanced Nurturing High School brings together the brightest youth of Japan onto a single campus. At this seemingly perfect institution, the reserved Kiyotaka Ayanokouji arrives as an incoming member of class 1-D, where he befriends one of his classmates, the antisocial Suzune Horikita. At first, his peers revel in the academy\'s leisurely lifestyle, taking advantage of all of its state-of-the-art facilities. Soon enough, however, the facade of Tokyo Metropolitan Advanced Nurturing High School gives way to its true nature—only the top scoring classes can fully utilize the school\'s offerings, and Class D is the furthest from such a status. Standing at the bottom of the hierarchy, Class D houses all of the school\'s "worst" students. Following this rude awakening, Ayanokouji, Horikita, and the rest of Class D must overcome their differences and clash against other classes in order to climb to the coveted position of Class A by any means necessary.',
    rating: 8.91,
    demographic: 'Shounen',
    genres: 'Drama, Psychological, School',
    status: 'Finished',
    volume: 14,
    chapter: 110,
    published: 'May 25, 2015 to Sep 25, 2019',
    author: 'Kinugasa Shougo',
    artist: 'Tomose Shunsaku',
    tag: 'cote'
  ),
  LightNovel(
    title: 'Yahari Ore no Seishun Love Comedy wa Machigatteiru.',
    image: 'assets/images/lns/yahari.jpg',
    synopsis: 'Hachiman Hikigaya, a student in Soubu High School, is a cynical loner due to his traumatic past experiences in his social life. This eventually led to him developing a set of "dead fish eyes" and a twisted personality similar to that of a petty criminal. Believing that the concept of youth is a lie made up by youngsters who face their failures in denial, he turns in an essay that criticizes this exact mentality of youths. Irritated by the submission, his homeroom teacher, Shizuka Hiratsuka, forces him to join the Volunteer Service Club—a club that assists students to solve their problems in life, hoping that helping other people would change his personality. However, Yukino Yukinoshita, the most beautiful girl in school, is surprisingly the sole member of the club and a loner, albeit colder and smarter than Hikigaya. Their club soon expands when Yui Yuigahama joins them after being helped with her plight, and they begin to accept more requests. With his status quo as a recluse, Hikigaya attempts to solve problems in his own way, but his methods may prove to be a double-edged sword.',
    rating: 8.79,
    demographic: 'Shounen',
    genres: 'Comedy, Romance, School',
    status: 'Finsihed',
    volume: 18,
    chapter: 168,
    published: 'Mar 18, 2011 to Apr 20, 2021',
    author: 'Watari Wataru',
    artist: 'Ponkan⑧',
    tag: 'yahariore'
  ),
  LightNovel(
    title: 'Re:Zero kara Hajimeru Isekai Seikatsu',
    image: 'assets/images/lns/rezero.jpg',
    synopsis: 'Exiting the convenience store, Subaru Natsuki emerges to a busy town inhabited by humans and demi-humans. Using dragons and carriages as transportation, the town is clearly not the modern-day Japan that he is familiar with. However, as someone who spends his days engrossed in comics and games, Subaru assumes that he is a protagonist in this new fantasy world, harnessing supreme magical powers. Much to his dismay, that is not the case and things quickly go awry as he bumps into a group of thugs. Fortunately, a silver-haired beauty named Satella comes to his rescue, while looking for her stolen insignia. In return for her kindness, Subaru offers to help with the search, which eventually leads them to a loot shop. Assuming that the insignia was traded for money, Subaru enters the shop hoping to negotiate with the owner regarding the stolen item. However, much to his surprise, what awaits them is not the insignia but a brutal assassin that leads the two to their demise. But instead of waking up in the afterlife, Subaru is shocked to find himself standing alone in the midst of daytime, as if he never left the town in the first place. Thus, his life in another world mysteriously begins a second time.',
    rating: 8.79,
    demographic: 'Shounen',
    genres: 'Drama, Fantasy, Isekai, Psychological, Suspense, Time Travel',
    status: 'Ongoing',
    volume: 30,
    chapter: 210,
    published: 'Jan 23, 2014 to ?',
    author: 'Nagatsuki Tappei',
    artist: 'Ootsuka Shinichirou',
    tag: 'rezero'
  ),
  LightNovel(
    title: 'Kono Subarashii Sekai ni Shukufuku wo!',
    image: 'assets/images/lns/konosuba.jpg',
    synopsis: 'Game loving shut-in Kazuma Satou\'s life as a young schoolboy in Japan abruptly comes to an early end...or at least it was supposed to. When he opens his eyes, though, he sees a beautiful goddess that offers him a once in an after-lifetime chance to be reborn in a parallel world. The catch is that the world is violent and threatened by a growing evil! Fortunately, he can choose any one thing to bring with him. So he chooses the goddess, Aqua! And so his adventure with his gorgeous companion begins—if he could just get enough money and food to survive, keep his goddess out of trouble, and avoid grabbing the attention of the Demon King\'s army!',
    rating: 8.62,
    demographic: 'Shounen',
    genres: 'Adventure, Comedy, Fantasy, Isekai, Reincarnation',
    status: 'Finished',
    volume: 17,
    chapter: 127,
    published: 'Oct 1, 2013 to May 1, 2020',
    author: 'Akatsuki Natsume',
    artist: 'Mishima Kurone',
    tag: 'konosuba'
  ),
  LightNovel(
    title: 'Shuumatsu Nani Shitemasu ka? Isogashii desu ka? Sukutte Moratte Ii desu ka?',
    image: 'assets/images/lns/shumatsu.jpg',
    synopsis: 'Willem Kmetsch wakes up from his icy slumber as the last surviving Emnetwiht, a race of humans that populated the planet’s surface until they met their untimely demise five centuries ago at the hands of "Beasts." Currently, he lives among the hundred odd floating islands that make up civilization—otherwise inhabited by various other species, all of whom possess distinct animal-like features such as horns, fangs, wings, and scales. Because he lacks any such feature, Willem is referred to as a "markless." One day, Willem encounters another markless named Ctholly Nota Seniorious. He thinks nothing of the meeting, and continues to spend his days working odd jobs until he runs into her again, this time after accepting a military posting. Willem soon learns that the group of bubbly young Leprechauns he is tasked to look after are pivotal in the ongoing battle against the Beasts. These girls, who have had little exposure outside a world where they are treated as weapons, are willing to die if it means defeating the Beasts. Determined to nurture a life of normalcy for them, Willem soon becomes a father figure to the girls. Just like how he once went off to battle, he must now come to terms with watching these children go off to war.',
    rating: 8.55,
    demographic: 'Shounen',
    genres: 'Drama, Fantasy, Romance, Sci-Fi',
    status: 'Finished',
    volume: 5,
    chapter: 25,
    published: 'Nov 1, 2014 to Apr 1, 2016',
    author: 'Kareno Akira',
    artist: 'ue',
    tag: 'shuumatsu'
  ),
  LightNovel(
    title: 'Otonari no Tenshi-sama ni Itsunomanika Dame Ningen ni Sareteita Ken',
    image: 'assets/images/lns/otonarinotenshi.jpg',
    synopsis: 'After catching a cold by giving his only umbrella to a girl sitting in the rain, Amane Fujimiya only expects her to eventually return it. However, Mahiru Shiina, the "Angel" of Amane\'s school and his neighbor, instead gives him a lot more than that. Instead of just the umbrella, she insists on returning the favor by helping him recover from his cold. However, she is oblivious to the battlefield that is Amane\'s apartment. The only word Mahiru finds from her mouth to describe the chaos is "unsightly." But despite her unsympathetic description, Mahiru proceeds to help the hopeless Amane. Otonari no Tenshi-sama ni Itsunomanika Dame Ningen ni Sareteita Ken follows Amane as he is taken care of by Mahiru, who attends to various chores—from cleaning his apartment to cooking dinner. Is there anything that the Angel can not do?',
    rating: 8.42,
    demographic: 'Shounen',
    genres: 'Comedy, Romance',
    status: 'Ongoing',
    volume: 7,
    chapter: 72,
    published: 'Jun 14, 2019 to ?',
    author: 'Saeki-san',
    artist: 'Kazutake Hazano and Hanekoto',
    tag: 'otonaritenshi'
  ),
  LightNovel(
    title: 'Kage no Jitsuryokusha ni Naritakute!',
    image: 'assets/images/lns/kage.jpg',
    synopsis: 'Shadowbrokers are those who go unnoticed, posing as unremarkable people, when in truth, they control everything from behind the scenes. Sid wants to be someone just like that more than anything, and something as insignificant as boring reality isn’t going to get in his way! He trains in secret every single night, preparing for his eventual rise to power—only to denied his destiny by a run-of-the-mill (yet deadly) traffic accident. But when he wakes up in a another world and suddenly finds himself at the head of an actual secret organization doing battle with evil in the shadows, he’ll finally get a chance to act out all of his delusional fantasies!',
    rating: 8.31,
    demographic: 'Shounen',
    genres: 'Action, Comedy, Fantasy, Isekai, Reincarnation',
    status: 'Ongoing',
    volume: 4,
    chapter: 26,
    published: 'Nov 5, 2018 to ?',
    author: 'Aizawa Daisuke',
    artist: 'Touzai',
    tag: 'kageno'
  ),
  LightNovel(
    title: 'Mahouka Koukou no Rettousei',
    image: 'assets/images/lns/mahouka.jpg',
    synopsis: 'Magic is a product of neither legends nor fairy tales, but instead has become a technology of reality since a time unknown to people. Supernatural power became a technology systematized through magic, while magic became a technical skill. A "Supernatural Power User" became a "Magic Technician." Magic Technicians (in short, Magicians) are nurtured through Magic High Schools and Universities. This is a story about: Tatsuya, a defective elder brother low achiever. Miyuki, a perfect, flawless younger sister high achiever. After both siblings entered a Magic High School, The stage of daily turbulence was unveiled—.',
    rating: 8.22,
    demographic: 'Shounen',
    genres: 'Action, Romance, School, Sci-Fi, Supernatural',
    status: 'Finished',
    volume: 32,
    chapter: 332,
    published: 'Jul 8, 2011 to Sep 10, 2020',
    author: 'Satou Tsutomu',
    artist: 'Ishida Kana',
    tag: 'mahouka'
  ),
  LightNovel(
    title: 'Date a Live',
    image: 'assets/images/lns/datealive.jpg',
    synopsis: 'Three decades ago, more than a hundred million people fell victim to an unprecedented disaster that came to be known as a "spatial quake." Ever since then, humanity has built countermeasures to mitigate the damage from future catastrophes such as instantaneous evacuation methods and immediate rebuilding of any architectural damage. At present, 16-year-old Shidou Itsuka lives alone with his sister, Kotori. One day, he gets caught in a spatial quake despite preemptive warnings. Miraculously surviving the blast, he meets a mysterious girl in its wake, who he soon comes to know as a "Spirit"—supernatural beings who are the cause behind these spatial quakes. Coincidentally, he learns of the "Anti-Spirit Team," a specialized military unit tasked with destroying these Spirits with brute force. As if these revelations weren\'t shocking enough, Shidou finds himself recruited into working for Ratatoskr, an organization dedicated to peacefully reducing the threat brought by Spirits—with his sister as its commander! As the new weapon of Ratatoskr, Shidou must nullify the Spirits\' powers to prevent them from causing more havoc. His line of attack: go on dates with them, sealing the deal with a passionate kiss.',
    rating: 8.17,
    demographic: 'Shounen',
    genres: 'Harem, Mecha, Romance, School, Sci-Fi',
    status: 'Finished',
    volume: 22,
    chapter: 146,
    published: 'Mar 19, 2011 to Mar 19, 2020',
    author: 'Tachibana Koushi',
    artist: 'Tsunako',
    tag: 'dal'
  ),
  LightNovel(
    title: 'Saenai Heroine no Sodatekata',
    image: 'assets/images/lns/saenai.jpg',
    synopsis: 'The life of Tomoya Aki, a high school otaku working part-time to support his BD hoarding. With remarkable luck, he bumps head-first into, Megumi Katou, the most beautiful girl he has ever seen. Naturally, the meeting twists his life into a complicated torrent of relationships. Eriri Spencer Sawamura, his half-foreigner childhood friend who\'s always valued her relationship with MC. Kasumigaoka Utaha, a cold, composed renowned literary genius who shoves everyone aside from our protagonist. What is this? An eroge introduction? The tale of a small not quite doujin circle, but not quite indie studio\'s journey through the tough territory of Comiket and beyond.',
    rating: 8.05,
    demographic: 'Shounen',
    genres: 'Comedy, Drama, Harem, Romance, School',
    status: 'Finished',
    volume: 13,
    chapter: 120,
    published: 'Jul 20, 2012 to Oct 20, 2017',
    author: 'Maruto Fumiaki',
    artist: 'Misaki Kurehito',
    tag: 'saenai'
  ),
];