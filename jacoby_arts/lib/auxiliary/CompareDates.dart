

compareDate(String revealDate){
  var date = DateTime.parse(revealDate);
  var dateNow = new DateTime.now();
  var sol = date.isBefore(dateNow);
  return sol;
}