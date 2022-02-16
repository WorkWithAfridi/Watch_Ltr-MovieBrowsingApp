/// id : 425909
/// page : 1
/// results : [{"author":"garethmb","author_details":{"name":"","username":"garethmb","avatar_path":"/https://secure.gravatar.com/avatar/3593437cbd05cebe0a4ee753965a8ad1.jpg","rating":null},"content":"Back in 1984 when big hair and neon were the norms; a movie appeared that soon became a cultural phenomenon. The movie involved a team of unlikely Paranormal Investigators and the mix of comedy, FX, and Ghosts turned the movie into a smash hit and a Pop Culture mainstay. The abundance of products that followed and the inescapable theme song and tagline soon gave rise to a sequel which while a success; did not resonate the way the original film had and thus the “Ghostbusters” film franchise became dormant.\r\n\r\nWhile a successful video game and merchandise line kept the franchise alive; the 2016 reboot with an all-female team failed to capture the magic at the box office and again put the franchise’s cinematic future in question.\r\n\r\nThankfully after several delays due to the Covid 19 Pandemic; “Ghostbusters Afterlife” has arrived and is the worthy sequel that does justice to the original film and sets the stage well for future cinematic exploits.\r\n\r\nThe film follows a down on her luck mother named Callie )Carrie Coon) and her children Trevor (Finn Wolfhard); and Phoebe (Mckenna Grace), as they are forced to move to a dilapidated farm in rural Oklahoma following the passing of Callie’s estranged father and her subsequent eviction.\r\n\r\nA series of unexplained earthquakes clues the smart and precocious Phoebe that something is up and with her new friend Podcast (Logan Kim), and teacher Mr. Grooberson (Paul Rudd); help her uncover her connection to the original Ghostbusters and the abundance and significance of the gear that her Grandfather has left on the farm.\r\n\r\nThings soon take a turn for the worse and despite skeptical locals and the emerging danger, Phoebe, Trevor, and their friends have to battle the forces of evil to save the world.\r\n\r\nThe movie takes its time getting to the action and spends plenty of time establishing the characters, their motivations, and their relationships with one another. There are abundant homages to the original film; some of which are very subtle and clever but never seem gratuitous or tacked on.\r\n\r\nThe film also does not rely on the FX to tell the tale as while there are some solid effects in the film; this is a character-driven tale and the new cast works well with some surprise guests who pop up throughout the film.\r\n\r\nDirector Jason Reitman; son of the Director of the original film; clearly knows and loves the material as he not only helped craft the story but deftly weaves a new tale into the franchise which also fits well with the first film and does not attempt to reboot but rather continue the franchise.\r\n\r\nThere are two extra scenes in the credits that you will not want to miss as not only are they great fun; but also tease of future adventures to come.\r\n\r\nThe film also has a few touching moments that caused some unexpected emotion from the audience at our Press Screening and helped establish “Ghostbusters Afterlife” as not only a winning entry into the series but also one of the most enjoyable films of the year.\r\n\r\n4.5 stars out of 5.","created_at":"2021-11-16T14:48:33.030Z","id":"6193c4c145819900432a32af","updated_at":"2021-11-16T14:48:33.030Z","url":"https://www.themoviedb.org/review/6193c4c145819900432a32af"},{"author":"JPV852","author_details":{"name":"","username":"JPV852","avatar_path":"/xNLOqXXVJf9m7WngUMLIMFsjKgh.jpg","rating":7},"content":"More than a little heavy in the nostalgia department (not complaining as I got to see the OG there at the end), but as these sequels go I liked it enough, especially the young cast that weren't terribly obnoxious. I will admit that I almost got a tear in my eye when... I heard the Ecto-1 siren go. Not kidding. And CGI Egon wasn't bad either. Definitely better than that 2016 mistake. Chalk it up to a nightmare alternate universe. **3.5/5**","created_at":"2022-02-08T04:35:20.291Z","id":"6201f308d55c3d00a0c06c6d","updated_at":"2022-02-08T04:35:20.291Z","url":"https://www.themoviedb.org/review/6201f308d55c3d00a0c06c6d"},{"author":"DallasBob","author_details":{"name":"","username":"DallasBob","avatar_path":"/q0CeevK9dSVKgU8LIns3qttIBq1.jpg","rating":8},"content":"This wasn't bad at'all.  The kids did very well as far as acting went. The special affects were very reminiscent of the past. (It seems as if they went with the same speical effects company or at least the same format--very good decision) And the story seemed to hold water very well. \r\n\r\nPersonal critiques (possible spoilers ahead) :  I wish the kids had busted a few more ghosts.  Made that a montage, while introducing us to what the rest of the OG Ghostbusters were up to in present day, instead the script had Dan Akroyd's Ray character explain it over the phone.  Maybe if it had been done that way the OGs' recognize what's going on and show up to help.  Or maybe have their teacher, Paul Rudd, try and find them.  In short there didn't seem like enough action.  The girl was a bit to egg-head smart-alecky for my taste, but that could just be the oily film of identity politics Hollywood likes to smear all over recognized franchises affecting my view on that notion.  Also kinda expected Slimer to show up. lol I was a big fan of the cartoon as a kid.  \r\n\r\nAll in all they did very good with the film and honoring Harold Ramis in his passing.  Depsite my personal wish list, this was a very good film for all.  I gladly give it 4.5/5.","created_at":"2022-02-16T11:26:05.182Z","id":"620cdf4dd94035006a65b035","updated_at":"2022-02-16T11:28:30.529Z","url":"https://www.themoviedb.org/review/620cdf4dd94035006a65b035"}]
/// total_pages : 1
/// total_results : 3

class Reviews {
  Reviews({
      int? id, 
      int? page, 
      List<Results>? results, 
      int? totalPages, 
      int? totalResults,}){
    _id = id;
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  Reviews.fromJson(dynamic json) {
    _id = json['id'];
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  int? _id;
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  int? get id => _id;
  int? get page => _page;
  List<Results>? get results => _results;
  int? get totalPages => _totalPages;
  int? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}

/// author : "garethmb"
/// author_details : {"name":"","username":"garethmb","avatar_path":"/https://secure.gravatar.com/avatar/3593437cbd05cebe0a4ee753965a8ad1.jpg","rating":null}
/// content : "Back in 1984 when big hair and neon were the norms; a movie appeared that soon became a cultural phenomenon. The movie involved a team of unlikely Paranormal Investigators and the mix of comedy, FX, and Ghosts turned the movie into a smash hit and a Pop Culture mainstay. The abundance of products that followed and the inescapable theme song and tagline soon gave rise to a sequel which while a success; did not resonate the way the original film had and thus the “Ghostbusters” film franchise became dormant.\r\n\r\nWhile a successful video game and merchandise line kept the franchise alive; the 2016 reboot with an all-female team failed to capture the magic at the box office and again put the franchise’s cinematic future in question.\r\n\r\nThankfully after several delays due to the Covid 19 Pandemic; “Ghostbusters Afterlife” has arrived and is the worthy sequel that does justice to the original film and sets the stage well for future cinematic exploits.\r\n\r\nThe film follows a down on her luck mother named Callie )Carrie Coon) and her children Trevor (Finn Wolfhard); and Phoebe (Mckenna Grace), as they are forced to move to a dilapidated farm in rural Oklahoma following the passing of Callie’s estranged father and her subsequent eviction.\r\n\r\nA series of unexplained earthquakes clues the smart and precocious Phoebe that something is up and with her new friend Podcast (Logan Kim), and teacher Mr. Grooberson (Paul Rudd); help her uncover her connection to the original Ghostbusters and the abundance and significance of the gear that her Grandfather has left on the farm.\r\n\r\nThings soon take a turn for the worse and despite skeptical locals and the emerging danger, Phoebe, Trevor, and their friends have to battle the forces of evil to save the world.\r\n\r\nThe movie takes its time getting to the action and spends plenty of time establishing the characters, their motivations, and their relationships with one another. There are abundant homages to the original film; some of which are very subtle and clever but never seem gratuitous or tacked on.\r\n\r\nThe film also does not rely on the FX to tell the tale as while there are some solid effects in the film; this is a character-driven tale and the new cast works well with some surprise guests who pop up throughout the film.\r\n\r\nDirector Jason Reitman; son of the Director of the original film; clearly knows and loves the material as he not only helped craft the story but deftly weaves a new tale into the franchise which also fits well with the first film and does not attempt to reboot but rather continue the franchise.\r\n\r\nThere are two extra scenes in the credits that you will not want to miss as not only are they great fun; but also tease of future adventures to come.\r\n\r\nThe film also has a few touching moments that caused some unexpected emotion from the audience at our Press Screening and helped establish “Ghostbusters Afterlife” as not only a winning entry into the series but also one of the most enjoyable films of the year.\r\n\r\n4.5 stars out of 5."
/// created_at : "2021-11-16T14:48:33.030Z"
/// id : "6193c4c145819900432a32af"
/// updated_at : "2021-11-16T14:48:33.030Z"
/// url : "https://www.themoviedb.org/review/6193c4c145819900432a32af"

class Results {
  Results({
      String? author, 
      AuthorDetails? authorDetails, 
      String? content, 
      String? createdAt, 
      String? id, 
      String? updatedAt, 
      String? url,}){
    _author = author;
    _authorDetails = authorDetails;
    _content = content;
    _createdAt = createdAt;
    _id = id;
    _updatedAt = updatedAt;
    _url = url;
}

  Results.fromJson(dynamic json) {
    _author = json['author'];
    _authorDetails = json['author_details'] != null ? AuthorDetails.fromJson(json['author_details']) : null;
    _content = json['content'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
    _url = json['url'];
  }
  String? _author;
  AuthorDetails? _authorDetails;
  String? _content;
  String? _createdAt;
  String? _id;
  String? _updatedAt;
  String? _url;

  String? get author => _author;
  AuthorDetails? get authorDetails => _authorDetails;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get id => _id;
  String? get updatedAt => _updatedAt;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    if (_authorDetails != null) {
      map['author_details'] = _authorDetails?.toJson();
    }
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    map['url'] = _url;
    return map;
  }

}

/// name : ""
/// username : "garethmb"
/// avatar_path : "/https://secure.gravatar.com/avatar/3593437cbd05cebe0a4ee753965a8ad1.jpg"
/// rating : null

class AuthorDetails {
  AuthorDetails({
      String? name,
      String? username, 
      String? avatarPath, 
      dynamic rating,}){
    _name = name;
    _username = username;
    _avatarPath = avatarPath;
    _rating = rating;
}

  AuthorDetails.fromJson(dynamic json) {
    _name = json['name'].toString()=='null'? 'NoName' :json['name'] ;
    _username = json['username'];
    _avatarPath = json['avatar_path'];
    _rating = json['rating'];
  }
  String? _name;
  String? _username;
  String? _avatarPath;
  dynamic _rating;

  String? get name => _name;
  String? get username => _username;
  String? get avatarPath => _avatarPath;
  dynamic get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['username'] = _username;
    map['avatar_path'] = _avatarPath;
    map['rating'] = _rating;
    return map;
  }

}