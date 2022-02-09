import pkg from '@prisma/client'
import Helper from '../utilities/helper.mjs'
const { PrismaClient } = pkg
const prisma = new PrismaClient()

class referralController {
  async inviteFriendSend (req, res) {
    const id = parseInt(req.params.id)
    // Need to order results by field order desc
    const leagueCategories = await prisma.leaguecategory.findMany({ include: { league: true } })
    console.log(leagueCategories)
    if (!leagueCategories) {
      return new Helper(res).sendError('No leagues have been created', 'id')
    }
    return res.send({ leagueCategories: leagueCategories })
  }

  async inviteFriendCreate (req, res) {
    console.log(req.body)
    const phone = req.body.phone
    for (let index = 0; index < phone.length; index++) {
      if (phone[index].length === 10) {
        const phoneNum = parseInt(phone[index].replace(/\D/g, ''))
        const userId = parseInt(req.body.userId)
        await prisma.invitefriends.create({ data: { userId: userId, phone: phoneNum } })

        // Need to shove this over to a new method that actives the sms API and then changes the status of each to Sent or fails and sets to help

    }
      }
    return res.send({ user: req.body.userId })
  }

  async addToWaitList (req, res) {
    const id = parseInt(req.params.id)
      const user = await prisma.waitlist.create({ data: { userId: id } })
      return res.send({ user: user.userId})
  }

}

export default new referralController()
