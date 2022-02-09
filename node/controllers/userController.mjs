import bcrypt from 'bcrypt'
import crypto from 'crypto'
import pkg from '@prisma/client'
import Helper from '../utilities/helper.mjs'
import { mkdir } from 'fs/promises'
import sharp from 'sharp'
import jwt from 'jsonwebtoken'
import Joi from 'joi'
const { PrismaClient } = pkg
const prisma = new PrismaClient()

class UserController {
  validateUser (user) {
    const schema = Joi.object({
      email: Joi.string().email({ minDomainSegments: 2 }).min(4).required(),
      password: Joi.string().min(3).required(),
      firstName: Joi.string().min(2).required(),
      lastName: Joi.string().min(2).required(),
      dob: Joi.required(),
      shirtSize: Joi.required(),
      sex: Joi.required(),
      keeper: Joi.required(),
      terms: Joi.required(),
      phone: Joi.string(),
    })
    return schema.validate(user)
  }

  generateToken () {
    const token = crypto.randomBytes(16).toString('hex')
    return token
  }

  updateToken (userId) {
    return prisma.user.update({
      where: { id: userId },
      data: { token: this.generateToken() }
    })
  }

  async create (req, res) {
  // REmove all unnessarcary things from the return like admin referee, etc.

    console.log('Creating User!!')
    // Validate using Joi
    const response = this.validateUser(req.body)
    if (response.error) {
      return new Helper(res).sendError(response.error.details[0].message, response.error.details[0].path)
    }
    // check if email is unique
    const checkEmail = await prisma.user.findUnique({ where: { email: req.body.email } })
    if (checkEmail) {
      return new Helper(res).sendError(`${req.body.email} is already registered`, 'email')
    }

    // Process phone number
    let rawPhone = req.body.phone.replace(/\D/g, '')
    rawPhone = parseInt(rawPhone)
    console.log(rawPhone)
    // Check keeper and terms
    const keeper = Boolean(parseInt(req.body.keeper))
    const terms = Boolean(parseInt(req.body.terms))
    // Check Sex
    console.log(req.body.sex)
    if (req.body.sex !== 'Male' || req.body.sex !== 'Female') {
      console.log('sex is neither male or female')
    }
    // Hash Password
    const hash = await bcrypt.hash(req.body.password, 12)
    console.log('This it he phone number' + rawPhone)
    // create user
    const user = await prisma.user.create({ data: { email: req.body.email, firstName: req.body.firstName, lastName: req.body.lastName, dob: req.body.dob, phone: rawPhone, shirtSize: req.body.shirtSize, sex: req.body.sex, keeper: keeper, terms: terms, password: hash, token: this.generateToken() } })
    let newUser = {}
    newUser.id = user.id
    newUser.sex = user.sex
    newUser.age = new Helper().calculateAge(user.dob)
    console.log(newUser.age)
    console.log('Sending user: ' + newUser)
    return res.send({ user: newUser })
  }

  async read (req, res) {
    const id = parseInt(req.params.id)
    const user = await prisma.user.findUnique({ where: { id: id } })
    if (!user) {
      return new Helper(res).sendError('No user with that ID Exists', 'id')
    }
    return res.send({ user: user })
  }

  async login (req, res) {
    // Validate with Joi
    const response = this.validateUser(req.body)
    if (response.error) {
      return new Helper(res).sendError(response.error.details[0].message, response.error.details[0].path)
    }

    // Find user in database
    const user = await prisma.user.findUnique({ where: { email: req.body.email } })
    if (!user) {
      return new Helper(res).sendError('Unknown User Email Address', 'email')
    }

    // check if passwords match
    const passwordCorrect = await bcrypt.compare(req.body.password, user.password)
    if (!passwordCorrect) {
      return new Helper(res).sendError('Password incorrect', 'password')
    }

    // remove password
    delete user.password

    // create JWT Token
    const accessToken = jwt.sign({ _id: user.id, type: user.admin }, process.env.SECRET_TOKEN, { expiresIn: '7d' })
    console.log('logged in!')
    return res.send({ accessToken })
  }
}

export default new UserController()
