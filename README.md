=======================================
Zadanie 1
=======================================
1. Plik zawiera współrzędne ludzkiego genomu w transkrypcji RefSeq. Kolejne kolumny oznaczają
chrom	strand	txStart	txEnd	cdsStart	cdsEnd	exonCount	exonStarts	exonEnds	proteinID	alignID
	
4. - Spójrz na plik 
wc genom.txt 
	-Ile jest pól? 
756891
	-Ile to jestlinii?
47306
	
5 - W jaki sposób są rozdzielone pola?
tabulatorami 

6 - Ile transkryptów (NM_ *) jest reprezentowanych w pliku? 
grep -n "NM_"[0-9]* genom.txt | wc
36063

7 -Ile genów jest reprezentowanych w pliku? 
cut -f13 genom.txt | wc

8 - Czy jakiekolwiek transkrypty są reprezentowane więcej niż jeden raz?   
    Jeśli tak, które [Umieść listę w pliku "mult_transcripts.txt"]?
cut -f 2 genom.txt | sort | uniq | sed '1d' |wc
cut -f 2 genom.txt | sort | uniq -d  > mult_transcripts.txt

46257 (-1 bo 1 to nazwa)

9  -Ile chromosomów jest reprezentowanych? 
cut -f2 genom.txt | wc

47306


10 - Jakie geny znajdują się na chromosomie Y? Umieść je w pliku "chrY_genes.txt"
grep -n "chrY" genom.txt | cut -f 13 >chrY_genes.txt

11 -Utwórz osobne pliki dla genów "+" i "-", o nazwach "genom_plus.txt" i "genom_neg.txt"
grep -w "+" genom.txt > genom_plus.txt
grep -w "-" genom.txt > "genom_neg.txt"

12- Posortuj wszystkie dane w genom_plus.txt, najpierw przez chromosom (rosnąco), a następnie przez pierwszą współrzędną (malejąco).
sort -k 3 genom_plus.txt
sort -rk 5 genom_plus.txt




13- Podziel równomiernie wszystkie dane na 4 pliki o nazwach "Part_1.txt", "Part_2.txt" itd. Użyj komendy split.
split genom.txt -l 11826 i zmieniam nazwy plikow

14- Jakie 5 genów pojawia się na "prawym końcu" (np. Mają najwyższe współrzędne) chr 19?


15- W oparciu o pole z genami, jaki jest najdłuższy chromosom? Jaka jest jego długość?


16- Jakie geny zawierają litery "BMP"? Umieść je w pliku "BMPs_etc.txt"
	cut -f 13 genom.txt |  grep -n "BMP" > BMPs_etc.txt

17- Które z tych "genów BMP" mają więcej niż jeden transkrypt?


18- Jaki gen ma najdłuższą długość genomu (odległość między początkiem i końcem transkrypcji)? Najkrótszy?
	


19- Zmień format pliku, tak aby zawierał dwa pola:  RefSeq<tab>chr:start-end
	ex: NM_001039886	chr19:57722720-57751115
