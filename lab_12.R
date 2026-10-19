#zad1
#a
cor(Ankieta$L.godz,Ankieta$wiek)
# Liczba godzin spędzanych przed komputerem w ciągu doby jest bardzo słabo 
# skorelowana z wiekiem samodzielnego zetknięcia z komputerem
# b)
# Estymacja współczynnika korelacji
cor.test(Ankieta$L.godz,Ankieta$wiek,conf.level=0.98)
# Przedział liczbowy (-0.1865491, 0.3382414) z prawdopodobieństwem 0.98
# obejmuje w pop.gen prawdziwy nieznany współczynnik korelacji między 
# liczbą godzin spędzanych przed komputerem w ciągu doby
# a wiekiem samodzielnego zetknięcia z komputerem
# c)
# Prawdziwy współczynnik korelacji liniowej Pearsona w pop.gen oznaczamy ρ
# Test dla współczynnika korelacji
# H0: ρ = 0
# H1: ρ > 0
cor.test(Ankieta$L.godz,Ankieta$wiek,alternative = 'g')
# Statystyka testowa: t  = 0.7081
# p-value = 0.2405
# Wniosek: alfa = 0.05 < p, więc nie ma podstaw do odrzucenia hipotezy H0, 
# tzn. na poziomie istotności 0.05 w pop.gen współczynnik korelacji między 
# liczbą godzin spędzanych przed komputerem w ciągu doby a wiekiem samodzielnego
# zetknięcia z komputerem nie jest istotnie większy od zera
#zad2
Reakcja=c(0.3,0.4,0.5,0.7,1.2,1.5)
Bez.snu=c(19,21,23,25,27,29)
#a
cor(Bez.snu,Reakcja)
# r = 0.9571324
cor.test(Bez.snu,Reakcja,conf.level = 0.97)
#przedział liczbowy (0.5768022 0.9964313) z p=0.97 obejmuje w pop.gen peawdziwy
#nieznany wspolczynnik korelacji miedzy liczbgodz bez snu a czasem reakcji
#c
ggplot (data.frame (x = Bez.snu, y = Reakcja),
        aes (x = Bez.snu, y = Reakcja)) + geom_point (size = 3, col = 'red')
#d linear model model liniowy
lm(Reakcja ~Bez.snu)
# y = 0.1229x - 2.1819  intercept=b y=ax+b
# Jeśli wydłużymy czas aktywności bez snu o jedną godzinę, 
# to czas rekacji wydłuży się o 0.1229 sekundy
#ważne zeby uzywac jednostek
#e
ggplot (data.frame (x = Bez.snu, y = Reakcja),
        aes (x = Bez.snu, y = Reakcja)) + geom_point (size = 3, col = 'red') + geom_smooth (method = 'lm', formula = y~x)
# f)
# Prawdziwy współczynnik regresji w pop.gen oznaczamy β1  (y = β1x + β0)
# Test istotności dla współczynnika regresji
# H0: β1 = 0
# H1: ~H0
#istotny=istotnie rozny od 0
summary(lm(Reakcja ~Bez.snu))
#t value - stat testowa Pr(>t)-p value
# Statystyka testowa: t  = 6.609
# p-value = 0.00272  2 wiersz!
# Wniosek: alfa = 0.03 >= p, więc odrzucamy hipotezę H0 na korzyść hipotezy alternatywnej, 
# tzn. na poziomie istotności 0.03 w pop.gen współczynnik regresji czasu reakcji 
# względem czasu aktywności bez snu różni się istotnie od zera (jest istotny)
#ZAD3
table(Ankieta$M.zamieszkania,Ankieta$Płeć)
# Test niezależności chi^2
# H0: miejsce zamieszkania studentów w pop.gen nie zależy od płci
# H1: ~H0
chisq.test(Ankieta$M.zamieszkania,Ankieta$Płeć)
# Statystyka testowa: chi^2  = 1.2228
# p-value = 0.5426
# Wniosek: alfa = 0.05 < p, więc nie ma podstaw do odrzucenia hipotezy H0, 
# tzn. na poziomie istotności 0.05 miejsce zamieszkania studentów w pop.gen
# nie zależy od płci
# Nie ma zależności, więc nie badamy jej siły
#ZAD4
tablica = matrix(data = c(45,35,30,25,25,40),ncol = 2, nrow = 3)
# H0: Zadowolenie z pracy w pop.gen nie zależy od kierunku zakończonych studiów
# H1: ~H0
chisq.test(tablica)
# chi^2 = 6.8783
# p-value = 0.03209
# Wniosek: alfa = 0.05 > p, więc odrzucamy hipotezę H0 na korzyść alternatywnej H1, 
# tzn. na poziomie istotności 0.05 zadowolenie z pracy w pop.gen zależy od kierunku zakończonych studiów
V=sqrt(6.8783/200*(2-1))
V
# Zależność jest dość słaba

