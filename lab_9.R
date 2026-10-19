#poziom istotnosci-testy
#poziom ufnosci-estymacja
#literka dla sredniej m
# Zad1
# Prawdziwą nieznaną średnią w populacji generalnej oznaczamy literą m
# Test dla średniej
# H0: m = 179  (zawsze równość !!!!)
#H1: m>179
t.test(Ankieta.M$Wzrost,mu=179,alternative =("greater"))
# Wniosek: alfa = 0.05 >= p, więc odrzucamy hipotezę H0 na korzyść hipotezy alternatywnej,
# tzn. na poziomie istotności 0.05 prawdziwa średnia wzrostu mężczyzn w pop.gen 
# jest istotnie większa od 179 cm
#zad2
# Test zgodności Shapiro-Wilka
# H0: rozkład wagi mężczyżn w pop.gen jest normalny
# H1: ~H0
shapiro.test(Ankieta.M$Waga)
#alfa=0.01
#p>alfa czyli bierzemy pod uwage H0
# tzn. na poziomie istotności 0.01 różnice między rozkładem normalnym 
# a rozkładem empirycznym nie są statystycznie istotne więc
# można szacować przedziały dla średniej i odchylenia standardowego 
# dla wagi mężczyżn w pop.gen
#b
t.test(Ankieta.M$Waga,conf.level = 0.96)
# Przedział liczbowy (71.93185, 77.93482) z prawdopodobieństwem 0.96
# obejmuje prawdziwą nieznaną średnią wagi mężczyzn w pop.gen
#c
przedzial.odchylenie = function(zmienna, ufnosc){
  n = length(zmienna)
  alfa = 1 - ufnosc
  kwantyl.l = qchisq(1-alfa/2,n-1)
  kwantyl.p = qchisq(alfa/2,n-1)
  licznik = (n-1) * var(zmienna)
  data.frame(
    ocena.dolna = sqrt(licznik / kwantyl.l),
    ocena.gorna = sqrt(licznik / kwantyl.p)
  )
}
przedzial.odchylenie(Ankieta.M$Waga,0.99)
#d
#h0 mu=77
#h1 ~H0
t.test(Ankieta.M$Waga,mu=77)
# Statystyka testowa: t = -1.4417
# p-value = 0.154
# Wniosek: alfa = 0.05 < p, więc nie ma podstaw do odrzucenia hipotezy H0,
# tzn. na poziomie istotności 0.05 prawdziwa średnia wagi mężczyzn w pop.gen
# nie różni się istotnie od 77 kg
#zad4

Przed=c(158,160,155,170,166,173,167,180,168,173)
Po = c(140, 155, 150, 167, 170, 162, 157, 163, 158, 175)
# Będziemy badać wektor różnic między próbkami zależnymi
#testshapiro
shapiro.test(Przed-Po)
# Wniosek: rozkład różnic ciśnienia nie różni się istotnie od rozkładu normalnego
# Test dla dwóch średnich w próbach zależnych
# H0: m.Przed-m.Po = 0
#H1 m.Przed-m.Po>0
t.test(Przed-Po,alternative = ("greater"))
t.test(Przed,Po,alternative="greater",paired=T)  # alternatywa
# Wniosek: alfa = 0.05 >= p, więc odrzucamy hipotezę H0 na korzyść hipotezy alternatywnej, 
# tzn. na poziomie istotności 0.05 w pop.gen średnia ciśnienia tętniczego przed podaniem 
# leku jest istotnie większa niż po podaniu leku (leczenie jest skuteczne)
#zad4
Przedszkoleniem=c(46,34,40,42,41,48,49,33)
Poszkoleniu=c(40,41,42,55,51,42,33,44)
shapiro.test(Przedszkoleniem-Poszkoleniu)
#p>alfa rozklad roznic nie rozni sie istnotnie od rozkladu normalnego
t.test(Przedszkoleniem-Poszkoleniu,alternative=("l"))
#w alfa=0.01<p szkolenie nie bylo efektywne
# tzn. na poziomie istotności 0.01 w pop.gen średnia efektywności po rozpoczęciu 
# szkolenia nie jest istotnie większa niż przed szkoleniem (szkolenie nie jest skuteczne)
#zad 5
#a
table(Ankieta$M.zamieszkania)
prop.test(14,77,conf.level = 0.96)
# Przedział liczbowy (0.1039076, 0.2950524) z prawdopodobieństwem 0.96
# obejmuje w pop.gen prawdziwy nieznany odsetek studentów mieszkających na stancji
#b
# H0: p = 0.4
# H1: ~H0
prop.test(20,77,p=0.4)
# Statystyka testowa: chi^2 = 5.7408
# p-value = 0.01658
#alfa=0.05>p
# Wniosek: alfa = 0.05 >= p, więc odrzucamy hipotezę H0 na korzyść hipotezy alternatywnej, 
# tzn. na poziomie istotności 0.05 w pop.gen odsetek studentów mieszkających 
# w akademiku różni się istotnie od 0.4
#zad 6
#a
table(Ankieta$Sz.średnia)
prop.test(16,77,conf.level=0.97)
# Przedział liczbowy (0.1207250 0.3306275) z prawdopodobieństwem 0.97
# obejmuje w pop.gen prawdziwy nieznany odsetek studentów ktorzy sa absolwentami Liceum
#b
#h0: p=0.78
#h1: p=>0.78
prop.test(51,77,p=0.78,alternative=("l"))
#alfa=0.01<p 
