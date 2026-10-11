import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/feed_world.dart';
import 'services/taillebook_complete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try { await Firebase.initializeApp(); } catch(e) { debugPrint("Firebase pas config, mode mock OK"); }
  TranslationService.langueActuelle.value = "fr";
  runApp(TailleBookWorldApp());
}

class TailleBookWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TailleBook WORLD",
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Color(0xFFF0F2F5)),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget { @override State<MainPage> createState()=> _MainPageState(); }
class _MainPageState extends State<MainPage> {
  int onglet = 0;
  @override Widget build(BuildContext context){
    return Scaffold(
      body: [
        FeedWorldScreen(),
        Center(child: Text("Amis - FriendsService", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold))),
        Center(child: Text("Market - ProductsService", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold))),
        PubslookScreenWorld(),
        SecurityScreenWorld(),
      ][onglet],
      bottomNavigationBar: NavigationBar(
        selectedIndex: onglet,
        onDestinationSelected: (i)=> setState(()=> onglet=i),
        backgroundColor: Colors.white,
        indicatorColor: Color(0xFFD32F2F).withOpacity(0.2),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Accueil"),
          NavigationDestination(icon: Icon(Icons.people), label: "Amis"),
          NavigationDestination(icon: Icon(Icons.shopping_bag), label: "Market"),
          NavigationDestination(icon: Icon(Icons.local_fire_department, color: Colors.red), label: "Pubslook"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

// PUBSLOOK WORLD - design TikTok
class PubslookScreenWorld extends StatelessWidget {
  @override Widget build(BuildContext c){
    return StreamBuilder<List<VideoTikTokModel>>(
      stream: PubslookService.streamVideos(),
      builder: (_, snap){
        var vids = PubslookService.forYou();
        if(vids.isEmpty) vids = [VideoTikTokModel(id:"1", titre:"Formation 500k/mois #business #benin", owner:"Admin", vues:["a","b"], likes:["a"])];
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: vids.length,
          itemBuilder: (_,i){
            var v=vids[i];
            return Container(
              color: Colors.black,
              child: Stack(children:[
                Center(child: Text("▶️ ${v.titre}", style: TextStyle(color: Colors.white, fontSize:22, fontWeight: FontWeight.bold))),
                Positioned(right:16, bottom:100, child: Column(children:[
                  IconButton(onPressed: ()=> PubslookService.like(v.id,"Admin"), icon: Icon(Icons.favorite, color: Colors.white, size:32)),
                  Text("${v.likes.length}", style: TextStyle(color: Colors.white)),
                  SizedBox(height:20),
                  Icon(Icons.comment, color: Colors.white), SizedBox(height:20),
                  Icon(Icons.share, color: Colors.white),
                ])),
                Positioned(left:16, bottom:20, child: Text("@${v.owner}\n${v.titre}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              ]),
            );
          },
        );
      }
    );
  }
}

class SecurityScreenWorld extends StatelessWidget {
  @override Widget build(BuildContext c){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20),
        children:[
          SizedBox(height: 40),
          Text("Sécurité & 20 Langues", style: TextStyle(fontSize:22, fontWeight: FontWeight.w900)),
          SizedBox(height: 20),
         ...TranslationService.LANGUES.entries.map((e)=> ListTile(title: Text(e.value), trailing: ValueListenableBuilder(valueListenable: TranslationService.langueActuelle, builder: (_,lang,__){ return lang==e.key? Icon(Icons.check_circle, color: Colors.red): SizedBox(); }), onTap: ()=> TranslationService.changerLangue(e.key))),
          SizedBox(height: 20),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(16)), onPressed: ()=> SecurityService.supprimerMonCompte(()=>{}), child: Text("Supprimer mon compte définitivement", style: TextStyle(color: Colors.white))),
          SizedBox(height: 10),
          Text("Privacy Policy: https://sites.google.com/view/taillebook-privacy", style: TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ),
    );
  }
}
