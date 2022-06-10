-- GUIDs for card pools
moltresP = '38bef0'
liepardP = 'de17df'
lucarioP = '15dde8'
bibarelP = '1d47e5'
moltresPack = 'bc6dd9'
liepardPack = 'a5d9db'
lucarioPack = '78d261'
bibarelPack = '2ec4f9'
profResearch = '7deea6'
korrFocus = '9e5ab5'
barry = '92f8d9'
bruno = 'df5f03'
copycat = 'd8c6fe'
cyntAmbition = 'af30dc'

-- Table of promo cards
promos = {moltresP, liepardP, lucarioP, bibarelP}

function printSet()

    -- seting cloned cards to spawn on main tile 
    spawnPos = self.positionToWorld({0, 5.5, 0})
    clone_parameters = {position = spawnPos}

    -- tables containing possible evolition pack sections and trainers
    evoPacks = {moltresPack, liepardPack, lucarioPack, bibarelPack}
    trainerExtras = {profResearch, profResearch, korrFocus, korrFocus, barry, barry, bruno, bruno, copycat, copycat, cyntAmbition, cyntAmbition}

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
    promoCard = getObjectFromGUID(ePart1)
    promoCard.clone(clone_parameters)

    fistPack = getObjectFromGUID(ePart2)
    fistPack.clone(clone_parameters)
    secondPack = getObjectFromGUID(ePart3)
    secondPack.clone(clone_parameters)
end