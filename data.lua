local MissionData = {
    ["FactionImages"] = {
        ["Grineer"] = "IconGrineerB.svg",
        ["Corpus"] = "IconCorpusB.svg",
        ["Infested"] = "IconInfestedB.svg",
        ["Corrupted"] = "IconOrokinB.svg",
        ["Crossfire"] = "InvasionIcon_b.png",
    },
    ["MissionDetails"] = {
        { Node = "Apollodorus", Planet = "Mercury", Type = "Survival",Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 6, MaxLevel = 11, Tier = "Survival1"},
        { Node = "Boethius", Planet = "Mercury", Type = "Mobile Defense", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 8, MaxLevel = 10},
        { Node = "Caloris", Planet = "Mercury", Type = "Rescue", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 6, MaxLevel = 8, Tier = "Rescue1"},
        { Node = "Elion", Planet = "Mercury", Type = "Capture", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 7, MaxLevel = 9, Tier = "Capture"},
        { Node = "Lares", Planet = "Mercury", Type = "Defense", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 6, MaxLevel = 11, Tier = "Defense1", Other = "B"},
        { Node = "M Prime", Planet = "Mercury", Type = "Exterminate", Tileset = "Grineer Asteroid", Enemy = {"Infested", "Grineer"}, MinLevel = 7, MaxLevel = 9},
        { Node = "Odin", Planet = "Mercury", Type = "Interception", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 6, MaxLevel = 11, Tier = "Interception1"},
        { Node = "Pantheon", Planet = "Mercury", Type = "Exterminate", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 6, MaxLevel = 8},
        { Node = "Suisei", Planet = "Mercury", Type = "Spy", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, Tier = "Spy1"},
        { Node = "Terminus", Planet = "Mercury", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = {"Infested", "Grineer"}, MinLevel = 8, MaxLevel = 10, Tier = "Reactor1"},
        { Node = "Tolstoj", Planet = "Mercury", Type = "Assassination", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, Tier = "Vor",  LinkName = "Captain Vor", Pic = "CaptainVor_sigil_b.png", Drops = {"Cronus","Seer"}},

        { Node = "Orb Vallis", Planet = "Venus", Type = "Landscape|Free Roam", Tileset = "Orb Vallis", Enemy = "Corpus", MinLevel = 10, MaxLevel = 30, Tier = "Landscape", Pic = "SolarisUnitedSigil.png"},
        { Node = "Aphrodite", Planet = "Venus", Type = "Mobile Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8},
        { Node = "Cytherean", Planet = "Venus", Type = "Interception", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Interception1"},
        { Node = "E Gate", Planet = "Venus", Type = "Exterminate", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 5},
        { Node = "Ishtar", Planet = "Venus", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, Tier = "Reactor1"},
        { Node = "Kiliken", Planet = "Venus", Type = "Excavation", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Excavation1"},
        { Node = "Linea", Planet = "Venus", Type = "Rescue", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 5, MaxLevel = 7, Tier = "Rescue1"},
        { Node = "Malva", Planet = "Venus", Type = "Survival", IsDarkSector = 1, Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 8, MaxLevel = 18, Tier = "DSSurvival1", DSCredits = 10, DSResourceBonus = 10, DSXPBonus = 10, DSWeaponBonus = 5, DSWeapon = 'Rifles'},
        { Node = "Montes", Planet = "Venus", Type = "Exterminate", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "AWExterminate"},
        { Node = "Romula", Planet = "Venus", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 8, MaxLevel = 18, Tier = "DSDefense", DSCredits = 10, DSResourceBonus = 10, DSXPBonus = 10, DSWeaponBonus = 5, DSWeapon = 'Rifles'},
        { Node = "Tessera", Planet = "Venus", Type = "Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Defense1", Other = "E"},
        { Node = "Unda", Planet = "Venus", Type = "Spy", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 4, MaxLevel = 6, Tier = "Spy1"},
        { Node = "Venera", Planet = "Venus", Type = "Capture", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 5, MaxLevel = 7, Tier = "Capture"},
        { Node = "V Prime", Planet = "Venus", Type = "Survival", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Survival1"},
        { Node = "Fossa", Planet = "Venus", Type = "Assassination", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, Tier = "Jackal",  LinkName = "Jackal", Pic = "Jackal_sigil_b.png", Drops = {"Rhino"}},

        { Node = "Plains of Eidolon", Planet = "Earth", Type = "Landscape|Free Roam", Tileset = "Plains of Eidolon", Enemy = "Grineer", MinLevel = 10, MaxLevel = 30, Tier = "Landscape", Pic = "DawnsEarlyLight.png"},
        { Node = "Cambria", Planet = "Earth", Type = "Spy", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 2, MaxLevel = 4, Tier = "Spy1"},
        { Node = "Cervantes", Planet = "Earth", Type = "Sabotage", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 4, MaxLevel = 6, Tier = "EarthCaches"},
        { Node = "E Prime", Planet = "Earth", Type = "Exterminate", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 3},
        { Node = "Erpo", Planet = "Earth", Type = "Mobile Defense", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "AWMobileDefense"},
        { Node = "Eurasia", Planet = "Earth", Type = "Mobile Defense", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 3, MaxLevel = 5},
        { Node = "Everest", Planet = "Earth", Type = "Excavation", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "Excavation1"},
        { Node = "Gaia", Planet = "Earth", Type = "Interception", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "Interception1"},
        { Node = "Lith", Planet = "Earth", Type = "Defense", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "Defense1", Other = "J"},
        { Node = "Mantle", Planet = "Earth", Type = "Capture", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 2, MaxLevel = 4, Tier = "Capture"},
        { Node = "Mariana", Planet = "Earth", Type = "Exterminate", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 1, MaxLevel = 3},
        { Node = "Pacific", Planet = "Earth", Type = "Rescue", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 3, MaxLevel = 6, Tier = "Rescue1"},
        { Node = "Coba", Planet = "Earth", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Forest", Enemy = "Infested", MinLevel = 6, MaxLevel = 16, Tier = "DSDefense", DSCredits = 12, DSResourceBonus = 15, DSXPBonus = 12, DSWeaponBonus = 8, DSWeapon = 'Melee'},
        { Node = "Oro", Planet = "Earth", Type = "Assassination", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 20, MaxLevel = 25, Tier = "Vay Hek",  LinkName = "Councilor Vay Hek", Pic = "VeyHek_sigil_b.png", Drops = {"Hydroid"}},
        { Node = "Tikal", Planet = "Earth", Type = "Excavation", IsDarkSector = 1, Tileset = "Grineer Forest", Enemy = "Infested", MinLevel = 6, MaxLevel = 16, Tier = "Excavation1", DSCredits = 12, DSResourceBonus = 15, DSXPBonus = 12, DSWeaponBonus = 8, DSWeapon = 'Melee'},

        { Node = "Alator", Planet = "Mars", Type = "Interception", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, Tier = "Interception1"},
        { Node = "Ara", Planet = "Mars", Type = "Capture", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 10, MaxLevel = 12, Tier = "Capture"},
        { Node = "Ares", Planet = "Mars", Type = "Sabotage", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 11},
        { Node = "Arval", Planet = "Mars", Type = "Spy", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 11, Tier = "Spy1"},
        { Node = "Augustus", Planet = "Mars", Type = "Excavation", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 14, Tier = "Excavation1"},
        { Node = "Gradivus", Planet = "Mars", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 9, MaxLevel = 11, Tier = "Reactor1"},
        { Node = "Hellas", Planet = "Mars", Type = "Exterminate", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10},
        { Node = "Kadesh", Planet = "Mars", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Settlement", Enemy = "Infested", MinLevel = 10, MaxLevel = 20, Tier = "DSDefense", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Pistols'},
        { Node = "Martialis", Planet = "Mars", Type = "Rescue", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 10, MaxLevel = 12, Tier = "Rescue1"},
        { Node = "Olympus", Planet = "Mars", Type = "Disruption", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 15, MaxLevel = 20, Tier = "DisruptionMars"},
        { Node = "Spear", Planet = "Mars", Type = "Defense", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, Tier = "Defense1", Other = "B"},
        { Node = "Syrtis", Planet = "Mars", Type = "Exterminate", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, Tier = "AWExterminate"},
        { Node = "Tharsis", Planet = "Mars", Type = "Mobile Defense", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10},
        { Node = "Ultor", Planet = "Mars", Type = "Exterminate", Tileset = "Corpus Ice Planet", Enemy = {"Grineer", "Corpus"}, MinLevel = 11, MaxLevel = 13},
        { Node = "Vallis", Planet = "Mars", Type = "Mobile Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 11, MaxLevel = 13},
        { Node = "Wahiba", Planet = "Mars", Type = "Survival", IsDarkSector = 1, Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 10, MaxLevel = 20, Tier = "DSSurvival2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Pistols'},
        { Node = "War", Planet = "Mars", Type = "Assassination", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 11, MaxLevel = 13, Tier = "Lech Kril", LinkName = "Lieutenant Lech Kril", Pic = "LechKril_sigil_b.png", Drops = {"Excalibur"}},

        { Node = "Roche", Planet = "Phobos", Type = "Exterminate", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 12},
        { Node = "Sharpless", Planet = "Phobos", Type = "Mobile Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 11, MaxLevel = 13},
        { Node = "Gulliver", Planet = "Phobos", Type = "Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 15, Tier = "Defense1", Other = "C"},
        { Node = "Kepler", Planet = "Phobos", Type = "Rush (Archwing)", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 12, MaxLevel = 14, Tier = "AWRush"},
        { Node = "Memphis", Planet = "Phobos", Type = "Defection", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "Defection1", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Melee'},
        { Node = "Monolith", Planet = "Phobos", Type = "Rescue", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 13, MaxLevel = 15, Tier = "Rescue1"},
        { Node = "Shklovsky", Planet = "Phobos", Type = "Spy", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 11, MaxLevel = 13, Tier = "Spy1"},
        { Node = "Skyresh", Planet = "Phobos", Type = "Capture", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 12, MaxLevel = 14, Tier = "Capture"},
        { Node = "Stickney", Planet = "Phobos", Type = "Survival", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 15, Tier = "Survival1"},
        { Node = "Zeugma", Planet = "Phobos", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "DSSurvival2", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Rifles'},
        { Node = "Iliad", Planet = "Phobos", Type = "Assassination", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 13, MaxLevel = 15, Tier = "Sergeant",  LinkName = "The Sergeant", Pic = "NefAnyo_sigil_b.png", Drops = {"Mag"}},

        { Node = "Horend", Planet = "Deimos", Type = "Capture",  Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 12, MaxLevel = 14, Tier = "Capture"},
        { Node = "Phlegyas", Planet = "Deimos", Type = "Exterminate", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 13, MaxLevel = 15},
        { Node = "Cambion Drift", Planet = "Deimos", Type = "Landscape|Free Roam", Tileset = "Cambion Drift", Enemy = "Infested", MinLevel = 20, MaxLevel = 35, Pic = "EntratiIcon.png"},
        { Node = "Formido", Planet = "Deimos", Type = "Sabotage", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 14, MaxLevel = 16, Tier = "DerelictCaches"},
        { Node = "Hyf", Planet = "Deimos", Type = "Defense", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 15, MaxLevel = 20, Tier = "DerelictDefense"},
        { Node = "Dirus", Planet = "Deimos", Type = "Mobile Defense", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 15, MaxLevel = 17},
        { Node = "Magnacidium", Planet = "Deimos", Type = "Assassination", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 20, MaxLevel = 25, Tier = "Lephantis",  LinkName = "Lephantis", Pic = "Lephantis_sigil_b.png", Drops = {"Nekros"}},
        { Node = "Terrorem", Planet = "Deimos", Type = "Survival", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 25, MaxLevel = 35, Tier = "DerelictSurvival"},
        { Node = "Exequias", Planet = "Deimos", Type = "Assassination", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, Tier = "Zealoid Prelate", LinkName = "Zealoid Prelate", Pic = "ZealoidPrelate.png", Drops = {"Pathocyst"}},

        { Node = "Bode", Planet = "Ceres", Type = "Spy", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 14, Tier = "Spy2"},
        { Node = "Casta", Planet = "Ceres", Type = "Defense", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, Tier = "Defense1", Other = "I"},
        { Node = "Cinxia", Planet = "Ceres", Type = "Interception", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, Tier = "Interception1"},
        { Node = "Draco", Planet = "Ceres", Type = "Survival", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, Tier = "Survival2"},
        { Node = "Gabii", Planet = "Ceres", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "DSSurvival1", DSCredits = 20, DSResourceBonus = 35, DSXPBonus = 26, DSWeaponBonus = 21, DSWeapon = 'Melee'},
        { Node = "Ker", Planet = "Ceres", Type = "Sabotage", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, Tier = "Reactor2"},
        { Node = "Kiste", Planet = "Ceres", Type = "Mobile Defense", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 13, MaxLevel = 15},
        { Node = "Lex", Planet = "Ceres", Type = "Capture", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, Tier = "Capture"},
        { Node = "Ludi", Planet = "Ceres", Type = "Hijack", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 15, MaxLevel = 17},
        { Node = "Nuovo", Planet = "Ceres", Type = "Rescue", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 13, MaxLevel = 15, Tier = "Rescue1"},
        { Node = "Pallas", Planet = "Ceres", Type = "Exterminate", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 14},
        { Node = "Seimeni", Planet = "Ceres", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Shipyard", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "DSDefense", DSCredits = 20, DSResourceBonus = 35, DSXPBonus = 26, DSWeaponBonus = 21, DSWeapon = 'Melee'},
        { Node = "Thon", Planet = "Ceres", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 15, MaxLevel = 17, Tier = "Reactor2"},
        { Node = "Exta", Planet = "Ceres", Type = "Assassination", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, Tier = "Kril and Vor 2", LinkName = "Captain Vor & Lieutenant Lech Kril", Pic = "Vor Krill Icon.png", Drops = {"Frost","Miter","Twin Gremlins"}},

        { Node = "Adrastea", Planet = "Jupiter", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, Tier = "Reactor2"},
        { Node = "Amalthea", Planet = "Jupiter", Type = "Spy", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 17, MaxLevel = 19, Tier = "Spy2"},
        { Node = "Ananke", Planet = "Jupiter", Type = "Capture", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 16, MaxLevel = 18, Tier = "Capture"},
        { Node = "Callisto", Planet = "Jupiter", Type = "Interception", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "Interception2"},
        { Node = "Carme", Planet = "Jupiter", Type = "Mobile Defense", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 16, MaxLevel = 18},
        { Node = "Carpo", Planet = "Jupiter", Type = "Exterminate", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 17, MaxLevel = 19, Tier = "JupiterCaches"},
        { Node = "Elara", Planet = "Jupiter", Type = "Survival", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "Survival2"},
        { Node = "Galilea", Planet = "Jupiter", Type = "Sabotage", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "AWSabotage"},
        { Node = "Ganymede", Planet = "Jupiter", Type = "Disruption", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 30, MaxLevel = 35, Tier = "DisruptionJupiter"},
        { Node = "Io", Planet = "Jupiter", Type = "Defense", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "Defense2", Other = "H"},
        { Node = "Metis", Planet = "Jupiter", Type = "Rescue", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 17, Tier = "Rescue2"},
        { Node = "Thebe", Planet = "Jupiter", Type = "Sabotage", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20},
        { Node = "Cameria", Planet = "Jupiter", Type = "Survival", IsDarkSector = 1, Tileset = "Corpus Gas City", Enemy = "Infested", MinLevel = 20, MaxLevel = 30, Tier = "DSSurvival2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Shotguns'},
        { Node = "Sinai", Planet = "Jupiter", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Gas City", Enemy = "Infested", MinLevel = 20, MaxLevel = 30, Tier = "DSDefense", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Melee'},
        { Node = "Themisto", Planet = "Jupiter", Type = "Assassination", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, Tier = "Alad V",  LinkName = "Alad V", Pic = "AladV_sigil_b.png", Drops = {"Valkyr"}},
        { Node = "The Ropalolyst", Planet = "Jupiter", Type = "Assassination", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 40, MaxLevel = 40, Tier = "Ropalolyst",  LinkName = "Ropalolyst", Pic = "Ropalolyst.png", Drops = {"Wisp"}},

        { Node = "Abaddon", Planet = "Europa", Type = "Capture", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, Tier = "Capture"},
        { Node = "Armaros", Planet = "Europa", Type = "Exterminate", Tileset = "Infested Ship", Enemy = {"Infested", "Grineer"}, MinLevel = 18, MaxLevel = 20},
        { Node = "Baal", Planet = "Europa", Type = "Exterminate", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23},
        { Node = "Kokabiel", Planet = "Europa", Type = "Sabotage", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 20, MaxLevel = 22},
        { Node = "Morax", Planet = "Europa", Type = "Mobile Defense", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20},
        { Node = "Orias", Planet = "Europa", Type = "Rescue", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 20, MaxLevel = 22, Tier = "Rescue2"},
        { Node = "Ose", Planet = "Europa", Type = "Interception", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, Tier = "Interception2"},
        { Node = "Paimon", Planet = "Europa", Type = "Defense", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, Tier = "Defense2", Other = "D/E/F"},
        { Node = "Sorath", Planet = "Europa", Type = "Hijack", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 19, MaxLevel = 21},
        { Node = "Valac", Planet = "Europa", Type = "Spy", Tileset = "Corpus Ship", Enemy = {"Grineer", "Corpus"}, MinLevel = 18, MaxLevel = 20, Tier = "Spy2"},
        { Node = "Valefor", Planet = "Europa", Type = "Excavation", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, Tier = "Excavation2"},
        { Node = "Cholistan", Planet = "Europa", Type = "Excavation", IsDarkSector = 1, Tileset = "Corpus Ice Planet", Enemy = "Infested", MinLevel = 23, MaxLevel = 33, Tier = "Excavation3", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 12, DSWeapon = 'Melee'},
        { Node = "Larzac", Planet = "Europa", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Ice Planet", Enemy = "Infested", MinLevel = 23, MaxLevel = 33, Tier = "DSDefense", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 12, DSWeapon = 'Pistols'},
        { Node = "Naamah", Planet = "Europa", Type = "Assassination", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, Tier = "Raptor",  LinkName = "Raptors", Pic = "Raptor_sigil_b.png", Drops = {"Nova"}},

        { Node = "Anthe", Planet = "Saturn", Type = "Rescue", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, Tier = "Rescue3"},
        { Node = "Calypso", Planet = "Saturn", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, Tier = "Reactor2"},
        { Node = "Caracol", Planet = "Saturn", Type = "Defection", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 26, MaxLevel = 36, Tier = "Defection2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Rifles'},
        { Node = "Cassini", Planet = "Saturn", Type = "Capture", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, Tier = "Capture"},
        { Node = "Dione", Planet = "Saturn", Type = "Spy", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, Tier = "Spy2"},
        { Node = "Enceladus", Planet = "Saturn", Type = "Sabotage", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 23, MaxLevel = 25},
        { Node = "Helene", Planet = "Saturn", Type = "Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "Defense2", Other = "A"},
        { Node = "Keeler", Planet = "Saturn", Type = "Mobile Defense", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 23, MaxLevel = 25},
        { Node = "Numa", Planet = "Saturn", Type = "Rescue", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, Tier = "Rescue2"},
        { Node = "Pandora", Planet = "Saturn", Type = "Pursuit", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, Tier = "AWPursuit"},
        { Node = "Piscinas", Planet = "Saturn", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 26, MaxLevel = 36, Tier = "DSSurvival2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Shotguns'},
        { Node = "Rhea", Planet = "Saturn", Type = "Interception", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "Interception2"},
        { Node = "Telesto", Planet = "Saturn", Type = "Exterminate", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24},
        { Node = "Titan", Planet = "Saturn", Type = "Survival", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "Survival2"},
        { Node = "Tethys", Planet = "Saturn", Type = "Assassination", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, Tier = "Sargas Ruk",  LinkName = "General Sargas Ruk", Pic = "SargusRuk_sigil_b.png", Drops = {"Ember"}},

        { Node = "Ariel", Planet = "Uranus", Type = "Capture", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 25, MaxLevel = 27, Tier = "Capture"},
        { Node = "Assur", Planet = "Uranus", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 25, MaxLevel = 35, Tier = "DSSurvival3", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Melee'},
        { Node = "Caelus", Planet = "Uranus", Type = "Interception", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "AWInterception"},
        { Node = "Caliban", Planet = "Uranus", Type = "Rescue", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 25, MaxLevel = 27, Tier = "Rescue3"},
        { Node = "Cressida", Planet = "Uranus", Type = "Mobile Defense", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29},
        { Node = "Desdemona", Planet = "Uranus", Type = "Sabotage", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 26, MaxLevel = 28, Tier = "SealabCaches"},
        { Node = "Ophelia", Planet = "Uranus", Type = "Survival", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "Survival3"},
        { Node = "Puck", Planet = "Uranus", Type = "Exterminate", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29},
        { Node = "Rosalind", Planet = "Uranus", Type = "Spy", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, Tier = "Spy3"},
        { Node = "Stephano", Planet = "Uranus", Type = "Defense", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "Defense3", Other = "O"},
        { Node = "Sycorax", Planet = "Uranus", Type = "Exterminate", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26},
        { Node = "Umbriel", Planet = "Uranus", Type = "Interception", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "Interception2"},
        { Node = "Ur", Planet = "Uranus", Type = "Disruption", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, Tier = "DisruptionUranus", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Pistols'},
        { Node = "Titania", Planet = "Uranus", Type = "Assassination", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, Tier = "Tyl Regor",  LinkName = "Tyl Regor", Pic = "TylRegor_sigil_b.png", Drops = {"Equinox"}},

        { Node = "Despina", Planet = "Neptune", Type = "Excavation", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, Tier = "Excavation3"},
        { Node = "Galatea", Planet = "Neptune", Type = "Capture", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 27, MaxLevel = 29, Tier = "Capture"},
        { Node = "Kelashin", Planet = "Neptune", Type = "Survival", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "DSSurvival3", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Rifles'},
        { Node = "Laomedeia", Planet = "Neptune", Type = "Disruption", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "DisruptionNeptune"},
        { Node = "Larissa", Planet = "Neptune", Type = "Mobile Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31},
    { Node = "Nereid", Planet = "Neptune", Type = "Spy", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 30, MaxLevel = 32, Tier = "Spy3"},
        { Node = "Neso", Planet = "Neptune", Type = "Exterminate", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31},
        { Node = "Proteus", Planet = "Neptune", Type = "Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, Tier = "Defense3", Other = "D/E/F"},
        { Node = "Salacia", Planet = "Neptune", Type = "Mobile Defense", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, Tier = "AWMobileDefense"},
        { Node = "Sao", Planet = "Neptune", Type = "Sabotage", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31},
        { Node = "Triton", Planet = "Neptune", Type = "Rescue", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 28, MaxLevel = 30, Tier = "Rescue3"},
        { Node = "Yursa", Planet = "Neptune", Type = "Defection", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Defection3", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Shotguns'},
        { Node = "Psamathe", Planet = "Neptune", Type = "Assassination", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 32, Tier = "Hyena Pack",  LinkName = "Hyena Pack", Pic = "HyenaPack_sigil_b.png", Drops = {"Loki"}},

        { Node = "Acheron", Planet = "Pluto", Type = "Exterminate", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38},
        { Node = "Cerberus", Planet = "Pluto", Type = "Interception", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, Tier = "Interception3"},
        { Node = "Cypress", Planet = "Pluto", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, Tier = "Reactor3"},
        { Node = "Hydra", Planet = "Pluto", Type = "Capture", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 34, Tier = "Capture"},
        { Node = "Minthe", Planet = "Pluto", Type = "Mobile Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 34},
        { Node = "Narcissus", Planet = "Pluto", Type = "Exterminate", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 32, MaxLevel = 36},
        { Node = "Oceanum", Planet = "Pluto", Type = "Spy", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 32, MaxLevel = 36, Tier = "Spy3"},
        { Node = "Outer Terminus", Planet = "Pluto", Type = "Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, Tier = "Defense3", Other = "D/E/F"},
        { Node = "Palus", Planet = "Pluto", Type = "Survival", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, Tier = "Survival3"},
        { Node = "Regna", Planet = "Pluto", Type = "Rescue", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, Tier = "Rescue3"},
        { Node = "Hieracon", Planet = "Pluto", Type = "Excavation", IsDarkSector = 1, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "Excavation3", DSCredits = 24, DSResourceBonus = 35, DSXPBonus = 30, DSWeaponBonus = 25, DSWeapon = 'Pistols'},
        { Node = "Sechura", Planet = "Pluto", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSDefense", DSCredits = 24, DSResourceBonus = 35, DSXPBonus = 30, DSWeaponBonus = 25, DSWeapon = 'Rifles'},
        { Node = "Hades", Planet = "Pluto", Type = "Assassination", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 35, MaxLevel = 45, Tier = "Ambulas",  LinkName = "Ambulas", Pic = "Ambulas_sigil_b.png", Drops = {"Trinity"}},

        { Node = "Naga", Planet = "Sedna", Type = "Rescue", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 30, MaxLevel = 34, Tier = "Rescue3"},
        { Node = "Berehynia", Planet = "Sedna", Type = "Interception", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, Tier = "Interception3"},
        { Node = "Hydron", Planet = "Sedna", Type = "Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, Tier = "Defense3", Other = "A"},
        { Node = "Selkie", Planet = "Sedna", Type = "Survival", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, Tier = "Survival3"},
        { Node = "Adaro", Planet = "Sedna", Type = "Exterminate", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 32, MaxLevel = 36},
        { Node = "Rusalka", Planet = "Sedna", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 32, MaxLevel = 36, Tier = "Reactor3"},
        { Node = "Kelpie", Planet = "Sedna", Type = "Spy", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, Tier = "Spy3"},
        { Node = "Marid", Planet = "Sedna", Type = "Hijack", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38},
        { Node = "Charybdis", Planet = "Sedna", Type = "Mobile Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38},
        { Node = "Amarna", Planet = "Sedna", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSSurvival3", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Rifles'},
        { Node = "Sangeru", Planet = "Sedna", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSDefense", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Melee'},
        { Node = "Kappa", Planet = "Sedna", Type = "Disruption", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38, Tier = "DisruptionSedna"},
        { Node = "Nakki", Planet = "Sedna", Type = "Rathuum", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 40, MaxLevel = 40, Tier = "Rathuum1"},
        { Node = "Yam", Planet = "Sedna", Type = "Rathuum", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 60, MaxLevel = 60, Tier = "Rathuum2"},
        { Node = "Vodyanoi", Planet = "Sedna", Type = "Rathuum", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 85, MaxLevel = 85, Tier = "Rathuum2"},
        { Node = "Merrow", Planet = "Sedna", Type = "Assassination", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, Tier = "Kela De Thaym",  LinkName = "Kela De Thaym", Pic = "KelaDeThaym_sigil_b.png", Drops = {"Saryn","Twin Kohmak"}},

        { Node = "Brugia", Planet = "Eris", Type = "Rescue", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 36, Tier = "Rescue3"},
        { Node = "Isos", Planet = "Eris", Type = "Capture", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 36, Tier = "Capture"},
        { Node = "Kala-azar", Planet = "Eris", Type = "Defense", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Defense3", Other = "C"},
        { Node = "Naeglar", Planet = "Eris", Type = "Sabotage", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 34, Tier = "HiveCaches"},
        { Node = "Nimus", Planet = "Eris", Type = "Survival", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Survival3"},
        { Node = "Oestrus", Planet = "Eris", Type = "Infested Salvage", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38, Tier = "Salvage"},
        { Node = "Saxis", Planet = "Eris", Type = "Exterminate", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38},
        { Node = "Solium", Planet = "Eris", Type = "Mobile Defense", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38},
        { Node = "Xini", Planet = "Eris", Type = "Interception", Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Interception3"},
        { Node = "Akkad", Planet = "Eris", Type = "Defense", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSDefense", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Melee'},
        { Node = "Zabala", Planet = "Eris", Type = "Survival", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSSurvival4", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Pistols'},
        { Node = "Jordas Golem Assassinate", Planet = "Eris", Type = "Assassination", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 34, Tier = "Jordas Golem",  LinkName = "Jordas Golem", Pic = "J3Golem.png", Drops = {"Atlas"}},
        { Node = "Mutalist Alad V Assassinate", Planet = "Eris", Type = "Assassination", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, Tier = "Mutalist Alad V",  LinkName = "Mutalist Alad V", Pic = "InfestedAladV2.png", Drops = {"Mesa"}},

        { Node = "Apollo", Planet = "Lua", Type = "Disruption", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 35, MaxLevel = 40, Tier = "DisruptionLua"},
        { Node = "Copernicus", Planet = "Lua", Type = "Capture", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "Capture"},
        { Node = "Grimaldi", Planet = "Lua", Type = "Mobile Defense", Tileset = "Orokin Moon", Enemy = "Grineer", MinLevel = 25, MaxLevel = 30},
        { Node = "Pavlov", Planet = "Lua", Type = "Spy", Tileset = "Orokin Moon", Enemy = {"Grineer", "Corpus"}, MinLevel = 25, MaxLevel = 30, Tier = "LuaSpy"},
        { Node = "Plato", Planet = "Lua", Type = "Exterminate", Tileset = "Orokin Moon", Enemy = {"Grineer", "Corpus"}, MinLevel = 25, MaxLevel = 30, Tier = "LuaCaches"},
        { Node = "Stöfler", Planet = "Lua", Type = "Defense", Tileset = "Orokin Moon", Enemy = "Grineer", MinLevel = 25, MaxLevel = 30, Tier = "Defense3", Other = "?"},
        { Node = "Tycho", Planet = "Lua", Type = "Survival", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "Survival3"},
        { Node = "Zeipel", Planet = "Lua", Type = "Rescue", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "Rescue3"},

        { Node = "Dakata", Planet = "Kuva Fortress", Type = "Exterminate", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 28, MaxLevel = 30, Tier = "KuvaCaches"},
        { Node = "Garus", Planet = "Kuva Fortress", Type = "Rescue", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 31, MaxLevel = 33, Tier = "Rescue3"},
        { Node = "Koro", Planet = "Kuva Fortress", Type = "Assault", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 29, MaxLevel = 31},
        { Node = "Nabuk", Planet = "Kuva Fortress", Type = "Defense", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 30, MaxLevel = 32, Tier = "Defense3"},
        { Node = "Pago", Planet = "Kuva Fortress", Type = "Spy", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 31, MaxLevel = 33, Tier = "KuvaSpy"},
        { Node = "Rotuma", Planet = "Kuva Fortress", Type = "Mobile Defense", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 30, MaxLevel = 32},
        { Node = "Tamu", Planet = "Kuva Fortress", Type = "Disruption", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, Tier = "DisruptionKuva", Other = "?"},
        { Node = "Taveuni", Planet = "Kuva Fortress", Type = "Survival", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 32, MaxLevel = 37, Tier = "Survival3"},

        { Node = "Teshub", Planet = "Void", Type = "Exterminate", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, Tier = "VoidExterminate1"},
        { Node = "Hepit", Planet = "Void", Type = "Capture", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, Tier = "VoidCapture1"},
        { Node = "Taranis", Planet = "Void", Type = "Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, Tier = "VoidDefense1", Other = "K"},
        { Node = "Tiwaz", Planet = "Void", Type = "Mobile Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidMDefense2"},
        { Node = "Stribog", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidSabotage2"},
        { Node = "Stribog", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidCaches1", IgnoreInList = true},
        { Node = "Ani", Planet = "Void", Type = "Survival", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidSurvival2"},
        { Node = "Ukko", Planet = "Void", Type = "Capture", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, Tier = "VoidCapture3"},
        { Node = "Oxomoco", Planet = "Void", Type = "Exterminate", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, Tier = "VoidExterminate3"},
        { Node = "Belenus", Planet = "Void", Type = "Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, Tier = "VoidDefense3", Other = "K"},
        { Node = "Aten", Planet = "Void", Type = "Mobile Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidMDefense4"},
        { Node = "Marduk", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidSabotage4"},
        { Node = "Marduk", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidCaches2", IgnoreInList = true},
        { Node = "Mithra", Planet = "Void", Type = "Interception", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidInterception4"},
        { Node = "Mot", Planet = "Void", Type = "Survival", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidSurvival4"},

        { Node = "Phorid Alert", Planet = "Invasion", Type = "Assassination", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 0, MaxLevel = 0, Tier = "Phorid",  LinkName = "Phorid", Pic = "Phorid_sigil_b.png", Drops = {"Nyx"}},



        { Node = "Sover Strait", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 15, MaxLevel = 20, Tier = "EarthProxima", FighterMinLevel = 3, FighterMaxLevel = 6, MaxFighters = 30, MaxCrewships = 2, Objectives = 0},
        { Node = "Ogal Cluster", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "EarthProxima", FighterMinLevel = 9, FighterMaxLevel = 13, MaxFighters = 30, MaxCrewships = 2, Objectives = 0},
        { Node = "Bendar Cluster", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 29, MaxLevel = 36, Tier = "EarthProxima", FighterMinLevel = 14, FighterMaxLevel = 17, MaxFighters = 60, MaxCrewships = 4, Objectives = 1},
        { Node = "Iota Temple", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 20, MaxLevel = 28, Tier = "EarthProxima", FighterMinLevel = 6, FighterMaxLevel = 10, MaxFighters = 60, MaxCrewships = 4, Objectives = 1},
        { Node = "Korms Belt", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 24, MaxLevel = 30, Tier = "EarthProxima", FighterMinLevel = 12, FighterMaxLevel = 15, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, ObjectiveDetails = 'Chance for Galleon Assassinate'},

        { Node = "Bifrost Echo", Planet = "Venus Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 15, MaxLevel = 18, Tier = "VenusProxima", FighterMinLevel = 4, FighterMaxLevel = 8, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Beacon Shield Ring", Planet = "Venus Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 17, MaxLevel = 20, Tier = "VenusProximaVolatile", FighterMinLevel = 6, FighterMaxLevel = 10, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Orvin-Haarc", Planet = "Venus Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 19, MaxLevel = 22, Tier = "VenusProximaSpy", FighterMinLevel = 9, FighterMaxLevel = 13, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Vesper Strait", Planet = "Venus Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 21, MaxLevel = 24, Tier = "VenusProximaOrphix", FighterMinLevel = 12, FighterMaxLevel = 16, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Luckless Expanse", Planet = "Venus Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 19, MaxLevel = 22, Tier = "VenusProximaSurvival", FighterMinLevel = 9, FighterMaxLevel = 13, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Falling Glory", Planet = "Venus Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 23, MaxLevel = 26, Tier = "VenusProximaDefense", FighterMinLevel = 14, FighterMaxLevel = 18, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},

        { Node = "Lupal Pass", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 48, MaxLevel = 56, Tier = "SaturnProxima", FighterMinLevel = 22, FighterMaxLevel = 26, MaxFighters = 60, MaxCrewships = 4, Objectives = 1},
        { Node = "Mordo Cluster", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 55, MaxLevel = 60, Tier = "SaturnProxima", FighterMinLevel = 24, FighterMaxLevel = 26, MaxFighters = 60, MaxCrewships = 4, Objectives = 1},
        { Node = "Nodo Gap", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 54, MaxLevel = 60, Tier = "SaturnProxima", FighterMinLevel = 22, FighterMaxLevel = 25, MaxFighters = 60, MaxCrewships = 4, Objectives = 1},
        { Node = "Kasio's Rest", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 70, MaxLevel = 75, Tier = "SaturnProxima", FighterMinLevel = 30, FighterMaxLevel = 33, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, ObjectiveDetails = '1 is an Asteroid Assassinate'},
        { Node = "Vand Cluster", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 65, MaxLevel = 70, Tier = "SaturnProxima", FighterMinLevel = 29, FighterMaxLevel = 32, MaxFighters = 90, MaxCrewships = 6, Objectives = 1},

        { Node = "Arva Vector", Planet = "Neptune Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 25, MaxLevel = 28, Tier = "NeptuneProximaDefense", FighterMinLevel = 18, FighterMaxLevel = 20, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Nu-Gua Mines", Planet = "Neptune Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 27, MaxLevel = 30, Tier = "NeptuneProxima", FighterMinLevel = 20, FighterMaxLevel = 24, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Enkidu Ice Drifts", Planet = "Neptune Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 29, MaxLevel = 32, Tier = "NeptuneProximaSurvival", FighterMinLevel = 23, FighterMaxLevel = 28, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Mammon's Prospect", Planet = "Neptune Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 31, MaxLevel = 34, Tier = "NeptuneProximaOrphix", FighterMinLevel = 27, FighterMaxLevel = 32, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Sovereign Grasp", Planet = "Neptune Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 33, MaxLevel = 36, Tier = "NeptuneProximaVolatile", FighterMinLevel = 31, FighterMaxLevel = 36, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Brom Cluster", Planet = "Neptune Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 25, MaxLevel = 28, Tier = "NeptuneProximaSpy", FighterMinLevel = 18, FighterMaxLevel = 20, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},

        { Node = "Khufu Envoy", Planet = "Pluto Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 35, MaxLevel = 38, Tier = "PlutoProximaOrphix", FighterMinLevel = 32, FighterMaxLevel = 35, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Seven Sirens", Planet = "Pluto Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 37, MaxLevel = 40, Tier = "PlutoProxima", FighterMinLevel = 45, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Obol Crossing", Planet = "Pluto Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 39, MaxLevel = 42, Tier = "PlutoProximaDefense", FighterMinLevel = 45, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Fenton’s Field", Planet = "Pluto Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 35, MaxLevel = 38, Tier = "PlutoProximaSurvival", FighterMinLevel = 32, FighterMaxLevel = 35, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Profit Margin", Planet = "Pluto Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 41, MaxLevel = 44, Tier = "PlutoProximaVolatile", FighterMinLevel = 45, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Peregrine Axis", Planet = "Pluto Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 43, MaxLevel = 46, Tier = "PlutoProximaSpy", FighterMinLevel = 44, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},

        { Node = "Nsu Grid", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, Tier = "VeilProxima", FighterMinLevel = 32, FighterMaxLevel = 35, MaxFighters = 90, MaxCrewships = 6, Objectives = 2},
        { Node = "R-9 Cloud", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, Tier = "VeilProxima", FighterMinLevel = 40, FighterMaxLevel = 43, MaxFighters = 90, MaxCrewships = 6, Objectives = 2},
        { Node = "H-2 Cloud", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, Tier = "VeilProxima", FighterMinLevel = 38, FighterMaxLevel = 41, MaxFighters = 90, MaxCrewships = 6, Objectives = 2},
        { Node = "Flexa", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, Tier = "VeilProxima", FighterMinLevel = 36, FighterMaxLevel = 39, MaxFighters = 90, MaxCrewships = 6, Objectives = 2},
        { Node = "Calabash", Planet = "Veil Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 45, MaxLevel = 49, Tier = "VeilProximaExterminate", FighterMinLevel = 45, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Numina", Planet = "Veil Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 48, MaxLevel = 52, Tier = "VeilProximaVolatile", FighterMinLevel = 48, FighterMaxLevel = 52, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Arc Silver", Planet = "Veil Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 51, MaxLevel = 55, Tier = "VeilProximaDefense", FighterMinLevel = 51, FighterMaxLevel = 55, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Erato", Planet = "Veil Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 54, MaxLevel = 58, Tier = "VeilProximaOrphix", FighterMinLevel = 55, FighterMaxLevel = 49, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Lu-Yan", Planet = "Veil Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 57, MaxLevel = 60, Tier = "VeilProximaSurvival", FighterMinLevel = 59, FighterMaxLevel = 62, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
        { Node = "Sabmir Cloud", Planet = "Veil Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 57, MaxLevel = 60, Tier = "VeilProximaSpy", FighterMinLevel = 59, FighterMaxLevel = 62, MaxFighters = 0, MaxCrewships = 0, Objectives = 0},
    },
    by={Name={}},dictionary={},
    vars={
        'Node',
        'Enemy',
        'Planet',
        'Type',
        'Tileset',
        'Tier',
        'LinkName',
        'Drops',
        'Pic',

        'ObjectiveDetails',
    },
}

table.sort(MissionData["MissionDetails"],function(a,b)
    return a.MinLevel<b.MinLevel or (a.MinLevel==b.MinLevel and a.MaxLevel<b.MaxLevel) end)



for i, obj in ipairs(MissionData["MissionDetails"]) do
    obj.IsDarkSector = obj.IsDarkSector and 1 or 0
    obj.IsCrossfire = type(obj.Enemy)==type{} and (obj.Enemy["1"]~='Infested') and 1 or 0

    MissionData.by.Name[obj.Node]=obj

    if not obj.IgnoreInList then
        for valname, v in pairs(obj) do
                if not MissionData.by[valname] then
                    MissionData.by[valname] = {}
                end
            for i, val in ipairs(type(v) == 'table' and v or {v}) do
                if not MissionData.by[valname][val] then
                    MissionData.by[valname][val] = {}
                end

                table.insert(MissionData.by[valname][val], obj)

                if type(val)~='number' and val~='Capture' then
                    if not MissionData.dictionary[val] then
                        MissionData.dictionary[val] = valname
                    elseif MissionData.dictionary[val] ~= valname then
                        local order =
                        MissionData.vars
                        for i,v in ipairs(order) do order[i]=nil; order[v]=i end
                        MissionData.dictionary[val] =
                (order[valname] or #order+1) < (order[MissionData.dictionary[val]] or #order+1)
                        and valname or MissionData.dictionary[val]
                    end
                end
            end
        end
    end
    obj.id = i
    obj.FactionImage = obj.Pic or MissionData.FactionImages[type(obj.Enemy)==type{} and (obj.Enemy["1"]~='Infested' and 'Crossfire' or 'Infested') or obj.Enemy]
end
MissionData.dictionary.Capture='Type'
for k in pairs(MissionData.by) do table.insert(MissionData.vars,k) end









return MissionData
