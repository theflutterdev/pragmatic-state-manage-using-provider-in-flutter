import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider.dart';

void main(){
  runApp(
    MaterialApp(
      title: 'Hands on Provider',
      home: ChangeNotifierProvider(
        builder: (_)=>NetworkCall(),
        child: Home(),
      )
    )
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final networkObj = Provider.of<NetworkCall>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Network call using Provider"),
        centerTitle: true,
      ),
      body: networkObj.isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : networkObj.data == null ? Center(
        child: RaisedButton(
          color: Colors.blue,
          onPressed: (){
            networkObj.loadData();
          },
          child: Text("Load Idea", style: TextStyle(
            color: Colors.white,
          ),),
        )
      ) : ListView.builder(
        itemCount: networkObj.data.length,
        itemBuilder: (context, i)=> ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(networkObj.data[i]['url']),
          ),
          title: Text(networkObj.data[i]['title']),
        ),
      )
    );
  }
}