@---
tags:spell
element:Red
archetype:Boutefeu
---@

# Braise

**Type**:
Effet de zone

**Range**:

**Description**:
Déploie une zone-aura de feu de 3m de rayon à partir de la cible. 
Si la zone chevauche une zone d'élément eau, les cases consernées deviennent neutre et recoivent leffet brouillard.
Si la zone chevauche une zone d'élément bois, 
    * toutes les entités présentent dans la zone bois recoivent des dégats égal au rayon des deux zones aditionnées 
    * toutes les entités présentent dans la zone bois recoivent l'état brulé et deux token feu.
    * la zone de bois est convertie en zone feu.
Si la zone chevauche une zone d'élément air, 
    * toutes les entités présentent dans une des deux zones recoivent des dégats égal au rayon des deux zones aditionnées 
    * toutes les entités présentent dans la zone bois recoivent l'état brulé et deux token feu.
    * la zone air est détruite.
onTurn: 
 * Toutes les entités à l'intérieur de la zone recoivent un token de feu.
 * Le rayon de la zone est réduite de 1m

**Cost**:

**Effect**:
