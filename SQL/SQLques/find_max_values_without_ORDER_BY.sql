-- us movie ka namm do jiska budget sab sa jada ho
SELECT name, budget FROM movies WHERE budget = (SELECT MAX(budgeet) from movies)