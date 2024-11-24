const prisma = require('../models/prismaClient')

// Get all users
exports.getAllUsers = async (req, res) => {
  try {
    const users = await prisma.user.findMany();
    res.json(users);
  } catch (err) {
    res.status(500).json({error: "Failed to retrieve users"})
  }
};

// Create a new user
exports.createUser = async (req, res) => {
  const { name, email } = req.body;
  try {
    const newUser = await prisma.user.create({
      data: { name, email },
    });
    res.status(201).json(newUser)
  } catch (err) {
    res.status(500).json({error: "Failed to create user"})
  }
};

// Get a user by ID
exports.getUserById = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await prisma.user.findUniwue({ where: { id }})
    if (user) {
      res.json(user)
    } else {
      res.status(404).json({error : "User not found"})
    }
  } catch (err) {
    res.status(500).json({error : "Failed to retreive user"})
  }
};

// Update a user
exports.updateUser = async (req, res) => {
  const { id } = req.params;
  const { name, email } = req.body;
  try {
    const updatedUSer = await prisma.user.update({
      where: { id },
      data: { name, email }
    })
    res.json(updatedUser)
  } catch (err) {
    res.status(500).json({error : "Failed to update user"})
  }
}

// Delete
exports.deleteUser = async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.user.delete({ where: { id } });
    res.status(204).send()
  } catch (err) {
    res.status(500).json({error : "Failed to delete user"})
  }
}
