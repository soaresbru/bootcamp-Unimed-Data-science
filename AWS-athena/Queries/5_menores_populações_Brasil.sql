select city, sum(population)
from "populationdb"."population"
group by city
order by 2
limit 5;
