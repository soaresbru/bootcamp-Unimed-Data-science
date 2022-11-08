select state, sum(population)
from "populationdb"."population"
group by state
having avg(population) > 100000
order by 2 desc;