-- GUIDs for card pools
eP1 = ''
eP2 = ''
eP3 = ''
eP4 = ''
ePk1 = ''
ePk2 = ''
ePk3 = ''
ePk4 = ''
-- Randomized trainer cards (to change the number of cards in the pool add/remove tRNR variable to the list below and the trainerExtras table)
tRNR1 = ''
tRNR2 = ''
tRNR3 = ''
tRNR4 = ''
tRNR5 = ''
tRNR6 = ''
tRNR7 = ''

-- Table of promo cards
promos = {eP1, eP2, eP3, eP4}

function printSet()
    
    -- seting cloned cards to spawn on main tile 
    spawnPos = self.positionToWorld({0, 5.5, 0})
    spawnLoc = { posX=spawnPos[1], posY=spawnPos[2], posZ=spawnPos[3]}
    clone_parameters = {position = spawnPos}

    evoPacks = {ePk1, ePk2, ePk3, ePk4}
    -- Make sure each tRNR apears twice!
    trainerExtras = {tRNR1, tRNR1, tRNR2, tRNR2, tRNR3, tRNR3, tRNR4, tRNR4, tRNR5, tRNR5, tRNR6, tRNR6, tRNR7, tRNR7}

    -- randomly generate the evolution pack minus the trainers
    randomSeed1 = math.random(#evoPacks)
    ePart1 = (promos[randomSeed1])
    ePart2 = (evoPacks[randomSeed1])

    table.remove(evoPacks, randomSeed1)

    randomSeed2 = math.random(#evoPacks)
    ePart3 = (evoPacks[randomSeed2])

-- generate trainers
    for i=1, 6 do
        extSeed1 = math.random(#trainerExtras)
        exT1 = (trainerExtras[extSeed1])
        trainerCard = getObjectFromGUID(exT1)
        trainerCard.clone(clone_parameters)

        table.remove(trainerExtras, extSeed1)
    end

    -- clone cards from selected pools
    secondPack = getObjectFromGUID(ePart3)
    secondPack.clone(clone_parameters)
    fistPack = getObjectFromGUID(ePart2)
    fistPack.clone(clone_parameters)

    promoCard = getObjectFromGUID(ePart1)
    promoCard.clone(clone_parameters)

end