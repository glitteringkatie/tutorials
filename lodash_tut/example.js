var _ = require('lodash');
var data = [
  {
    name: "Jamestown",
    population: 2047,
    temperatures: [-34, 67, 101, 87]
  },
  {
    name: "Awesome Town",
    population: 3568,
    temperatures: [-3, 4, 9, 12]
  },
  {
    name: "Funky Town",
    population: 1000000,
    temperatures: [75, 75, 75, 75, 75]
  }
];

function totalArray(arr){
  return _.reduce(arr, _.add);
}

var pairs = _.map(data, function(datum) {
  return [datum.population, _.mean(datum.temperatures)];
});


console.log(pairs);
