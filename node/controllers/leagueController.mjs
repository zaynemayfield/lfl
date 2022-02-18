import pkg from '@prisma/client'
import Helper from '../utilities/helper.mjs'
const { PrismaClient } = pkg
const prisma = new PrismaClient()

class leagueController {
  async getLeagueSeasons (req, res) {
    const id = parseInt(req.params.id)
    // Need to order results by field order desc
    // const leagueCategories = await prisma.leaguecategory.findMany({ include: { league: true } })
    // const leagueCategories = await prisma.leagueseason.findMany({ include: { season: true, league: { include: {leaguecategory: true } } } })
    // const leagueCategories = await prisma.season.findMany({ include: { leagueseason: { include: { leaguecategory: { include: { league: true } } } } } })
    // trying to figure out if you can get onlt the stuff I want
    const leagueSeasons = await prisma.leagueseason.findMany({
      include: {
        season: true,
        league: {
          include: {
            leaguecategory: true
          }
        }
      },
      orderBy: [
        {
          season: {
            startDate: 'asc'
          }
        },
        {
          league: {
            leaguecategory: {
              name: 'asc'
            }
          }
        },
        {
          league: {
            order: 'asc'
          }
        }
      ]
    })
    if (!leagueSeasons) {
      return new Helper(res).sendError('No leagues have been created', 'id')
    }
    return res.send({ leagueSeasons: leagueSeasons })
  }

  async getUserUnpaidLeagues (req, res) {
    const userId = parseInt(req.params.userId)

    const leagues = await prisma.leaguecategory.findMany({ include: { league: true } })
    return res.send({leagues: leagues})
  }

  async register (req, res) {
    console.log(req.body)
    // Check if league is empty and return an error saying they did not choose a league
    const league = req.body.league
    for (let index = 0; index < league.length; index++) {
      const leagueId = parseInt(league[index])
      const leagueData = await prisma.league.findUnique({ where: { id: leagueId } })
      const leaguePrice = leagueData.price
      const userId = parseInt(req.body.userId)
      await prisma.leaguemember.create({ data: { leagueId: leagueId, price: leaguePrice, userId: userId } })
    }
    return res.send({ user: req.body.userId })
  }
}

export default new leagueController()
