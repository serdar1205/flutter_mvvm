import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/custom_widget/custom_text.dart';
import 'package:flutter_mvvm/core/extension/string_extension.dart';
import 'package:flutter_mvvm/provider/currencies_provider.dart';
import 'package:flutter_mvvm/views/cart/cart.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';

class HomeView extends HomeViewModel{

  @override
  Widget build(BuildContext context) {

    var data =  context.watch<CurrenciesProvider>();
    return Provider(
      create: (_) => CurrenciesProvider(),
      child: myScaffold(context),
    );
  }

  Scaffold myScaffold(BuildContext context){
    var data = context.watch<CurrenciesProvider>();
    String appbarStatus = data.totalSum.toString();

    return Scaffold(
      appBar: AppBar(title: Text(appbarStatus),),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child:  data.isLoading ? const Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),),)
            :
        ListView.builder(
            itemCount: data.currencies.length,
            itemBuilder: (_, index){
              return ListTile(
                leading: CircleAvatar(child: Text(data.currencies[index].code)),
                title: Text("${data.currencies[index].title}".nagt),
                trailing: TextUzs(data.currencies[index].cbPrice),
              );
            }),
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: !data.isLoading ? Colors.blue : Colors.grey,
        onPressed: !data.isLoading ? (){
          context.read<CurrenciesProvider>().checkTotalSum();

          Navigator.push(context, MaterialPageRoute(builder: (_) => Cart()));
        } : null,
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  


//1 st way
/**
    FutureBuilder(
    future: getCurrencies(),
    builder: (context, AsyncSnapshot<List<CurrencyModel>> snapshot){
    if(!snapshot.hasData){
    return Center(child: CircularProgressIndicator.adaptive(),);
    }
    else if(snapshot.hasError){
    return Center(child: Text("Error: ${snapshot.hasError}"),);
    }
    else{
    var data = snapshot.data;
    return ListView.builder(
    itemCount: data!.length,
    itemBuilder: (_, index){
    return ListTile(
    leading: CircleAvatar(child: Text(data[index].code),),
    title: Text("${data[index].title}".nagt),
    trailing: TextUzs(data[index].cbPrice),
    );
    });
    }
    },
    ),
 */
}
