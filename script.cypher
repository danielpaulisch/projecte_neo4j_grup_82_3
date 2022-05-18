match (n) detach delete n;

LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTfU6oJBZhmhzzkV_0-avABPzHTdXy8851ySDbn2gq32WwaNmYxfiBtCGJGOZsMgCWjzlEGX4Zh1wqe/pub?output=csv' as row
Merge (p:Persona {ID: toInteger(row.Id), Nom: row.name, Cognom: row.surname, Segon_Cognom: row.second_surname, Any: toInteger(row.Year)})
return NULL;


