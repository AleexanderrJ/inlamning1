## En liten bokhandel (inlämning1) utfört av Alexander Johansson från YH25

Jag har skapat en relationsdatabas till en liten bokhandel (e-handel). Här måste man vara kund för att lägga beställningar på olika böcker.

Relationerna gör det möjligt för
* En kund att ha en eller flera beställningar (1–M)
* En bok kan förekomma i många beställningar (1–M)
* En beställning kan ha flera orderrader (1–M), d.v.s flera böcker i samma beställning.
* Många till Många (N:M) relation mellan böcker och beställningar


## Tabeller
* Kunder - Innehåller information om varje kund (alla kunder är unika)
* Beställningar - Innehåller kundernas beställningar
* Böcker - Innehåller butikens produkter i form av böcker 
* Orderrader - Varje orderrad är unik och är kopplad till en specifik beställning samt specifik bok (ISBN)


## Vad har jag stött på under skapandet av databas-strukturen?
Jag insåg att jag hade AUTO_INCREMENT på ISBN i Bocker-tabellen, så jag ändrade det till BIGINT. Varje bok har sitt unika ISBN och därför blir det inte korrekt att auto-generera värdet.


## ER-diagram
Så här ser mitt ER-diagram ut till uppgiften:

![ER-diagram](images/er-diagram.png)


