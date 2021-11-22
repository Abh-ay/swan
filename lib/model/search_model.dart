class Search {
  Search({
    required this.totalPages,
    required this.totalProeprtyCount,
    required this.itemsPerPage,
    required this.mapRecordList,
    required this.propertyList,
  });
  late final int totalPages;
  late final int totalProeprtyCount;
  late final int itemsPerPage;
  late final List<dynamic> mapRecordList;
  late final List<PropertyList> propertyList;
  
  Search.fromJson(Map<String, dynamic> json){
    totalPages = json['total_pages'];
    totalProeprtyCount = json['total_proeprty_count'];
    itemsPerPage = json['items_per_page'];
    mapRecordList = List.castFrom<dynamic, dynamic>(json['map_record_list']);
    propertyList = List.from(json['property_list']).map((e)=>PropertyList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_pages'] = totalPages;
    _data['total_proeprty_count'] = totalProeprtyCount;
    _data['items_per_page'] = itemsPerPage;
    _data['map_record_list'] = mapRecordList;
    _data['property_list'] = propertyList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PropertyList {
  PropertyList({
    required this.user,
    required this.street,
    required this.unitNumber,
    required this.stateName,
    required this.cityName,
    required this.zipcodeCode,
    required this.homePrice,
    required this.bedroom,
    required this.fullBath,
    required this.partialBath,
    required this.livingArea,
    required this.lotSize,
    required this.propertyType,
    required this.propertyStyle,
    required this.propertyDescription,
    required this.yearBuilt,
    required this.builder,
    required this.parcelId,
    required this.parking,
    required this.water,
    required this.parkingTotalSpace,
    required this.security,
    required this.accessibility,
    required this.condoFloorNo,
    required this.buildingUnitCount,
    required this.buildingFloors,
    required this.viewType,
    required this.buildingConstruction,
    required this.district,
    required this.school_1Name,
    required this.school_1Type,
    required this.school_2Name,
    required this.school_2Type,
    required this.school_3Name,
    required this.school_3Type,
    required this.neighborhood,
    required this.subdivision,
    required this.county,
    required this.directions,
    required this.elevation,
    required this.latitude,
    required this.longitude,
    required this.id,
    required this.propertyFile,
    required this.location,
    required this.isFavourite,
    required this.eventList,
    required this.propertyStatus,
    required this.onOpentoclose,
    required this.totalEventCount,
    required this.isRemove,
    required this.brokerageFirmName,
  });
  late final int user;
  late final String street;
  late final String unitNumber;
  late final String stateName;
  late final String cityName;
  late final String zipcodeCode;
  late final dynamic homePrice;
  late final int bedroom;
  late final double fullBath;
  late final int partialBath;
  late final String livingArea;
  late final String lotSize;
  late final String propertyType;
  late final String propertyStyle;
  late final String propertyDescription;
  late final int yearBuilt;
  late final String builder;
  late final String parcelId;
  late final List<String> parking;
  late final List<String> water;
  late final String parkingTotalSpace;
  late final List<String> security;
  late final List<String> accessibility;
  late final int condoFloorNo;
  late final int buildingUnitCount;
  late final int buildingFloors;
  late final List<String> viewType;
  late final List<String> buildingConstruction;
  late final String district;
  late final String school_1Name;
  late final String school_1Type;
  late final String school_2Name;
  late final String school_2Type;
  late final String school_3Name;
  late final String school_3Type;
  late final String neighborhood;
  late final String subdivision;
  late final String county;
  late final String directions;
  late final String elevation;
  late final double latitude;
  late final double longitude;
  late final int id;
  late final String propertyFile;
  late final String location;
  late final bool isFavourite;
  late final List<EventList> eventList;
  late final String propertyStatus;
  late final String onOpentoclose;
  late final int totalEventCount;
  late final bool isRemove;
  late final String brokerageFirmName;
  
  PropertyList.fromJson(Map<String, dynamic> json){
    user = json['user'];
    street = json['street'];
    unitNumber = json['unit_number'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    zipcodeCode = json['zipcode_code'];
    homePrice = json['home_price'];
    bedroom = json['bedroom'];
    fullBath = json['full_bath'];
    partialBath = json['partial_bath'];
    livingArea = json['living_area'];
    lotSize = json['lot_size'];
    propertyType = json['property_type'];
    propertyStyle = json['property_style'];
    propertyDescription = json['property_description'];
    yearBuilt = json['year_built'];
    builder = json['builder'];
    parcelId = json['parcel_id'];
    parking = List.castFrom<dynamic, String>(json['parking']);
    water = List.castFrom<dynamic, String>(json['water']);
    parkingTotalSpace = json['parking_total_space'];
    security = List.castFrom<dynamic, String>(json['security']);
    accessibility = List.castFrom<dynamic, String>(json['accessibility']);
    condoFloorNo = json['condo_floor_no'];
    buildingUnitCount = json['building_unit_count'];
    buildingFloors = json['building_floors'];
    viewType = List.castFrom<dynamic, String>(json['view_type']);
    buildingConstruction = List.castFrom<dynamic, String>(json['building_construction']);
    district = json['district'];
    school_1Name = json['school_1_name'];
    school_1Type = json['school_1_type'];
    school_2Name = json['school_2_name'];
    school_2Type = json['school_2_type'];
    school_3Name = json['school_3_name'];
    school_3Type = json['school_3_type'];
    neighborhood = json['neighborhood'];
    subdivision = json['subdivision'];
    county = json['county'];
    directions = json['directions'];
    elevation = json['elevation'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
    propertyFile = json['property_file'];
    location = json['location'];
    isFavourite = json['is_favourite'];
    eventList = List.from(json['event_list']).map((e)=>EventList.fromJson(e)).toList();
    propertyStatus = json['property_status'];
    onOpentoclose = json['on_opentoclose'];
    totalEventCount = json['total_event_count'];
    isRemove = json['is_remove'];
    brokerageFirmName = json['brokerage_firm_name']??json['brokerage_firm_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['street'] = street;
    _data['unit_number'] = unitNumber;
    _data['state_name'] = stateName;
    _data['city_name'] = cityName;
    _data['zipcode_code'] = zipcodeCode;
    _data['home_price'] = homePrice;
    _data['bedroom'] = bedroom;
    _data['full_bath'] = fullBath;
    _data['partial_bath'] = partialBath;
    _data['living_area'] = livingArea;
    _data['lot_size'] = lotSize;
    _data['property_type'] = propertyType;
    _data['property_style'] = propertyStyle;
    _data['property_description'] = propertyDescription;
    _data['year_built'] = yearBuilt;
    _data['builder'] = builder;
    _data['parcel_id'] = parcelId;
    _data['parking'] = parking;
    _data['water'] = water;
    _data['parking_total_space'] = parkingTotalSpace;
    _data['security'] = security;
    _data['accessibility'] = accessibility;
    _data['condo_floor_no'] = condoFloorNo;
    _data['building_unit_count'] = buildingUnitCount;
    _data['building_floors'] = buildingFloors;
    _data['view_type'] = viewType;
    _data['building_construction'] = buildingConstruction;
    _data['district'] = district;
    _data['school_1_name'] = school_1Name;
    _data['school_1_type'] = school_1Type;
    _data['school_2_name'] = school_2Name;
    _data['school_2_type'] = school_2Type;
    _data['school_3_name'] = school_3Name;
    _data['school_3_type'] = school_3Type;
    _data['neighborhood'] = neighborhood;
    _data['subdivision'] = subdivision;
    _data['county'] = county;
    _data['directions'] = directions;
    _data['elevation'] = elevation;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['id'] = id;
    _data['property_file'] = propertyFile;
    _data['location'] = location;
    _data['is_favourite'] = isFavourite;
    _data['event_list'] = eventList.map((e)=>e.toJson()).toList();
    _data['property_status'] = propertyStatus;
    _data['on_opentoclose'] = onOpentoclose;
    _data['total_event_count'] = totalEventCount;
    _data['is_remove'] = isRemove;
    _data['brokerage_firm_name'] = brokerageFirmName;
    return _data;
  }
}

class EventList {
  EventList({
    required this.id,
    required this.description,
    required this.eventType,
    required this.eventTypeMsg,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.streetAddress,
    required this.propertyFile,
    required this.location,
    required this.agentId,
    required this.agentName,
    required this.agentProfilePhoto,
    required this.agentPhone,
    required this.agentBrokerageFirmName,
    required this.latitude,
    required this.longitude,
    required this.propertyId,
    required this.propertyRate,
    required this.isInterested,
    required this.isCheckin,
    required this.isGoing,
    required this.openHouseRequestId,
    required this.openHouseId,
    required this.openHouseAgentAccountStatus,
    required this.isListhubEvent,
    required this.isPaidAccount,
    required this.isPermanentAccount,
  });
  late final int id;
  late final String description;
  late final String eventType;
  late final String eventTypeMsg;
  late final String date;
  late final String startTime;
  late final String endTime;
  late final String streetAddress;
  late final String propertyFile;
  late final String location;
  late final int agentId;
  late final String agentName;
  late final String agentProfilePhoto;
  late final String agentPhone;
  late final String agentBrokerageFirmName;
  late final double latitude;
  late final double longitude;
  late final int propertyId;
  late final PropertyRate propertyRate;
  late final bool isInterested;
  late final bool isCheckin;
  late final bool isGoing;
  late final int openHouseRequestId;
  late final int openHouseId;
  late final bool openHouseAgentAccountStatus;
  late final bool isListhubEvent;
  late final bool isPaidAccount;
  late final bool isPermanentAccount;
  
  EventList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = json['description'];
    eventType = json['event_type'];
    eventTypeMsg = json['event_type_msg'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    streetAddress = json['street_address'];
    propertyFile = json['property_file'];
    location = json['location'];
    agentId = json['agent_id'];
    agentName = json['agent_name'];
    agentProfilePhoto = json['agent_profile_photo'];
    agentPhone = json['agent_phone'];
    agentBrokerageFirmName = json['agent_brokerage_firm_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    propertyId = json['property_id'];
    propertyRate = PropertyRate.fromJson(json['property_rate']);
    isInterested = json['is_interested'];
    isCheckin = json['is_checkin'];
    isGoing = json['is_going'];
    openHouseRequestId = json['open_house_request_id'];
    openHouseId = json['open_house_id'];
    openHouseAgentAccountStatus = json['open_house_agent_account_status'];
    isListhubEvent = json['is_listhub_event'];
    isPaidAccount = json['is_paid_account'];
    isPermanentAccount = json['is_permanent_account'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['event_type'] = eventType;
    _data['event_type_msg'] = eventTypeMsg;
    _data['date'] = date;
    _data['start_time'] = startTime;
    _data['end_time'] = endTime;
    _data['street_address'] = streetAddress;
    _data['property_file'] = propertyFile;
    _data['location'] = location;
    _data['agent_id'] = agentId;
    _data['agent_name'] = agentName;
    _data['agent_profile_photo'] = agentProfilePhoto;
    _data['agent_phone'] = agentPhone;
    _data['agent_brokerage_firm_name'] = agentBrokerageFirmName;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['property_id'] = propertyId;
    _data['property_rate'] = propertyRate.toJson();
    _data['is_interested'] = isInterested;
    _data['is_checkin'] = isCheckin;
    _data['is_going'] = isGoing;
    _data['open_house_request_id'] = openHouseRequestId;
    _data['open_house_id'] = openHouseId;
    _data['open_house_agent_account_status'] = openHouseAgentAccountStatus;
    _data['is_listhub_event'] = isListhubEvent;
    _data['is_paid_account'] = isPaidAccount;
    _data['is_permanent_account'] = isPermanentAccount;
    return _data;
  }
}

class PropertyRate {
  PropertyRate({
    required this.rating,
    required this.floorplanRating,
    required this.bedroomRating,
    required this.bathroomRating,
    required this.kitchenRating,
    required this.finishesRating,
    required this.landscapingRating,
    required this.neighbourhoodRating,
    required this.priceRating,
    required this.notes,
  });
  late final String rating;
  late final bool floorplanRating;
  late final bool bedroomRating;
  late final bool bathroomRating;
  late final bool kitchenRating;
  late final bool finishesRating;
  late final bool landscapingRating;
  late final bool neighbourhoodRating;
  late final bool priceRating;
  late final String notes;
  
  PropertyRate.fromJson(Map<String, dynamic> json){
    rating = json['rating'];
    floorplanRating = json['floorplan_rating'];
    bedroomRating = json['bedroom_rating'];
    bathroomRating = json['bathroom_rating'];
    kitchenRating = json['kitchen_rating'];
    finishesRating = json['finishes_rating'];
    landscapingRating = json['landscaping_rating'];
    neighbourhoodRating = json['neighbourhood_rating'];
    priceRating = json['price_rating'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rating'] = rating;
    _data['floorplan_rating'] = floorplanRating;
    _data['bedroom_rating'] = bedroomRating;
    _data['bathroom_rating'] = bathroomRating;
    _data['kitchen_rating'] = kitchenRating;
    _data['finishes_rating'] = finishesRating;
    _data['landscaping_rating'] = landscapingRating;
    _data['neighbourhood_rating'] = neighbourhoodRating;
    _data['price_rating'] = priceRating;
    _data['notes'] = notes;
    return _data;
  }
}
