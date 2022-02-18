import express from 'express'
import cors from 'cors'
/*
javascript will do all imports before any other code, so
 even though this line comes before import userController,
 it doesn't actually get run until after. The solution is
 to make a module that calls dotenv.config
 */
import userController from './controllers/userController.mjs'
import matchController from './controllers/matchController.mjs'
import refereeController from './controllers/refereeController.mjs'
import systemController from './controllers/systemController.mjs'
import verifyToken from './utilities/verifyToken.mjs'
import leagueController from './controllers/leagueController.mjs'
import referralController from './controllers/referralController.mjs'
import busboy from 'express-busboy'


// Creating Express App
const app = express()
const port = 5000
app.use(cors())
app.use(express.json())
busboy.extend(app, {
  upload: true,
  allowedPath: url => {
    return [
      '/user/register'
    ].includes(url)
  },
  mimeTypeLimit: [
    'image/jpeg',
    'image/jpg',
    'image/png'
  ]
})
// Routes that don't require authentication
app.post('/user/register', userController.create.bind(userController))
app.post('/user/login', userController.login.bind(userController))
app.get('/league/getLeagueSeasons', leagueController.getLeagueSeasons.bind(leagueController))
app.post('/league/register', leagueController.register.bind(leagueController))
app.post('/referral/inviteFriendCreate', referralController.inviteFriendCreate.bind(referralController))
app.get('/referral/addToWaitList/:id', referralController.addToWaitList.bind(referralController))

// Middleware for JWT
app.use(verifyToken)

// USER
// app.get('/user/:id', userController.read.bind(userController))
// app.get('/user/delete/:id', userController.delete.bind(userController))

// match
// app.post('/match/create', matchController.create.bind(matchController))
// app.get('/matchs', matchController.list.bind(matchController))
// app.get('/match/:id', matchController.read.bind(matchController))
// app.post('/match/update/:id', matchController.update.bind(matchController))
// app.get('/match/delete/:id', matchController.delete.bind(matchController))

// referee
// app.post('/match/referee/create', refereeController.create.bind(refereeController))
// app.get('/match/referee/:id', refereeController.read.bind(refereeController))
// app.get('/match/referees/:id', refereeController.readAll.bind(refereeController))
// app.post('/match/referee/update/:id', refereeController.update.bind(refereeController))
// app.get('/match/referee/delete/:id', refereeController.delete.bind(refereeController))

// Line Items
// app.post('/match/referee/line-item/create', systemController.create.bind(systemController))
// app.get('/match/referee/line-items/both/:id', systemController.both.bind(systemController))
// app.get('/match/referee/line-items/:id', systemController.readAll.bind(systemController))
// app.get('/match/referee/line-item/:id', systemController.read.bind(systemController))
// app.post('/match/referee/line-item/update/', systemController.update.bind(systemController))
// app.get('/match/referee/line-item/duplicate/:id', systemController.duplicate.bind(systemController))
// app.get('/match/referee/line-item/delete/:id', systemController.delete.bind(systemController))

// All
app.all('*', (req, res) => {
  res.status(404).send('<h1>Not Found</h1>')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
