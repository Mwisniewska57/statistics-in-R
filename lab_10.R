# Zad1
# Poprawne porównanie średnich w dwóch populacjach wymaga sprawdzenia założeń:
# zgodności z rozkładem normalnym w obu populacjach oraz jednorodności wariancji
# (założenia obejmują trzy testy istotności)
by(Ankieta$Waga,Ankieta$Płeć,shapiro.test)
#h0 jest normalna
#h1 zaprzeczenie h1
#dla kobiet alfa=0.01 p>alfa
#nie ma podstaw do odrzucenia hipotezy h0
## tzn. na poziomie istotności 0.01 prawdziwa średnia wagi kobiet
#jest normalna
# Mężczyźni - patrz Lab_9 Zad2a
# b)
# Prawdziwe odchylenie standardowe w pop.gen oznaczamy σ
# Test Fishera jednorodności wariancji
# H0: σ^2.K = σ^2.M
# H1: ~H0
var.test(Ankieta$Waga~Ankieta$Płeć)
#alfa=0.05<0.7273
# Wniosek: alfa = 0.05 < p, więc więc nie ma podstaw do odrzucenia hipotezy H0, 
# tzn. na poziomie istotności 0.05 w pop.gen wariancje wag dla obu płci 
# nie różnią się istotnie (wariancje są jednorodne)
#c
# H0: m.K = m.M
# H1: m.K < m.M
t.test(Ankieta$Waga~Ankieta$Płeć,alternative='l',var.equal = TRUE)
# Statystyka testowa: t = -3.4559
# p-value = 0.0004532
# Wniosek: alfa = 0.05 >= p, więc odrzucamy hipotezę H0 na korzyść hipotezy alternatywnej, 
# tzn. na poziomie istotności 0.05 w pop.gen średnia wagi w grupie kobiet 
# jest istotnie mniejsza niż średnia wagi w grupie mężczyzn
#zad2
#h0-rozklad sredniej ocen kobiet w pop gen jest nromalny
#h1-zalezy
# 1) Testy zgodności Shapiro-Wilka
by(Ankieta$Średnia,Ankieta$Płeć,shapiro.test)
#alfa=0.05<0.07=p nie ma podstaw do odrzucenia hipotezy H0
#tzn na poziomie istotosci 0.05 srednia kobiet jest normalna
# tzn. na poziomie istotności 0.05 różnice między rozkładem normalnym 
# a rozkładem empirycznym nie są statystycznie istotne
#W=0.83781
var.test(Ankieta$Średnia~Ankieta$Płeć)
#H0: 
#0.05<0.5377 
# H0: σ^2.K = σ^2.M
# H1: ~H0
#wniosek: na poziomie istotnosci 0.05 w pop gen wariancje srednich ocen dla obu plci
#sa jednorodne
t.test(Ankieta$Średnia~Ankieta$Płeć,var.equal = TRUE) #twosided
#Statystyka testowa: t=1.2318
#alfa<p 0.05<0.2219 wiec nie ma podstaw do odrzucenia hipotezy H0,
# jest nie istotnie różna niż średnia oceny w grupie mężczyzn
#wniosek koncowy: srednia ocen nie zalezy od plci
#13 czerwca kolokwium
#zadanie3
#H0: rozklad sredniej ocen dla uzytkowanikow windowska normalny
#H1: ~H0
by(Ankieta$Średnia,Ankieta$system,shapiro.test)
#alfa=0.03<0.7357=p nie ma podstaw do odrzucenia hipotezy H0
#na poziomie istotnosci 0.03 rozklad sredniej ocen jest normalny dla uzytkownikow innych systemow
#0.03<0.226nie ma podstaw do odrzucenia hipotezy H0
#na poziomie istotnosci 0.03 rozklad sredniej ocen jest normalny dla uzytkownikow windowsa

var.test(Ankieta$Średnia~Ankieta$system)
#F=1.2556 ,na poziomie istotnosci 0.03 w pop gen wariancje srednich ocen dla uzytkownikow roznych systemow
#sa jednorodne
t.test(Ankieta$Średnia~Ankieta$system,var.equal = TRUE) #twosided
#alfa<p nie ma podstaw do odrzucenia hipotezy H0,
# tzn. na poziomie istotności 0.03 w pop.gen średnia ocen w obu grupach nie są istotnie różne
#zad4
table(Ankieta$M.zamieszkania,Ankieta$Sz.średnia)
# H0: p.Mzr = p.Poz
#H1: p.Mzr>p.Poz
prop.test(x=c(32,12+7),n=c(6+5+32,4+4+12+0+7+7),alternative='g')
#alfa>p odrzucamy h0 na korzysc alternatywnej
# Statystyka testowa: chi^2 = 2.1471
# p-value = 0.07142
# Wniosek: alfa = 0.1 >= p, więc odrzucamy hipotezę H0 na korzyść hipotezy alternatywnej,
# tzn. na poziomie istotności 0.1 w pop.gen odsetek absolwentów technikum informatycznego 
# w grupie mieszkających z rodziną jest istotnie większy od odsetka absolwentów
# technikum informatycznego w grupie mieszkających w akademiku lub na stancji
table(Ankieta$Płeć,Ankieta$M.zamieszkania)
prop.test(x=c(3,17),n=c(3+3+2,17+40+12),alternative='g')
#H0: p.K=p.M
#H1: p.K>p.M
#wniosek alfa=0.02<p=0.3596 wiec nie ma podstawy do odrzucenia hipotezy H0
#tzn. na poziomie istotnosci 0.02 w pop.gen odsetek osob mieszkajacych w akademiku nie jest istotnie 
#wiekszy w grupie kobiet
# Statystyka testowa: chi^2 = 0.12924

#zad3
# 1) Testy zgodności Shapiro-Wilka
by(Ankieta$Średnia, Ankieta$system, shapiro.test)
# --- WINDOWS
# H0: Rozkład średniej ocen dla użytkowników Windowsa normalny
# H1: ~H0
# Statystyka Testowa: W = 0.97648
# p-value = 0.226
# Wniosek: alfa = 0.03 < p, więc nie ma podstaw do odrzucenia H0, 
# tzn. na poziomie istotności 0.03 różnice między rozkładem normalnym 
# a rozkładem empirycznym nie są statystycznie istotne
# --- INNY
# H0: Rozkład średniej ocen dla użytkowników Innych systemów normalny
# H1: ~H0
# Statystyka Testowa: W = 0.95417
# p-value = 0.7357
# Wniosek: alfa = 0.03 < p, więc nie ma podstaw do odrzucenia H0, 
# tzn. na poziomie istotności 0.03 różnice między rozkładem normalnym 
# a rozkładem empirycznym nie są statystycznie istotne

# 2) Test Fishera jednorodności wariancji
# H0: σ^2.I = σ^2.W
# H1: ~H0
var.test(data = Ankieta, Ankieta$Średnia~Ankieta$system)
# Statystyka Testowa: F = 1.2556
# p-value = 0.5633
# Wniosek: alfa = 0.03 < p, więc nie ma podstaw do odrzucenia hipotezy H0, 
# tzn. na poziomie istotności 0.03 w pop.gen wariancje średniej ocen dla obu grup 
# nie różnią się istotnie (wariancje są jednorodne)

# 3) Test dla dwóch średnich, bez poprawki Welcha
# H0: m.I = m.W
# H1: m.I > m.W
t.test(Ankieta$Średnia~Ankieta$system,alternative="g",var.equal=TRUE)
# Statystyka Testowa: t = 0.44773
# p-value = 0.3278
# Wniosek: alfa = 0.03 < p, więc nie odrzucamy hipotezy H0 na korzyść hipotezy alternatywnej, 
# tzn. na poziomie istotności 0.03 w pop.gen średnia ocen w obu grupach nie są istotnie różne