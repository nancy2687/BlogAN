import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'services/push_notifications.dart';

void main() => runApp(const GiftApp());

// ==================== APP PRINCIPALE ====================
class GiftApp extends StatefulWidget {
  const GiftApp({super.key});

  @override
  State<GiftApp> createState() => _GiftAppState();
}

class _GiftAppState extends State<GiftApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pour Anaïs 💙',
      debugShowCheckedModeBanner: false,
      theme: isDark
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.blueGrey,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          : ThemeData(
              primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: const Color(0xFFF6F7FB),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blueGrey,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
      home: MainNavigation(
        toggleTheme: () {
          setState(() {
            isDark = !isDark;
          });
        },
        isDark: isDark,
      ),
    );
  }
}

// ==================== TYPES DE CONTENU ====================
enum ArticleContentType { text, image, link }

class ArticleContent {
  final ArticleContentType type;
  final String content;
  final String? description;

  const ArticleContent({
    required this.type,
    required this.content,
    this.description,
  });
}

class Article {
  final String title;
  final List<ArticleContent> contents;

  const Article({
    required this.title,
    required this.contents,
  });
}

// ==================== CONTENU CADEAU ====================
const List<Article> articles = [
  Article(
    title: '1',
    contents: [
      ArticleContent(
        type: ArticleContentType.text,
        content: '''
Cette appli est un premier cadeau en soit mais t'en as d'autres et avec les indices présent dans cette article tu dois deviner ce que c'est le premier.
“Parfois, quand tu ne sais pas quoi faire, quand tu t'ennuie, quand tu est triste, ouvre-moi… je pourrais avoir un petit mot pour toi 💌”
''',
      ),
      ArticleContent(
        type: ArticleContentType.image,
        content: 'assets/images/origami.jpeg',
        description: 'Indice 1',
      ),
      ArticleContent(
        type: ArticleContentType.image,
        content: 'assets/images/rose.png',
        description: 'Indice 2',
      ),
      ArticleContent(
        type: ArticleContentType.image,
        content: 'assets/images/enveloppe.png',
        description: 'Indice 3',
      ),
    ],
  ),
  Article(
    title: '2',
    contents: [
      ArticleContent(
        type: ArticleContentType.text,
        content: '''
Deuxième cadeau : Je suis fait avec de la laine et je ressemble parfois à une orange parfois à une clémentine parfois à un surnom qui t'a été donnée.
''',
      ),
      ArticleContent(
        type: ArticleContentType.image,
        content: 'assets/images/clementine.png',
      ),
      ArticleContent(
        type: ArticleContentType.image,
        content: 'assets/images/orange.png',
      ),
      ArticleContent(
        type: ArticleContentType.image,
        content: 'assets/images/anais.png',
        description: 'Un petit indice visuel',
      ),
    ],
  ),
  Article(
    title: '3',
    contents: [
      ArticleContent(
        type: ArticleContentType.text,
        content: '''
(le 31 janvier ) Cette appli c'est notre appli je vais essayer de la mettre à jour régulièrement et tu auras juste à l'ouvrir pour avoir des messages en direct de ma part.
(le 8 février) J'ai rajoutée une image et une playlist.
''',
      ),
      ArticleContent(
        type: ArticleContentType.link,
        content: 'https://open.spotify.com/playlist/37i9dQZF1DXc3KPAjGyPdm?si=yIOpMfkgQ7mpRMWakZwbtQ',
        description: 'Une petite playlist pour toi 🎧',
      ),
      
      ArticleContent(
        type: ArticleContentType.image,
        content: 'assets/images/berlin.png',
        description: 'Un petit souvenirs',
      ),
       ArticleContent(
        type: ArticleContentType.link,
        content: 'https://www.youtube.com/@LudovicBvideos',
        description: "C'est une chaine youtube que j'aime bien parce que il explique differents métiers (il les suis pendant une journée) et c'est vraiment intéresant.",
      ),
     
    ],
  ),
  Article(
  title: '4',
  contents: [
    ArticleContent(
      type: ArticleContentType.text,
      content: '''
(12 mars) Petit message du jour :
Même quand on se parle pas beaucoup,
tu comptes toujours énormément pour moi.
(27 mars) Petit message du jour : 
À demain !!!!!!!!!!!!!!!! ''',
),
	ArticleContent(
        type: ArticleContentType.link,
        content: 'https://canva.link/blahmjcsz913ry4',
        description: " (5 juillet 2026) Petit message du jour :  Voici le lien vers un souvenir (faudrait que on l'imprime ). Tu peux le modifier si t'a d'autres photos où moment que j'aurais pu oublier. ",
 ),
  ],
),
Article(
    title: '5',
    contents: [
      ArticleContent(
        type: ArticleContentType.text,
        content: ''' AUJOURD'HUI ON EST LE 31 AOÛT, DEMAIN C'EST LA RENTRÉE, LE DÉBUT D'UNE NOUVELLE ANNÉE SCOLAIRE; TOI QUI PASSE EN TERMINALE, MOI EN PREMIÈRE ANNÉE D'ÉTUDES SUPÉRIEURS.
        L'ANNÉE DERNIÈRE JE RENTRAIS EN TERMINALE ET TOI EN PREMIÈRE ET POURTANT BEAUCOUP DE CHOSES ONT ÉVOLUÉES ET NOTRE AMITIÉE ÉGALEMENT. 
        SAMEDI PROCHAIN POUR LA PREMIÈRE FOIS DE MA VIE ON VAS FÊTER MON ANNIVERSSAIRE TOUTES ENSEMBLES; TOUTES MES AMIES ENSEMBLES ET AVEC TOI LA MEILLEURES AMIES QUE JE PEUX AVOIR. JE T'AIME MON ANANAS 🩷
		 
		 Coucou !!! : Je suis trop contente que t'es enfin rencontrée toutes mes amies !!!!!!! Et après dormir chez toiiiii c'est TROPPP BIENNNN !!!!!  EVIDEMMENT QUE JE VIENS à TON ANNIV C'EST SUPER IMPORTANT ET PUIS J'AI PEUT-ÊTRE PREVUE QUELQUES PETITES CHOSES MAIS JE VAIS ME TAIRE. 
		J'AI PASSEE LE MEILLEURE ANNIVVVV DE MA VIE !!!!!!!! BISOUS ANANAS ❤️❤️❤️❤️''',
      ),
      
    ],
  ),

Article(
    title: 'Joyeux anniverssaire',
    contents:[
      ArticleContent(
        type: ArticleContentType.text,
        content: '''JOYEUX ANNIVVVVVVVVVVV MA VIE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! JOYEUX ANNIVERSSAIRE MON ANANAS, MA SOEUR !!!!!!!!!!!!! ''',
      ),
      ArticleContent(
        type: ArticleContentType.link,
        content: 'https://canva.link/tk0u3jjh1hi7mpc',
        description:"JOYEUX ANNIVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV",
      ),
    ],
),
];


// ==================== NAVIGATION PRINCIPALE ====================
class MainNavigation extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const MainNavigation({super.key, required this.toggleTheme, required this.isDark});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const InfoPage(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: widget.isDark ? Colors.white54 : Colors.black54,
        backgroundColor: widget.isDark ? Colors.black : Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
        ],
      ),
    );
  }
}

// ==================== PAGE D’ACCUEIL ====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Un petit coin pour toi 🌱')),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(article.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticlePage(article: article),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ==================== PAGE ARTICLE ====================
class ArticlePage extends StatelessWidget {
  final Article article;
  const ArticlePage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: article.contents.map((content) {
            switch (content.type) {
              case ArticleContentType.text:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    content.content,
                    style: const TextStyle(fontSize: 18, height: 1.5),
                  ),
                );
              case ArticleContentType.image:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Center(
                    child: Image.asset(
                      content.content,
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              case ArticleContentType.link:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextButton(
                    onPressed: () => _openLink(content.content),
                    child: Text(content.description ?? content.content),
                  ),
                );
            }
          }).toList(),
        ),
      ),
    );
  }

  void _openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

// ==================== PAGE INFO ====================
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool _chargement = false;
  String _message = '';

  Future<void> _activerNotifications() async {
    setState(() {
      _chargement = true;
      _message = 'Activation des notifications...';
    });

    final resultat = await PushNotifications.subscribe();

    if (!mounted) return;

    setState(() {
      _chargement = false;
      _message = resultat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info & Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App créée par Nancy\n\nContact : ',
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed:
                  _chargement ? null : _activerNotifications,
              icon: const Icon(Icons.notifications_active),
              label: Text(
                _chargement
                    ? 'Activation en cours...'
                    : 'Activer les notifications',
              ),
            ),
            const SizedBox(height: 16),
            if (_message.isNotEmpty)
              Text(_message),
          ],
        ),
      ),
    );
  }
}

