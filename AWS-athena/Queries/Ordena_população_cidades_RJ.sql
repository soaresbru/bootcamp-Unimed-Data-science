select city, sum(population)
from "populationdb"."population"
where state='Rio de Janeiro'
group by city
order by 2;