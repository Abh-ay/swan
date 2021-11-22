
import 'package:flutter/material.dart';
import 'package:swan/global/reusable.dart';
import 'package:swan/model/search_model.dart';
 TextEditingController maxPrice= TextEditingController();
  TextEditingController minPrice= TextEditingController();
  TextEditingController bedroom= TextEditingController();


class FilterScreen extends StatefulWidget {
  const FilterScreen({ Key? key }) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  FocusNode? minpriceFocus;
  FocusNode? maxpriceFocus;
  FocusNode? bedroomFocus;
  FocusNode? bathroomFocus;
  Map<String, bool> homeType = {
    'Single Family - Detached' : false,
    'Loft Style' : false,
    'Modeuler/Pre-Fab' : false,
    'Mfg/Mobile Housing' : false,
    'Gemini/Twin Home' : false,
    'Apartment Style/Flat' : false,
    'Town house' : false,
    'Patio Home':false,
  };
   Map<String, bool> eventType = {
    'SHOW ALL Open Houses' : false,
    'SHOW ONLY PRE-MLS/Coming Soon' : false,
    'Active Listings - No Open Houses' : false,
    
  };
  var getValue = [];
    Map<String,String> headr={'Content-Type':'application/x-www-form-urlencoded'};

  // Object? bod={
  //   'filter_by_day':'4',
  //   'event_start_date':'2021-11-15',
  //   'event_end_date':'2021-12-15',
  //   'page_no':'0',
  //   'is_map_list':'false',
  //   'list_type':'0',
  //   'max_price':maxPrice.text,
  //   'min_price':minPrice.text,
  //   'bedroom':bedroom.text,
  //   'open_house_type[0]':'0',
  //   'city':'0',
  //   'abrrevation':'AZ',
  //   'state':'56',
  //   'geo_id':'0',
  //   'zipcode':'0',
  //   'zipcode_code':'0',
  //   'suggestion':'Arizona',
  //   'geo_bounding_box':'{}',
  //   'request_type':'WEB',
  // };
  Search? search;




  getItems(){
    homeType.forEach((key, value) {
      if(value == true)
      {
        getValue.add(key); 
      }
      });
      eventType.forEach((key, value) {
        if (value==true){
         getValue.add(key); 
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        appBar: AppBar(title: const Text('Filter View'),),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(       
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Reusable.textGrey('Price'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child:Reusable.textField('Minimum',controller: minPrice,focusNode: minpriceFocus,focus: (String str){
                      FocusScope.of(context).unfocus();
                    }),),
                    const  SizedBox(width:15),
                  // const LinearProgressIndicator(value: 10,color: Colors.grey,),
                   SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Reusable.textField('Maximum',controller: maxPrice,focus: (String str){
                      FocusScope.of(context).unfocus();
                    } ))
                ],
              ),
             const SizedBox(height: 15,),
             Reusable.textGrey('Home Type'),
             Flexible(
               flex: 2,
               child: ListView(
                 
                 shrinkWrap: true,
                 padding: const EdgeInsets.all(0),
                     children: homeType.keys.map((String key) {
                       return  Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:[
                            Checkbox(
                              visualDensity: const VisualDensity(horizontal: -4.0),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          
                           value: homeType[key],
                           activeColor: Palete.cyan,
                           checkColor: Colors.white,
                           onChanged: (bool? value) {
                                       setState(() {
                                         homeType[key] = value!;
                                       });
                           },
                         ),
                       const  SizedBox(width: 20,),
                         Text(key,style: const TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize: 18),),
                         ]
                       );
                     }).toList(),
                         
                         
               ),
             ),
           const  SizedBox(height: 15,),
              Reusable.textGrey('Event Type'),
             Flexible(
               flex: 1,
               child: ListView(
                 
                 shrinkWrap: true,
                 padding: const EdgeInsets.all(0),
                     children: eventType.keys.map((String key) {
                       return  Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:[
                            Checkbox(
                              visualDensity: const VisualDensity(horizontal: -4.0),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          
                           value: eventType[key],
                           activeColor: Palete.cyan,
                           checkColor: Colors.white,
                           onChanged: (bool? value) {
                                       setState(() {
                                         eventType[key] = value!;
                                       });
                           },
                         ),
                       const  SizedBox(width: 20,),
                         Text(key,style: const TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize: 18),),
                         ]
                       );
                     }).toList(),
                         
                         
               ),
             ),
            const SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Reusable.textGrey('Bedrooms',fontsize: 18),
                     SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child:
                    Reusable.textField('Beds',controller: bedroom,focus:  (String str){
                      FocusScope.of(context).unfocus();
                    })),

                     
                   ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Reusable.textGrey('Bathrooms',fontsize: 18),
                     SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child:Reusable.textField('Baths',focus:  (String str){
                      FocusScope.of(context).unfocus();
                    })),

                     
                   ],
                 ),

             ],),
           
           const SizedBox(height: 15,),
           Reusable.textGrey('Sq. ft'),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child:  Reusable.textField('Minimum'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                
            child:  Reusable.textField('Maximum'),),
          
            
             ],
           ),
           ElevatedButton(onPressed: ()async{
            
             print('Done Filter');
             Navigator.pop(context);
           },
            child: const Text('Done'))
             ]
          ),
        ),
      )
    );
  }
}