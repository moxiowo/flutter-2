import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CharacterScreen(),
    );
  }
}

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          CharacterPage(
            name: "先知 Seer",
            description:
                "很小的時候伊萊就能夠看到“幻影”，透過與其中一些幻影的對話，伊萊開始以一種全新的視角觀察這個世界。然而這種能力並沒有在經濟上為他帶來改善，對未婚妻的承諾促使他接受了來自歐利蒂絲莊園的邀請函。",
            imagePath: "assets/seer.png",
            infoList: [
              {"icon": Icons.person, "title": "姓名", "content": "伊萊·克拉克"},
              {"icon": Icons.male, "title": "性別", "content": "男"},
              {"icon": Icons.cake, "title": "生日", "content": "10月31日"},
              {"icon": Icons.star, "title": "角色定位", "content": "輔助位"},
              {"icon": Icons.favorite, "title": "喜歡的事物", "content": "飛禽、神秘學、占星"},
            ],
          ),
          CharacterPage(
            name: "攝影師",
            description:
                "跟隨父母從法國流亡到英格蘭，失去同胞兄弟的痛苦讓約瑟夫沉迷於繪畫。年復一年日復一日，約瑟夫用畫筆記錄自己的變化，彷彿同胞兄弟從來不曾離去。但他很快就意識到，畫紙內記錄的不過是虛假的倒影，再如何描繪也不會成為真實。這種痛苦持續了很長一段時間，直到他接觸到一種聲稱能將影像永久保留下的儀器才暫時停歇。約瑟夫似乎找到了記錄真實的途徑，他開始用這種神奇的儀器來記錄一切，隨著時間流逝，約瑟夫終於領悟到一件事：留在相片裡的只是影像，被拍攝的物品和人仍然會損壞、失色。一如他早夭的雙胞胎兄弟。他期望永久保存現實中那些人和物的鮮活形象，讓相片中的東西「活」過來。",
            imagePath: "assets/Photographer.png",
            infoList: [
              {"icon": Icons.person, "title": "姓名", "content": "约瑟夫·德拉索恩斯"},
              {"icon": Icons.male, "title": "性別", "content": "男"},
              {"icon": Icons.cake, "title": "生日", "content": "3月11日"},
              {"icon": Icons.star, "title": "角色定位", "content": "控場型監管"},
              {"icon": Icons.favorite, "title": "喜歡的事物", "content": "秋季、銀製品、攝影"},
            ],
          ),
        ],
      ),
    );
  }
}

class CharacterPage extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final List<Map<String, dynamic>> infoList;

  CharacterPage({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.infoList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text("\n$description", style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              ...infoList.map((info) => InfoCard(
                    icon: info["icon"],
                    title: info["title"],
                    content: info["content"],
                  )),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  InfoCard({required this.icon, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    );
  }
}
