SELECT from_loc,SUM(price)AS total FROM flight
GROUP BY from_loc
