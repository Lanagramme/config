/* Module de lecture et d'écriture de fichiers symplifié
 * V1 :: 1 Jan 2023
 *
 * Note:
 * L'usage de ce module suppose que les fichiers à modifiés soient situés dans
 * dossier data/ à la racine du projet, ou dans le même répertoire que le 
 * script important le module
 *
 * Version 2 ::
 * Ajouter un système de logs en cas d'erreurs
 * */
const fs = require("fs")

async function writeData(data, file) {
	return new Promise((resolve, reject) => {
		fs.writeFile("./data/"+file, JSON.stringify(data), err => {
			if (err) {
				resolve( { 
					success: false, 
					message: "Can't write, check log", 
					log:err 
				})
			}
			resolve( { success: true })
		})
	})
}

async function fileExist(file) {
	return new Promise((resolve, reject) => {
		fs.access("./data/"+file, fs.F_OK, (err) => {
			if (err) {
				console.log(err)
				resolve( false )
			}
			console.log("file found")
			resolve( true )
		})
	})
}

module.exports = {
 fileExist, writeData
}
