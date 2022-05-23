//Consulta 1
match (p:Persona)-[:VIU]->(h:Habitatge) where p.Nom <> 'nan' and h.Any=1866 and h.Municipi = 'CR'
return collect(distinct p.Nom), count(*)

//Consulta 2
match (h:Habitatge)
where h.Municipi='SFLL' and h.Any < 1840
return h.Any as Any, collect(h.ID) as Identificadors
ORDER BY h.Any

//Consulta 3
//llista
match (p:Persona)-[:VIU]-(h:Habitatge)-[v:VIU]-(p2:Persona)
where toLower(p.Nom)='rafel' and toLower(p.Cognom)='marti' and h.Any=1838
return p.Nom, collect(p2.Nom)
//graf
match (p:Persona)-[:VIU]-(h:Habitatge)-[v:VIU]-(p2:Persona)
where toLower(p.Nom)='rafel' and toLower(p.Cognom)='marti' and h.Any=1838
return p, collect(p2)

//Consulta 4
match (p:Persona)<-[:SAME_AS]->(n) where toLower(p.Nom)='miguel' and toLower(p.Cognom)='ballester'
return n

//Consulta 9
match(h1:Habitatge) where h1.Any = 1881 and h1.Municipi = 'SFLL' with count(distinct(h1)) as num
match(h:Habitatge)<-[:VIU]-(p:Persona)-[r:FAMILIA]->(n)
where h.Any = 1881 and h.Municipi = 'SFLL' and (toLower(r.Relacio)='hijo' or toLower(r.Relacio)='hija' or toLower(r.Relacio_Harmonitzada) = 'fill' or toLower(r.Relacio_Harmonitzada) = 'filla')
return num as habitatges, count(distinct(p)) as fills, toFloat(count(distinct(p)))/toFloat(num) as mitjana

//Consulta 10
match (h:Habitatge)-[:VIU]-(p:Persona)
where h.Municipi='SFLL'
with h.Any as Any, h.Carrer as Carrer, count(*) as num_hab
Order by Any, num_hab
return Any, collect(Carrer)[0], collect(num_hab)[0]
