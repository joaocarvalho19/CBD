populatePhones = function (country, start, stop) {

  var prefixes = [21, 22, 231, 232, 233, 234 ];
  for (var i = start; i <= stop; i++) {

    var prefix = prefixes[(Math.random() * 6) << 0]
    var countryNumber = (prefix * Math.pow(10, 9 - prefix.toString().length)) + i;
    var num = (country * 1e9) + countryNumber;
    var fullNumber = "+" + country + "-" + countryNumber;

    db.phones.insert({
      _id: num,
      components: {
        country: country,
        prefix: prefix,
        number: i
      },
      display: fullNumber
    });
    print("Inserted number " + fullNumber);
  }
  print("Done!");
}

countPref = function(){

	res = db.phones.aggregate( { $group : { _id : {$substr: [ "$display", 5, 3 ]}, count : {$sum : 1} } } ).toArray(function(err, person) {
		print(JSON.stringify(person, null, 2));
	});
	for (let index = 0; index < res.length; index++) {
		if(res[index]._id[2] == 0){
			pre = res[index]._id[0].toString()+res[index]._id[1].toString()
			print(res[index].count + " numeros com prefixo " + pre)
		}
		else{
			print(res[index].count + " numeros com prefixo " + res[index]._id)
		}
	}
  }

  count = function(){

  	r = db.phones.aggregate([{$match: {prefix: {$gt: 80}}},{$count: "prefix"}])

  }
	


