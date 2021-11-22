
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:swan/global/reusable.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:swan/view/filter_screen.dart';
import '../model/search_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentPage = 1;
   int? totalPages;
   bool? isFav;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
    bool isLoading = false;
    int pageNo=0;
    Map<String,String> headr={'Content-Type':'application/x-www-form-urlencoded'};
    final fireInstanse= FirebaseFirestore.instance.collection('Favourite');
  Search? search;
    List<PropertyList> items = [ ];

 
 Future<Search> fetch({Object? body1})async{
    final response = await http.post(Uri.parse('https://api.openhousesdirect.com/api/v1/property/search/'),
    headers:headr,
    body: body1??{
       'filter_by_day':'4',
    'local_event_start_date':'2021-11-15',
    'local_event_end_date':'2021-12-15',
    'event_start_date':'2021-11-15',
    'event_end_date':'2021-12-15',
    'gmap_bounds':'{}',
    'geo_bounding_box':'{}',
    'is_map_list':'false',
    'request_type':'WEB',
    'page_no':'$currentPage',
    'list_type':'0',
    'open_house_type[0]':'0',
    'city':'0',
    'abrrevation':'AZ',
    'state':'56',
    'geo_id':'0',
    'zipcode':'0',
    'zipcode_code':'0',
    'suggestion':'Arizona'});
    if (response.statusCode==200) {
    var data=await jsonDecode(response.body);
 search=Search.fromJson(data['result']);
  setState(() {
    items.addAll(search!.propertyList);
    isLoading=true;
  });   
 }
 return search!;
 }



listUi(int index){
  return 
  search!.totalProeprtyCount==0?const Center(child: Text('No Data'),):
  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12
            ,vertical: 6),
            child: Container(
            height: MediaQuery.of(context).size.height*0.25,
            child:  Stack(
              children: [
                Positioned(child: Column(
                  children: [
                    IconButton(onPressed: ()async{
                      await fireInstanse.add({'user':items[index].user}).then((value) {
                        fireInstanse.doc(value.id).update({'docId':value.id});
                      });
               print('Favourite');
                    },
              
             
              // QuerySnapshot snapshot= await fireInstanse.where('user',isEqualTo:items[index].user ).get();
              // if (snapshot.docs.isNotEmpty) {
              //   setState(() {
              //     isFav=true;
              //   });
              // } else {
              //   isFav=false;
              // }
                 
                
                
                
                 icon:const  Icon(Icons.favorite_border,size: 40,color: Colors.white,)),
              items[index].eventList.isNotEmpty?  SizedBox(
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width*0.15,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Column(
                      children: [
                      Stack(
                        children: [
                          Container(
                          height: MediaQuery.of(context).size.height*0.02,
                          decoration: BoxDecoration(color: Palete.cyan,borderRadius:  const BorderRadius.vertical(top: Radius.circular(10))),),
                        
                        Align(alignment: Alignment.center,child: Text(DateFormat('EEEE').format(DateTime.parse(items[index].eventList[0].date)).toString().substring(0,3)))
                        ],
                      ),
                     const SizedBox(height: 5),
                   Text(DateFormat('dd').format(DateTime.parse(items[index].eventList[0].date)).toString(),style:const TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                ):Container()
                
                  ],
                ),top: 0,right: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8),
                 child: Column(
                   
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Reusable.text(items[index].propertyStatus),
                            minLeadingWidth: 10,
                            leading: Radio(
                          
                              
                              visualDensity:const  VisualDensity(horizontal: -4.0),
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                            activeColor:Palete.cyan,
                              value: items[index].propertyStatus, groupValue: '', onChanged: (value){},),
                          ),
                        ),
                        Reusable.text('\$ ${NumberFormat.decimalPattern().format( items[index].homePrice)}',fontsize: 25),
                       Reusable.text(items[index].location),
                       Reusable.text('${items[index].bedroom} bds | ${items[index].fullBath} ba | ${items[index].livingArea} sq ft'),
                  
                      ],
                    ),
               ),
                
              ],
            ),
            decoration: BoxDecoration(image: DecorationImage(image:
        
            
            items[index].propertyFile.isNotEmpty?
             NetworkImage(items[index].propertyFile):
            const NetworkImage('https://fakeimg.pl/640x360'),fit: BoxFit.cover)),
            
            ),
          );
}

Future<Search>? searchDetail;
 @override 
 void initState(){
   super.initState();
   searchDetail= fetch();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
         const Icon(Icons.circle,color: Colors.cyan,size: 30,)
        ,actions:const  [
        Icon(Icons.menu,color: Colors.cyan,size: 30,)
      ],
      bottom:  PreferredSize(
        child: Container(color: Colors.grey[200],child: Padding(padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(
               width: MediaQuery.of(context).size.width*0.65,
               height: MediaQuery.of(context).size.height*0.05,
               child:const  TextField(
                 cursorHeight: 18,
                 style: TextStyle(fontSize: 18),    
                 decoration:          
               InputDecoration(
                 contentPadding: EdgeInsets.all(10),
                 
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 0.0),
                  ),       
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black, width:0.5),
                  ),
                 hintText: 'Enter City',
                // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.5)),
                 fillColor: Colors.white,filled: true),)),
            ElevatedButton(onPressed: ()async{
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const FilterScreen())).then((value) {
             
               setState(() {
                 searchDetail= fetch(body1: {
    'filter_by_day':'4',
    'event_start_date':'2021-11-15',
    'event_end_date':'2021-12-15',
    'page_no':'0',
    'is_map_list':'false',
    'list_type':'0',
    'max_price':maxPrice.text.isEmpty?'0':maxPrice.text,
    'min_price':minPrice.text.isEmpty?'0':minPrice.text,
    'bedroom':bedroom.text.isEmpty?'0':bedroom.text,
    'open_house_type[0]':'0',
    'city':'0',
    'abrrevation':'AZ',
    'state':'56',
    'geo_id':'0',
    'zipcode':'0',
    'zipcode_code':'0',
    'suggestion':'Arizona',
    'geo_bounding_box':'{}',
    'request_type':'WEB',
  });
               });
             });

            }, child: const Text('Other Filters'),
            style: ElevatedButton.styleFrom(
              primary: Colors.cyan[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),)
          ],
        ),)),
      
      
       preferredSize: const Size.fromHeight(50)),
      ),
      body:FutureBuilder<Search>(
        future: searchDetail,
        builder: (BuildContext context, AsyncSnapshot snapshot){
       
          return 
          snapshot.hasData?
      SmartRefresher(
        controller: refreshController,
       
       enablePullUp: true,
        onRefresh: () async {
         refreshController.refreshFailed();
        },
        onLoading: () async{
         if (isLoading) {
           currentPage++;
           fetch();
           refreshController.loadComplete();
         } else {
           refreshController.loadFailed();
         }
          await fetch();
        },
        child: ListView.builder(   
             
                       padding: const EdgeInsets.only(top: 25),
                       itemCount: items.length,
                       itemBuilder: (BuildContext context,int index){
                       return listUi(index);
                     }),
      ) 
           
        :const Center(child: CircularProgressIndicator(),);
       
      })
      
    );
  }
}
//}
