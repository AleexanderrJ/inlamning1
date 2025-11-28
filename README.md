## En liten bokhandel (inlämning1) utfört av Alexander Johansson från YH25

Jag har skapat en databas till en liten bokhandel (e-handel). Kunder måste ha konton för att lägga beställningar på olika böcker.
Databasen/ER-diagrammets relationer gör det möjligt för en kund att lägga en eller flera beställningar, samt att en bok kan finnas i flera/olika beställningar.

## Tabeller
* Kunder 
* Beställningar
* Böcker
* Orderrader

Insåg att jag hade auto_increment på ISBN i Bocker-tabellen så jag ändrade det till BIGINT. Varje bok har sitt egna ISBN därför blir det inte korrekt med auto_increment.

## ER-diagram
Så här ser mitt ER-diagram ut till uppgiften:

![ER-diagram](images/er-diagram.png)


