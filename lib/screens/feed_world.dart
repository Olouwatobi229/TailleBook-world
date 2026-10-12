import 'package:flutter/material.dart';

class FeedWorldScreen extends StatelessWidget {
  final stories = [
    {"name": "Votre story", "img": "https://i.pravatar.cc/150?img=1", "isMe": true},
    {"name": "Lucas Martin", "img": "https://i.pravatar.cc/150?img=8"},
    {"name": "Émilie Roux", "img": "https://i.pravatar.cc/150?img=5"},
    {"name": "Yann Dupont", "img": "https://i.pravatar.cc/150?img=12"},
    {"name": "Sophie Lefèvr", "img": "https://i.pravatar.cc/150?img=9"},
  ];

  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F2F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Container(color: Colors.white, padding: EdgeInsets.symmetric(horizontal:16, vertical:12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Text("TailleBook", style: TextStyle(color: Color(0xFFD32F2F), fontSize:32, fontWeight: FontWeight.w900)), Row(children:[Icon(Icons.search, color: Color(0xFFD32F2F), size:28), SizedBox(width:16), Icon(Icons.messenger, color: Color(0xFFD32F2F), size:28), SizedBox(width:16), Icon(Icons.notifications_none, color: Color(0xFFD32F2F), size:28)])])),
            Container(color: Colors.white, padding: EdgeInsets.all(12), margin: EdgeInsets.only(bottom:8), child: Row(children:[CircleAvatar(radius:22, backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=1")), SizedBox(width:10), Expanded(child: Container(height:44, padding: EdgeInsets.symmetric(horizontal:16), decoration: BoxDecoration(color: Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(30), border: Border.all(color: Color(0xFFD32F2F).withOpacity(0.3))), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Text("A quoi pensez-vous?", style: TextStyle(color: Colors.grey[600])), Icon(Icons.camera_alt_outlined, color: Color(0xFFD32F2F))])))])),
            Container(color: Colors.white, padding: EdgeInsets.symmetric(vertical:12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Padding(padding: EdgeInsets.only(left:16, bottom:12), child: Text("Stories", style: TextStyle(fontWeight: FontWeight.bold, fontSize:18))), SingleChildScrollView(scrollDirection: Axis.horizontal, padding: EdgeInsets.only(left:12), child: Row(children: stories.map((s){ bool isMe=s["isMe"]==true; return Container(width:80, margin: EdgeInsets.only(right:10), child: Column(children:[Stack(children:[Container(width:68, height:110, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xFFD32F2F), width:2), image: DecorationImage(image: NetworkImage(s["img"]!), fit: BoxFit.cover))), if(isMe) Positioned(bottom:6, left:0, right:0, child: Center(child: Container(width:28, height:28, decoration: BoxDecoration(color: Color(0xFFD32F2F), shape: BoxShape.circle, border: Border.all(color: Colors.white, width:2)), child: Icon(Icons.add, color: Colors.white, size:18))))]), SizedBox(height:6), Text(s["name"]!, style: TextStyle(fontSize:11, fontWeight: FontWeight.w600), maxLines:1)])); }).toList()))])),
            SizedBox(height:8),
            Container(color: Colors.white, padding: EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Row(children:[CircleAvatar(radius:20, backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12")), SizedBox(width:10), Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text("Thomas Bernard", style: TextStyle(fontWeight: FontWeight.bold, fontSize:16, color: Color(0xFFD32F2F))), Row(children:[Text("il y a 12 min · Public · ", style: TextStyle(fontSize:12, color: Colors.grey)), Icon(Icons.public, size:12, color: Colors.grey)])])]), SizedBox(height:12), Text("Belle journée pour explorer le parc! ☀️ Le pique-nique d'automne est enfin là, parfait pour un café et des discussions entre amis.\nQui d'autre profite du soleil ce week-end?", style: TextStyle(fontSize:15, height:1.4)), SizedBox(height:12), ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network("https://images.unsplash.com/photo-1505236858219-4074a9d8c30e?w=800", height:240, width:double.infinity, fit: BoxFit.cover)), SizedBox(height:12), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Row(children:[Container(padding: EdgeInsets.all(4), decoration: BoxDecoration(color: Color(0xFFD32F2F), shape: BoxShape.circle), child: Icon(Icons.favorite, size:12, color: Colors.white)), SizedBox(width:6), Text("24", style: TextStyle(color: Colors.grey[600]))]), Text("8 commentaires · 3 partages", style: TextStyle(color: Colors.grey[600], fontSize:13))]), Divider(height:24), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[Row(children:[Icon(Icons.thumb_up, color: Color(0xFFD32F2F)), SizedBox(width:6), Text("J'aime", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F)))]), Row(children:[Icon(Icons.chat_bubble_outline), SizedBox(width:6), Text("Commenter")]), Row(children:[Icon(Icons.share), SizedBox(width:6), Text("Partager")])])])),
          ]),
        ),
      ),
    );
  }
}
