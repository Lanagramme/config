 /*
Ajouter la case dépat à la liste des cases possibles
	Ajouter toutes les cases entourant les cases possibles
	Donner à chaque case ajoutée une valeur égale au nombre d'itération de puis l'ajout de la case départ
	repeter tant que la case arrivée ne fais pas partie des case possibles
supprimer toutes les cases dont la valeur est égale à la valeur de la case arrivée exepté la case arrivée
	supprimer toutes les cases dont la valeur est égale à la valeur de la case arrivée - le nombre d'itération de l'action de suppression qui ne sont pas voisine d'une case dont la valuer est égale à la valeur de la ase arrivée - le nombre d'itération de l'action de suppression + 1
	répéter tant que possible
partir du point de départ
	déplacer la case de départ vers une case ayant une valeur supérieur à la case de départ
	rendre la valeur de la case de départ égale à celle de la case ou elle se trouve
	répéter jusqu'a ce que la valeur de la case de départ soit égale à la valeur de la case arrivée
*/
function arraysEqual(a1,a2) {
    return JSON.stringify(a1)==JSON.stringify(a2);
}

const find_paths = () => {
	const possibles = []
	const trouve = []
	let iteration = 0

	possibles.push([cd.coord,iteration])

	do {
		iteration = iteration+1

		for(x of possibles) {
			if (x[1] != iteration-1 ) continue
			coord_possible = x[0]
			coord_around = grid[coord_possible].around()

			for(case_around of coord_around){
				coord = case_around.coord
				newset = [coord, iteration-1]
				if (!trouve.includes(coord) && grid.hasOwnProperty(coord)) {
					possibles.push([grid[case_around.coord].coord,iteration])
					trouve.push(coord)
				}
			}
		}
	} while (!trouve.includes(ca.coord))
	console.log(trouve)

	mark_path(trouve)
	return possibles
}

const mark_path = (trouve) => {
	$(".possible").removeClass('possible')
	for (i of trouve) { $("#"+i).addClass('possible') }

}

const trim_data = ( data ) => {
	//find max
	max = data[data.length-1][1]

	//trim 
	data = data.filter(x => x[0] == ca.coord || x[1] !=max)
	max = max--

	trouve = data.map(x => {return x[0]})
	mark_path(trouve)



	//set = data.filter(x => x[1] == max )
	//for (item of set) {
	//	in_the_path = false
	//	for (Case in grid[item[0]].around()){
	//		//fais partie du data
	//		found = data.filter(x => x[0] == Case.coord.length)
	//		if (!found) continue
	//		//a une valeur de max+1 dans le se
	//		if (found[1] == max+1) in_the_path = true
	//		break
	//	}
	//	return true

	//}

	//repeat

}

const distance = (case1, case2) => {
	const sq= (number) => number ** 2
	return Math.sqrt(sq(case1.x - case2.x) + sq(case1.y - case2.y))
}

/*
trouver coordonnées min

récuprer les distances des cases possibles
si n et s existent comparer n et s
sinon si e et w existent comparer e et w
sinon comparér les 2 sorties existantes
retournet les coordonnées de touets les cases dont la distance est égale à min

 */
