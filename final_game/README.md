# Informace #

V této kapitole se nachází godot soubory, které obsahují jak scény tak i samotné skripty napsané v GD skriptu.

## Verze ##

Tato hra se stále nachází ve vývoji, ale už můžeme mluvit o první verzi, jelikož hra obsahuje základní prvky pro pohyb, gravitaci a další mechaniky. 

## Chování postavy ##

Postava je naprogrmována tak aby se pohybovala jen po plošinách. Jakmile se postava ocitne mimo plošinu tak díky gravitaci spadne mimo mapu a hra se automaticky vypne. 
Dále pokud postava není na plošině, tak nemůže znova vyskočit.
Hudba je nastavena tak aby se po spuštění hry spustila a nevypínala se (byla v loopu). 
Postava je mimo jiné naprogramována tak aby se při kliknutí na tlačítka pohybu změnili jednotlivé sprity. 
Což znamená, že pokud hráč zmáčkne "a" tak se sprite změní na pohled vlevo a naopak pokud stiskne "d" tak se sprite obrátí vpravo.
Jakmile je hráč chvilku neaktivní tak se postava sama otočí na střed viz. obrázek

![Snímek obrazovky 2023-03-26 142925](https://user-images.githubusercontent.com/92738343/227777475-91c09bfb-cc49-4580-a1c4-12e578575a50.png)
