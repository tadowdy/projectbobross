// Author       : Thomas M Clifford
// Date Created : 10/31/2018
// Last Modified: 10/31/2018
// About        : A class used to represent an artist for JAC

class Artist {

  int _artistId;

  String _name;

  String _description;

  /*CONSTRUCTORS***************************************************************/
  Artist() {
    _artistId = 0;

    _name = "";

    _description = "";
  }

  /*SETTERS********************************************************************/
  void setArtistId(int artistId) {
    _artistId = (artistId >= 0) ? artistId : 0;
  }

  void setName(String name) {
    _name = (name == null) ? "" : name;
  }

  void setDescription(String description) {
    _description = (description == null) ? "" : description;
  }

  /*GETTERS********************************************************************/
  int getArtistId() {
    return _artistId;
  }

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }

/*UTILITY********************************************************************/

}
