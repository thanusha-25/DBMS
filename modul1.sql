1. select film_text.title
 from film_text 
        inner join film_category on  film_text.film_id=film_category.film_id 
	    inner join category on category.category_id=film_category.category_id 
	     inner join film on film.film_id=film_text.film_id 
	where film_category.category_id=(select category_id from category where name="Comedy")
    and film.rating=”PG-13”;



2.select title 
from film 
    inner join film_category on film_category.film_id=film.film_id 
	inner join  category on category.category_id=film_category.category_id 
where film_category.category_id=(select category_id from category where name="horror") 
order by rental_rate desc limit 0,3;

 
3.select first_name,last_name 
 from customer  
 inner join rental on customer.customer_id=rental.customer_id   
 inner join inventory on rental.inventory_id=inventory.inventory_id  
 inner join film on inventory.film_id=film.film_id   
 inner join film_category on film.film_id=film_category.film_id  
 inner join category on category.category_id=film_category.category_id   
 inner join customer_list on customer.customer_id=customer_list.ID   
 where film_category.category_id=(select category_id from category where name="Sports") 
     and customer_list.country="India";



4 .select first_name,last_name 
  from customer   
    inner join rental on customer.customer_id=rental.customer_id   
    inner join customer_list on customer_list.ID=customer.customer_id 
    inner join inventory on rental.inventory_id=inventory.inventory_id 
    inner join film_list on inventory.film_id=film_list.FID 
    inner join film_actor on film_list.FID=film_actor.film_id 
where film_actor.actor_id =(select actor_id from actor where first_name="NICK" and last_name="WAHLBERG") 
      and customer_list.country="Canada";


 5.select count(*)
 from film_actor 
  where actor_id=(select actor_id from actor where first_name="SEAN" and  last_name = "WILLIAMS");




