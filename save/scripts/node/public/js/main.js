grid_generator(6,6)
console.log("test")

const depart = randomCoord(6)
const arrive = randomCoord(6)

const cd = grid[`x0y${depart.y}`]
const ca = grid[`x5y${arrive.y}`]

cd.name = "D"
ca.name = "A"

$(`#${cd.coord}`)[0].className = 'depart active'
$(`#${ca.coord}`)[0].className = 'arrive'

console.log(distance(cd, ca))
